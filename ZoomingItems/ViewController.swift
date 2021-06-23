//
//  ViewController.swift
//  ZoomingItems
//
//  Created by Анастасия Горячевская on 17.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    //@IBOutlet weak var myImageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        test_storyboard()
    }
    
    func test_storyboard(){
        //myImageView2.transform = myImageView2.transform.translatedBy(x: 20, y: 20)
    }
    
    @IBAction func handlePan(_ gesture: UIPanGestureRecognizer) {
      let translation = gesture.translation(in: view)

      guard let gestureView = gesture.view else {
        return
      }

      gestureView.center = CGPoint(x: gestureView.center.x + translation.x, y: gestureView.center.y + translation.y)
      gesture.setTranslation(.zero, in: view)
        
        guard gesture.state == .ended else { return }

        let velocity = gesture.velocity(in: view)
        let magnitude = sqrt((velocity.x * velocity.x) + (velocity.y * velocity.y))
        let slideMultiplier = magnitude / 200
        
        let slideFactor = 0.01 * slideMultiplier

        var finalPoint = CGPoint(x: gestureView.center.x + (velocity.x * slideFactor), y: gestureView.center.y + (velocity.y * slideFactor))

        finalPoint.x = min(max(finalPoint.x, 0), view.bounds.width)
        finalPoint.y = min(max(finalPoint.y, 0), view.bounds.height)

        UIView.animate(withDuration: Double(slideFactor * 2), delay: 0, options: .curveEaseOut, animations: {gestureView.center = finalPoint})
        
        
    }
    
    @IBAction func handlePinch(_ gesture: UIPinchGestureRecognizer) {
        guard let gestureView = gesture.view else { return }
        gestureView.transform = gestureView.transform.scaledBy(x: gesture.scale, y: gesture.scale)
        gesture.scale = 1
     }
     
     @IBAction func handleRotate(_ gesture: UIRotationGestureRecognizer) {
        guard let gestureView = gesture.view else { return }
        gestureView.transform = gestureView.transform.rotated(by: gesture.rotation)
        gesture.rotation = 0
     }


}

