//
//  DrawingView.swift
//  guesser-multiplayer-game
//
//  Created by Marcelo Amaral Alves on 2023-10-16.
//

import SwiftUI
import PencilKit

struct DrawingView: UIViewRepresentable {
    class Coordinator: NSObject, PKCanvasViewDelegate {
        var matchManager: MatchManager

        init(matchManager: MatchManager) {
            self.matchManager = matchManager
        }

        func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
            // Implemente a lógica apropriada aqui, se necessário.
        }
    }
             
    var canvasView = PKCanvasView()
    
    @ObservedObject var matchManager: MatchManager
        @Binding var eraserEnabled: Bool

        func makeUIView(context: Context) -> PKCanvasView {
            let canvasView = PKCanvasView()
            canvasView.drawingPolicy = .anyInput
            canvasView.tool = PKInkingTool(.pen, color: .black, width: 5)
            canvasView.delegate = context.coordinator
            canvasView.isUserInteractionEnabled = matchManager.currentlyDrawing

            return canvasView
        }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(matchManager: matchManager)
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        //TODO: Handle varius updates
        
        canvasView.tool = eraserEnabled ?
        PKEraserTool(.vector) : PKInkingTool(.pen, color: .black, width: 5)
    }
}
    
//#Preview {
//    @State var eraser = false
//    DrawingView(matchManager: MatchManager(), eraserEnabled: $eraser)
//}

struct DrawingView_Previews: PreviewProvider {
    @State static var eraser = false
    static var previews: some View {
        DrawingView(matchManager: MatchManager(),
        eraserEnabled: $eraser)
    }
}
