//
//  GameView.swift
//  TicTocGame
//
//  Created by Berke Kaçar on 25.08.2024.
//

import SwiftUI

struct GameView: View {
    
    @StateObject var gameState = GameState()
    var body: some View {
        VStack(spacing: 50){
            HStack{
                Text("Turn \(gameState.turn)")
                    .font(.system(size: 30))
                    .bold()
            }
            VStack(spacing: 5){
                ForEach(0...2, id: \.self){
                    row in
                    HStack(spacing: 5){
                        ForEach(0...2, id: \.self){
                            column in
                            
                            let cell = gameState.board[row][column]
                            
                            Text(cell.displayTile())
                                .font(.system(size: 60))
                                .foregroundStyle(cell.tileColor())
                                .bold()
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .aspectRatio(1,contentMode: .fit)
                                .background(Color.white)
                                .onTapGesture {
                                    gameState.placeTile(row: row, column: column)
                                }
                        }
                    }
                }
            }.background(Color.black)
                .padding()
                .alert(isPresented: $gameState.showAlert){
                    Alert(
                        title: Text("Oyun Bitti"),
                        dismissButton: .default(Text("Okey")){
                            gameState.resetBoard()
                        }
                    )
                }
        }
    }
    
}

#Preview {
    GameView()
}
