//
//  MatchManager.swift
//  guesser-multiplayer-game
//
//  Created by Marcelo Amaral Alves on 2023-10-15.
//

import Foundation
import GameKit
import PencilKit

class MatchManager: ObservableObject {
    @Published var inGame = false
    @Published var inGameOver = false
    @Published var authenticaitonState = PlayerAuthState.authenticating
    
    @Published var currentlyDrawing = true
    @Published var drawPrompt = "Dishwasher"
    @Published var pastGuesses = [PastGuess]()
    
    @Published var score = 0
    @Published var remainingTime = maxTimeRemaining
    
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
}
