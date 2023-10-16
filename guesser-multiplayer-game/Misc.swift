//
//  Misc.swift
//  guesser-multiplayer-game
//
//  Created by Marcelo Amaral Alves on 2023-10-15.
//

import Foundation

let everydayObjects = [
    "chair", "table", "pen", "book", "computer", "cup", "fork", "spoon", "plate", "glasses",
    "lamp", "phone", "shoes", "wallet", "watch", "key", "door", "window", "car", "bicycle",
    "television", "remote", "pillow", "blanket", "clock", "mirror", "toothbrush", "toothpaste", "soap", "shampoo",
    "shirt", "pants", "shoes", "hat", "jacket", "socks", "backpack", "guitar", "piano", "microphone",
    "headphones", "umbrella", "bag", "paper", "notebook", "pencil", "calendar", "map", "magazine", "chair",
    "table", "pen", "book", "computer", "cup", "fork", "spoon", "plate", "glasses",
    "lamp", "phone", "shoes", "wallet", "watch", "key", "door", "window", "car", "bicycle",
    "television", "remote", "pillow", "blanket", "clock", "mirror", "toothbrush", "toothpaste", "soap", "shampoo",
    "shirt", "pants", "shoes", "hat", "jacket", "socks", "backpack", "guitar", "piano", "microphone",
    "headphones", "umbrella", "bag", "paper", "notebook", "pencil", "calendar", "map", "magazine"
]

enum PlayerAuthState: String {
    case authenticating = "Logging in to game..."
    case unauthenticated = "Please sign in to Game Center to play."
    case authenticated = ""
    
    case error = "There was an error loggin into Game Center"
    case restricted = "You're not allowed to play multiplayer games!"
}

struct PastGuess: Identifiable {
    let id = UUID()
    var message: String
    var correct: Bool
}

let maxTimeRemaining = 100
