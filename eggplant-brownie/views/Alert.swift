//
//  Alert.swift
//  eggplant-brownie
//
//  Created by Maurício de Freitas Sayão on 23/04/19.
//  Copyright © 2019 Maurício de Freitas Sayão. All rights reserved.
//

import Foundation
import UIKit

class Alert {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func show(_ title: String = "Desculpe", message: String = "Erro inesperado!") {
        let alert = UIAlertController(title: "Erro!", message: message, preferredStyle: UIAlertController.Style.alert)
        
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
        
        alert.addAction(action)
        self.controller.present(alert, animated: true, completion: nil)
    }
}
