//
//  MatchManager+GKMatchMakerViewControllerDelegate.swift
//  guesser-multiplayer-game
//
//  Created by Marcelo Amaral Alves on 2023-10-17.
//

import Foundation
import GameKit

extension MatchManager: GKMatchmakerViewControllerDelegate {
    func matchmakerViewControllerWasCancelled(_ viewController: GKMatchmakerViewController) {
        viewController.dismiss(animated: true)
        startGame(newMatch: match!)
    }
    
    func matchmakerViewController( _ viewController: GKMatchmakerViewController, didFailWithError error: Error) {
        viewController.dismiss(animated: true)
    }
    
    func matchmakerViewController(_ viewController: GKMatchmakerViewController) {
        viewController.dismiss(animated: true)
    }
}
