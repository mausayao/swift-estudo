//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Maurício de Freitas Sayão on 15/04/19.
//  Copyright © 2019 Maurício de Freitas Sayão. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddAnItemDelegate{

    @IBOutlet weak var nameField: UITextField?
    @IBOutlet weak var happinessField: UITextField?
    var delegate: AddMealDelegate?
    
    var items = [Item(name: "Feijão", calories: 30),
                Item(name: "Arroz", calories: 10),
                Item(name: "Chocolate", calories: 30),
                Item(name: "Macarrão", calories: 10),
                Item(name: "Carne", calories: 30),
                Item(name: "Ovo", calories: 10),
                Item(name: "Oleo", calories: 30),
                Item(name: "Azeite", calories: 10)
                 ]
    var selected = Array<Item>()
    @IBOutlet weak var tableView: UITableView?
    
    func add(_ item: Item) {
        items.append(item)
        if let table = tableView{
            table.reloadData()
        } else {
            Alert(controller: self).show(message: "Não foi possivel carregar os dados.")
        }
       
    }
    
    override func viewDidLoad() {
        let newItemButton = UIBarButtonItem(title: "novo item", style: UIBarButtonItem.Style.plain, target: self, action: #selector(viewNewItem))
        navigationItem.rightBarButtonItem = newItemButton
    }
    
    @objc func viewNewItem() {
        let itemViewController = ItemViewController(delegate: self)
        if let navigation = navigationController {
            navigation.pushViewController(itemViewController, animated: true)
        } else {
            Alert(controller: self).show()
        }
    }
    
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
                let row  = indexPath.row
                selected.append(items[row])
            } else {
                cell.accessoryType = UITableViewCell.AccessoryType.none
                let item = items[indexPath.row]
                if let position = selected.firstIndex(of: item) {
                    selected.remove(at: position)
                }
            }
        }
    }
    
    @IBAction func add(_ sender: Any) {
        if nameField == nil || happinessField == nil {
            return
        }
        let name = nameField!.text!
        if let happiness = Int(happinessField!.text!){
            let meal = Meal(names: name, happiness: happiness, items: selected)
            print("comi \(String(describing: meal.names)) e happy \(String(describing: meal.happiness)) items -> \(meal.items)")
            
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

