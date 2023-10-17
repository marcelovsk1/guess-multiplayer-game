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
    @State var eraserEnabled = false
    
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
                        DrawingView(matchManager: matchManager, eraserEnabled: $eraserEnabled)
                            .aspectRatio(1, contentMode: .fit)
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(.black, lineWidth:10))
                        
                        VStack {
                            HStack{
                                Spacer()
                                
                                if matchManager.currentlyDrawing {
                                    Button {
                                        eraserEnabled.toggle()
                                    } label: {
                                        Image(systemName: eraserEnabled ?
                                              "eraser.fill" : "eraser")
                                        .font(.title)
                                        .foregroundColor(.purple)
                                        .padding(.top, 10)
                                    }
                                }
                            }
                            
                            Spacer()
                        }
                        .padding()
                    }
                    pastGuesses
                }
                .padding(.horizontal, 30)
                .ignoresSafeArea(.keyboard, edges: .bottom)
            }
            VStack {
                Spacer()
                
                promptGroup
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
                        .foregroundColor(.purple)
                }
                Spacer()
                
                Label("\(matchManager.remainingTime)",
                      systemImage: "clock.fill")
                .bold()
                .font(.title2)
                .foregroundColor(.purple)
            }
        }
        .padding(.vertical, 15)
    }
    
    var pastGuesses: some View {
        ScrollView {
            ForEach(matchManager.pastGuesses) { guess in
                HStack {
                    Text(guess.message)
                        .font(.title2)
                        .bold(guess.correct)
                    
                    if guess.correct {
                        Image(systemName: "hand.thumbsup.fill")
                            .foregroundColor(matchManager.currentlyDrawing ?
                                             Color(red: 0.808, green: 0.345, blue: 0.776) :
                                                Color(red: 0.243, green: 0.773, blue: 0.745)
                            )
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom, 1)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            (matchManager.currentlyDrawing ?
             Color(red: 0.100, green: 0.345, blue: 0.776) :
                Color(red: 0.100, green: 0.773, blue: 0.745)
            )
            .brightness(-0.2)
            .opacity(0.5)
        )
        .cornerRadius(20)
        .padding(.vertical)
        .padding(.bottom, 130)
        
    }
    
    var promptGroup: some View {
        VStack {
            if matchManager.currentlyDrawing {
                Label("DRAW:", systemImage: "exclamationmark.bubble.fill")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.purple)
                Text(matchManager.drawPrompt.uppercased())
                    .font(.largeTitle)
                    .bold()
                    .padding()
                    .foregroundColor(.purple)
                
            } else {
                HStack {
                    Label("GUESS THE DRAWING!:", systemImage:
                            "exclamationmark.bubble.fill")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.purple)
                    
                    Spacer()
                }
                Button {
                    makeGuess()
                } label: {
                    
                }
                
            }
        }
    }
}

#Preview {
    GameView(matchManager: MatchManager())
}
