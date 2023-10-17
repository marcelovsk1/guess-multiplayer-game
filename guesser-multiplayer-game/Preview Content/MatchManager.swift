//
//  MatchManager.swift
//  guesser-multiplayer-game
//
//  Created by Marcelo Amaral Alves on 2023-10-15.
//

import Foundation
import GameKit
import PencilKit
import Combine

class MatchManager: NSObject, ObservableObject {
   
    @Published var inGame = false
    @Published var inGameOver = false
    @Published var authenticaitonState = PlayerAuthState.authenticating
    
    @Published var currentlyDrawing = true
    @Published var drawPrompt = "Dishwasher"
    @Published var pastGuesses = [PastGuess]()
    
    @Published var score = 0
    @Published var remainingTime = maxTimeRemaining
    @Published var lastReceivedDrawing = PKDrawing()
    @Published var isTimeKepper = false
    
    var match: GKMatch?
    var otherPlayer: GKPlayer?
    var localPLayer = GKLocalPlayer.local
    
    var playerUUIDKey = UUID().uuidString
    
    var rootViewController: UIViewController? {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        return windowScene?.windows.first?.rootViewController
    }
    
    func authenticateUser() {
        GKLocalPlayer.local.authenticateHandler = { [self] vc, e in
            if let viewController = vc {
                rootViewController?.present(viewController, animated: true)
                return
            }
            
            if let error = e {
                authenticaitonState = .error
                print(error.localizedDescription)
                
                return
            }
            if localPLayer.isAuthenticated {
                if localPLayer.isMultiplayerGamingRestricted {
                    authenticaitonState = .restricted
                } else {
                    authenticaitonState = .authenticated
                }
            } else {
                authenticaitonState = .unauthenticated
            }
        }
    }
    func startMatchMaking() {
        let request = GKMatchRequest()
        request.minPlayers = 2
        request.maxPlayers = 2
        
        let matchmakingVC = GKMatchmakerViewController(matchRequest: request)
//        matchmakingVC?.matchmakerDelegate = self
        
        rootViewController?.present(matchmakingVC!, animated: true)
    }
    
    func startGame(newMatch: GKMatch) {
        match = newMatch
        match?.delegate = self
        otherPlayer = match?.players.first
        drawPrompt = everydayObjects.randomElement()!
        
        sendString("began:\(playerUUIDKey)")
    }
    
    func receivedString(_ message: String) {
        let messageSplit = message.split(separator: ".")
        guard let messagePrefix = messageSplit.first else { return }
        
        let parameter = String(messageSplit.last ?? "")
        
        switch messagePrefix {
        case "began":
            if playerUUIDKey == parameter {
                playerUUIDKey = UUID().uuidString
                sendString("began:\(playerUUIDKey)")
                break
            }
            currentlyDrawing = playerUUIDKey < parameter
            inGame = true
            isTimeKepper = true
            
            if isTimeKepper {
                countdownTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

            }
        default:
            break
        }
    }
}
