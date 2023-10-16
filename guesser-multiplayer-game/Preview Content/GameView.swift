//
//  GameView.swift
//  guesser-multiplayer-game
//
//  Created by Marcelo Amaral Alves on 2023-10-16.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var matchManager: MatchManager
    @State var drawingGuess = ""
    @State var eraserEnabled = ""
    
    func makeGuess() {
        //TODO: Submit the guess
    }
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                Image(matchManager.currentlyDrawing ? "drawBg3" :
                "drawBg2")
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
                .scaleEffect(1.1)
                
                VStack {
                    topBar
                    
                    ZStack {
                        
                    }
                }
                
            }
        }
    }
    var topBar: some View {
        ZStack {
            HStack {
                Button {
                    // TODO: disconnect from the game
                } label: {
                    Image(systemName: "arrowshape.turn.up.left.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
                Spacer()
                
                Label("\(matchManager.remainingTime)",
                    systemImage: "clock.fill")
                    .bold()
                    .font(.title2)
                    .foregroundColor(.white)
            }
        }
        .padding(.vertical, 15)
    }
}

#Preview {
    GameView(matchManager: MatchManager())
}
