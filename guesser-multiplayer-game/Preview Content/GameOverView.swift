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
//                    .font(Font.custom("Doodle", size: 55.0))
//                    .font(Font.custom("Doodles", size: 50.0))
                    .font(.title)
                    .bold()
                    .foregroundColor(.yellow)
                
                Spacer()
                
                Button {
                    matchManager.match?.disconnect()
                    matchManager.restGame()
                } label: {
                    Text("Menu")
                        .foregroundColor(.red)
                        .font(Font.custom("Zuka Doodle", size: 55.0))
                        .brightness(-0.4)
                        .bold()
                
                }
                .padding(.vertical, 20)
                .padding(.horizontal, 100)
                .background(
                    Capsule(style: .circular)
                        .fill(Color(.yellow))
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
