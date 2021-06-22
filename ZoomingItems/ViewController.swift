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
    
    @IBAction func handlePan(_ gesture: UIPanGestureRecognizer) {
      let translation = gesture.translation(in: view)

      guard let gestureView = gesture.view else {
        return
      }

      gestureView.center = CGPoint(
        x: gestureView.center.x + translation.x,
        y: gestureView.center.y + translation.y
      )

      gesture.setTranslation(.zero, in: view)
    }


}

