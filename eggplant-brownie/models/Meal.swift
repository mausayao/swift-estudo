//
//  Meal.swift
//  eggplant-brownie
//
//  Created by Maurício de Freitas Sayão on 19/04/19.
//  Copyright © 2019 Maurício de Freitas Sayão. All rights reserved.
//

import Foundation

class Meal {
    let names: String
    let happiness: Int
    let items: Array<Item>
    
    init(names: String, happiness: Int, items: Array<Item> = []) {
        self.names = names
        self.happiness = happiness
        self.items = items
    }
    
    func getAllCalories() -> Double {
        var total = 0.0
        for item in self.items {
            total += item.calories
        }
        return total
    }
    
    func detail() -> String{
        var message = self.names
        for item in self.items {
            message += "\nNome:\(item.name), Calorias: \(item.calories)"
        }
        
        return message
    }
}
