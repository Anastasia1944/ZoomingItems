//
//  ViewController.swift
//  ZoomingItems
//
//  Created by Анастасия Горячевская on 17.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myImageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        test_storyboard()
    }
    
    func test_storyboard(){
        myImageView2.transform = myImageView2.transform.translatedBy(x: 20, y: 20)
    }

}

