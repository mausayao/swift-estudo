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
    
    override func viewDidLoad() {
        let file = getPath().absoluteString
        print(file)
            if let loaded = NSKeyedUnarchiver.unarchiveObject(withFile: file) {
                self.meals = loaded as! Array<Meal>
            } else {
                 Alert(controller: self).show()
        }
    }
    
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
                RemoveMealViewController(viewController: self).show(meal, handler: {action in
                    self.meals.remove(at: row)
                    self.tableView.reloadData()
                })
            }
        }
    }
    
    func add(_ meal: Meal) {
        meals.append(meal)
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: meal, requiringSecureCoding: false)
            let file = getPath()
            try data.write(to: file)
        } catch {
            Alert(controller: self).show()
        }
        
        tableView.reloadData()
    }
    
    func getPath() -> URL {
        let userPaths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documents = userPaths[0]
        let archive = "eggplant-brownie-meals.dados"
        let file = documents.appendingPathComponent(archive)
        
        return file
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "addMeal"){
            let viewController = segue.destination as! ViewController
            viewController.delegate = self
        }
    }
}
