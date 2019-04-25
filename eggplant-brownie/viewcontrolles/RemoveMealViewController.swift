//
//  RemoveMealViewController.swift
//  eggplant-brownie
//
//  Created by Maurício de Freitas Sayão on 24/04/19.
//  Copyright © 2019 Maurício de Freitas Sayão. All rights reserved.
//

import Foundation
import UIKit

class RemoveMealViewController {
    
    let viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func show(_ meal: Meal, handler: @escaping (UIAlertAction) -> Void) {
        let alert = UIAlertController(title: meal.names, message: meal.detail(), preferredStyle: UIAlertController.Style.alert)
        
        let delete = UIAlertAction(title: "Deletar", style: UIAlertAction.Style.destructive, handler: handler)
        
        alert.addAction(delete)
        
        let cancel = UIAlertAction(title: "Cancelar", style: UIAlertAction.Style.cancel, handler: nil)
        
        alert.addAction(cancel)
        viewController.present(alert, animated: true, completion: nil)
    }
}
