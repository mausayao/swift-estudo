//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Maurício de Freitas Sayão on 15/04/19.
//  Copyright © 2019 Maurício de Freitas Sayão. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var nameField: UITextField?
    @IBOutlet weak var happinessField: UITextField?
    var delegate: AddMealDelegate?
    
    var items = [Item(name: "Feijão", calories: 30),
                Item(name: "Arroz", calories: 10)
                 ]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let item = items[row]
        let cel = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        cel.textLabel!.text = item.name
        return cel
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if(cell.accessoryType == UITableViewCell.AccessoryType.none){
                cell.accessoryType = UITableViewCell.AccessoryType.checkmark
            } else {
                cell.accessoryType = UITableViewCell.AccessoryType.none
            }
        }
    }
    
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

