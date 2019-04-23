//
//  MealsTableViewController.swift
//  eggplant-brownie
//
//  Created by Maurício de Freitas Sayão on 20/04/19.
//  Copyright © 2019 Maurício de Freitas Sayão. All rights reserved.
//

import UIKit

class MealsTableViewController: UITableViewController, AddMealDelegate {
    var meals = [Meal(names: "Feijão com arroz", happiness: 5),
    Meal(names: "Bolo de cenoura", happiness: 3)]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        cell.textLabel!.text = meal.names
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(showDetail))
        cell.addGestureRecognizer(longPress)
        
        return cell
    }
    
    @objc func showDetail(recognizer: UILongPressGestureRecognizer) {
        if(recognizer.state == UILongPressGestureRecognizer.State.began){
            let cell = recognizer.view as! UITableViewCell
            if let indexPath = tableView.indexPath(for: cell) {
                let row = indexPath.row
                let meal = meals[row]
                alert(meal: meal)
            }
        }
    }
    
    func alert(meal: Meal) {
        let alert = UIAlertController(title: meal.names, message: meal.detail(), preferredStyle: UIAlertController.Style.alert)
        
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func add(_ meal: Meal) {
        meals.append(meal)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "addMeal"){
            let viewController = segue.destination as! ViewController
            viewController.delegate = self
        }
    }
}
