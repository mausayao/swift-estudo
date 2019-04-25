//
//  Meal.swift
//  eggplant-brownie
//
//  Created by Maurício de Freitas Sayão on 19/04/19.
//  Copyright © 2019 Maurício de Freitas Sayão. All rights reserved.
//

import Foundation

class Meal: NSCoding {
   
    let names: String
    let happiness: Int
    let items: Array<Item>
    
    init(names: String, happiness: Int, items: Array<Item> = []) {
        self.names = names
        self.happiness = happiness
        self.items = items
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.names = aDecoder.decodeObject(forKey: "name") as! String
        self.happiness = aDecoder.decodeInteger(forKey: "happiness")
        self.items = aDecoder.decodeObject(forKey: "items") as! Array
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.names, forKey: "name")
        aCoder.encode(self.happiness, forKey: "happiness")
        aCoder.encode(self.items, forKey: "items")
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
