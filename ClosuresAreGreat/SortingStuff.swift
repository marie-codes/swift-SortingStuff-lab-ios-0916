//
//  SortingStuff.swift
//  ClosuresAreGreat
//
//  Created by Ron Don Volante on 10/25/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation


struct ToyBin {
    
    var ships: [Ship] = []
    var books: [Book] = []
    var bowlingPins: [BowlingPin] = []
    var musicCDs: [MusicCD] = []
    
    // TODO: Implement all of the sort functions (lets organize this toy bin!)
    mutating func sortShips() {
        ships.sorted(by: { (ship1, ship2) -> Bool in
            var emptyShips = [Ship]()
            for (index,ship) in ships.enumerated() {
                if ship.name == "Titanic" {
                    emptyShips.append(ship)
                    ships.remove(at: index)
                }
            }
            if ship1.age > ship2.age { return true } else { return false }
        })
    }

    mutating func sortBooks() {
        books.sorted(by: { $0.name < $1.name })
    }

    mutating func sortBowlingPins() {
        bowlingPins.sorted(by:{ $0.color.rawValue < $1.color.rawValue })
    }

    mutating func sortMusicCDs() {
         musicCDs = musicCDs.sorted(by: { $0.name < $1.name })
            for (index, value) in musicCDs.enumerated() {
                if value.name == "Drake" {
                    let drake = musicCDs.remove(at: index); musicCDs.insert(drake, at: 0)
                }
            }
    }

    mutating func changeColorOfAllPins(to color:Color) {
        bowlingPins = bowlingPins.map({ (pin) -> BowlingPin in
                        let newPin = BowlingPin(name: pin.name, film: pin.film, color: color)
                        return newPin
                    })
            }
    
}

struct Ship {
    var name: String
    var age: Int
}


struct Book {
    var name: String
    var year: Int
    var author: String
}


struct BowlingPin {
    var name: String
    var film: String
    var color: Color
}


extension BowlingPin {
    mutating func changeColor(to color: Color) {
        self.color = color
    }
}


enum Color: Int {
    case red, organe, yellow, green, blue, indigo, violet
}

struct MusicCD {
    var name: String
    var year: Int
    var songs: [String]
}


    
