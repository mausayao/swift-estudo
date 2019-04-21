//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Maurício de Freitas Sayão on 15/04/19.
//  Copyright © 2019 Maurício de Freitas Sayão. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField?
    @IBOutlet weak var happinessField: UITextField?
    var delegate: ViewControllerDelegate?
    
    @IBAction func add(_ sender: Any) {
        if nameField == nil || happinessField == nil {
            return
        }
        let name = nameField!.text!
        if let happiness = Int(happinessField!.text!){
            let meal = Meal(names: name, happiness: happiness)
            print("comi \(String(describing: meal.names)) e happy \(String(describing: meal.happiness))")
            
            if(delegate == nil){
                return
            }
            
            delegate!.add(meal)
            
            if let navigation = navigationController{
                navigation.popViewController(animated: true)
            }
        }
       
    }
    
}

