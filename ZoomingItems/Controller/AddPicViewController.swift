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
    
    var imagePicker: ImagePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addImageButtonPressed(_ sender: UIButton) {
        let imageName = picNameTextField.text!
        let imageLink = picLinkTextField.text!
        
        imagePicker?.downloadImage(imageName: imageName, imageURL: imageLink)
        navigationController?.popViewController(animated: true)
    }
}
