//
//  AddPicViewController.swift
//  ZoomingItems
//
//  Created by Анастасия Горячевская on 28.06.2021.
//

import UIKit
import Alamofire

class AddPicViewController: UIViewController {
    
    @IBOutlet weak var picNameTextField: UITextField!
    @IBOutlet weak var picLinkTextField: UITextField!
    @IBOutlet weak var myImageView: UIImageView!
    let network = Network()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        network.downloadImage()
        self.myImageView.image = network.downloadedImage
        print(network.getDownloadedImage())
    }
    
    @IBAction func addImageButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)

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
