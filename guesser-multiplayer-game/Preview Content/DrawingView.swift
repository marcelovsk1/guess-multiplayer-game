//
//  DrawingView.swift
//  guesser-multiplayer-game
//
//  Created by Marcelo Amaral Alves on 2023-10-16.
//

import SwiftUI
import PencilKit

struct DrawingView: UIViewRepresentable {
    var canvasView = PKCanvasView()
    
    @ObservedObject var matchManager: MatchManager
    @Binding var eraserEnabled: Bool
}
    
@State static var eraser = false
#Preview {
    DrawingView(matchManager: MatchManager(), eraserEnabled: <#Binding<Bool>#>)
}
