//
//  Cell.swift
//  TicTocGame
//
//  Created by Berke Kaçar on 25.08.2024.
//

import Foundation
import SwiftUI

struct Cell{
    var tile: Tile
    
    func displayTile() -> String {
        switch(tile){
        case Tile.Nought:
            return "O"
        case Tile.Cross:
            return "X"
        case Tile.Empty:
            return ""
        }
    }
    func tileColor() -> Color {
        switch(tile){
        case Tile.Nought:
            return Color.red
        case Tile.Cross:
            return Color.black
        case Tile.Empty:
            return Color.black
        }
    }
}

enum Tile{
    case Nought
    case Cross
    case Empty
}
