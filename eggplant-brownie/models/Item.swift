//
//  Item.swift
//  eggplant-brownie
//
//  Created by Maurício de Freitas Sayão on 19/04/19.
//  Copyright © 2019 Maurício de Freitas Sayão. All rights reserved.
//

import Foundation

class Item: NSObject, NSCoding {
   
    let name:String
    let calories:Double
    
    init(name:String, calories:Double) {
        self.name = name
        self.calories = calories
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "name") as! String
        self.calories = aDecoder.decodeDouble(forKey: "calories")
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.calories, forKey: "calories")
    }

}

func ==(first: Item, second: Item) -> Bool {
    return first.name == second.name && first.calories == second.calories
}
