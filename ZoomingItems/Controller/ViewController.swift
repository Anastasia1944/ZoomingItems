//
//  ViewController.swift
//  ZoomingItems
//
//  Created by Анастасия Горячевская on 17.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var picturesDataSource = PicturesDataSource()
    var picName = "alaska"
    
    override func loadView() {
        super.loadView()
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        picName = picturesDataSource.picture(at: indexPath).pic_name
        
        self.performSegue(withIdentifier: SegueIdentifiers.toImageViewer, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIdentifiers.toImageViewer {
            let destinationVC = segue.destination as! PicturesViewController
            destinationVC.myImage = UIImage(named: picName)!
        }
    }
}

