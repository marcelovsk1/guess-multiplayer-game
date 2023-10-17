//
//  MenuView.swift
//  guesser-multiplayer-game
//
//  Created by Marcelo Amaral Alves on 2023-10-15.
//

import SwiftUI

struct MenuView: View {
    @ObservedObject var matchManager: MatchManager
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("logo3")
                .resizable()
                .scaledToFit()
                .padding(30)
            
            Spacer()
            
            Button {
                matchManager.startMatchMaking()
            } label: {
                Text("START")
                    .font(Font.custom("Zuka Doodle", size: 55.0))
                    .bold()
                    .foregroundColor(.purple)
            }
            .disabled(matchManager.authenticaitonState !=
                .authenticated || matchManager.inGame)
            .padding(.vertical, 20)
            .padding(.horizontal, 100)
            .background(
                Capsule(style: .circular)
                    .fill(matchManager.authenticaitonState !=
                        .authenticated || matchManager.inGame
                          ? .yellow : Color(.purple))
            )
            Text(matchManager.authenticaitonState.rawValue)
                .font(.headline.weight(.semibold))
                .foregroundColor(.black)
                .padding()
            
            Spacer()
        }
        .background(.yellow)
        .ignoresSafeArea()
            
    }
}

#Preview {
    MenuView(matchManager: MatchManager())
}
