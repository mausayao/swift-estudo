//
//  ItemViewController.swift
//  eggplant-brownie
//
//  Created by Maurício de Freitas Sayão on 21/04/19.
//  Copyright © 2019 Maurício de Freitas Sayão. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {

    var delegate: AddAnItemDelegate?
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var caloriesInput: UITextField!
    
    init(delegate: AddAnItemDelegate){
        super.init(nibName: "ItemViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBAction func add(_ sender: UIButton) {
        if(nameInput == nil || caloriesInput == nil || self.delegate == nil){
            return
        }
        
        let name = nameInput!.text!
        let calories = Double(caloriesInput!.text!)!
        
        delegate!.add(Item(name: name, calories: calories))
        if let navigation = navigationController {
             navigation.popViewController(animated: true)
        }
    }
}
