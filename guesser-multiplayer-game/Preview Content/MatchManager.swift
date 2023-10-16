//
//  MatchManager.swift
//  guesser-multiplayer-game
//
//  Created by Marcelo Amaral Alves on 2023-10-15.
//

import Foundation

class MatchManager: ObservableObject {
    @Published var inGame = false
    @Published var inGameOver = false
    @Published var authenticaitonState = PlayerAuthState.authenticating
    
    @Published var currentlyDrawing = false
    @Published var drawnPrompt = ""
    @Published var pastGuesses = [PastGuess]()
    
    @Published var score = 0
    @Published var remainingTime = maxTimeRemaining
    
}
