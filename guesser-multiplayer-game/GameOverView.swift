//
//  GameOverView.swift
//  guesser-multiplayer-game
//
//  Created by Marcelo Amaral Alves on 2023-10-16.
//

import SwiftUI

struct GameOverView: View {
    @ObservedObject var matchManager: MatchManager
        
        var body: some View {
            VStack {
                Spacer()
                
                Image("gameOver")
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 70)
                    .padding(.vertical)
                
                Text("Score: \(matchManager.score)")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.yellow)
                
                Spacer()
                
                Button {
                    // TODO: Back to menu
                } label: {
                    Text("Menu")
                        .foregroundColor(.yellow)
                        .font(.largeTitle)
                        .brightness(-0.4)
                        .bold()
                
                }
                .padding(.vertical, 20)
                .padding(.horizontal, 100)
                .background(
                    Capsule(style: .circular)
                        .fill(Color(.purple))
                    )
                Spacer()
            }
            .background(.pink)
            .ignoresSafeArea()
                
        }
    }

#Preview {
    GameOverView(matchManager: MatchManager())
}
