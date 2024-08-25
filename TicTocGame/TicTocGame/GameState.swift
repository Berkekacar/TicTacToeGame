//
//  GameState.swift
//  TicTocGame
//
//  Created by Berke Kaçar on 25.08.2024.
//

import Foundation

class GameState: ObservableObject{
    @Published var board = [[Cell]]()
    @Published var turn = Tile.Cross
    @Published var showAlert = false
    
    init(){
        resetBoard()
    }
    func placeTile(row : Int, column: Int){
        
        if(board[row][column].tile != Tile.Empty){
            return
        }
        board[row][column].tile = turn == Tile.Cross ? Tile.Cross : Tile.Nought
        
        if (checkForVictory()){
                showAlert = true
        }else{
            turn = turn == Tile.Cross ? Tile.Nought : Tile.Cross
        }
    }

    func checkForVictory() -> Bool{
        if isTurnTile(0, 0) && isTurnTile(1, 0) && isTurnTile(2, 0){
            return true
        }
        if isTurnTile(0, 1) && isTurnTile(1, 1) && isTurnTile(2, 1){
            return true
        }
        if isTurnTile(0, 2) && isTurnTile(1, 2) && isTurnTile(2, 2){
            return true
        }

        if isTurnTile(0, 0) && isTurnTile(0, 1) && isTurnTile(0, 2){
            return true
        }
        if isTurnTile(1, 0) && isTurnTile(1, 1) && isTurnTile(1, 2){
            return true
        }
        if isTurnTile(2, 0) && isTurnTile(2, 1) && isTurnTile(2, 2){
            return true
        }
        
        if isTurnTile(0, 0) && isTurnTile(1, 1) && isTurnTile(2, 2){
            return true
        }
        if isTurnTile(0, 2) && isTurnTile(1, 1) && isTurnTile(2, 2){
            return true
        }
        
        return false
    }
    
    func isTurnTile(_ row: Int,_ column: Int) -> Bool{
        return board[row][column].tile == turn
    }
    
    func resetBoard(){
        var newBoard = [[Cell]]()
        
        for _ in 0...2{
            var row = [Cell]()
            for _ in 0...2{
                row.append(Cell(tile: Tile.Empty))
            }
            newBoard.append(row)
        }
        board = newBoard
    }
}
