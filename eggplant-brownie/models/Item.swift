//
//  Item.swift
//  eggplant-brownie
//
//  Created by Maurício de Freitas Sayão on 19/04/19.
//  Copyright © 2019 Maurício de Freitas Sayão. All rights reserved.
//

import Foundation

class Item: Equatable {
    let name:String
    let calories:Double
    
    init(name:String, calories:Double) {
        self.name = name
        self.calories = calories
    }
}

func ==(first: Item, second: Item) -> Bool {
    return first.name == second.name && first.calories == second.calories
}
