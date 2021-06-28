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
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
