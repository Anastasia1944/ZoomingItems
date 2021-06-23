//
//  ViewController.swift
//  ZoomingItems
//
//  Created by Анастасия Горячевская on 17.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func nextScreenPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToPics", sender: self)
    }
    

}

