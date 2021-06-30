//
//  AddPicViewController.swift
//  ZoomingItems
//
//  Created by Анастасия Горячевская on 28.06.2021.
//

import UIKit

class AddPicViewController: UIViewController {
    
    @IBOutlet weak var picNameTextField: UITextField!
    @IBOutlet weak var picLinkTextField: UITextField!

    var imagePicker = ImagePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addImageButtonPressed(_ sender: UIButton) {
        let imageName = picNameTextField.text!
        let imageLink = picLinkTextField.text!

        imagePicker.downloadImage(imageName: imageName, imageURL: imageLink)
        
        self.performSegue(withIdentifier: SegueIdentifiers.backToImageViewer, sender: self)
        //navigationController?.popViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIdentifiers.backToImageViewer {
            let destinationVC = segue.destination as! ViewController
            destinationVC.imagePicker = imagePicker
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
