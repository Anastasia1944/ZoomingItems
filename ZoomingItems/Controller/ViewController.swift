//
//  ViewController.swift
//  ZoomingItems
//
//  Created by Анастасия Горячевская on 17.06.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate{
    
    var picturesDataSource = PicturesDataSource()
    var pic = UIImage()
    var imagePicker = ImagePicker()
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    
    override func loadView() {
        super.loadView()
        guard let tableView = self.view as? UITableView else { return }
        tableView.delegate = self
        tableView.dataSource = picturesDataSource
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.successDownload = { pic in
            self.picturesDataSource.append(picture: pic, to: self.view as! UITableView)
        }
    }
    
    
    @IBAction func addPicButton(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: SegueIdentifiers.toAddImage, sender: self)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let name = picturesDataSource.picture(at: indexPath)
        let picPath = Folders.picturePath(name)
        pic = UIImage(contentsOfFile: picPath.path) ?? UIImage(named: "10")!
        
        self.performSegue(withIdentifier: SegueIdentifiers.toImageViewer, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIdentifiers.toImageViewer {
            let destinationVC = segue.destination as! PicturesViewController
            destinationVC.myImage = pic
        } else if segue.identifier == SegueIdentifiers.toAddImage {
            let destinationVC = segue.destination as! AddPicViewController
            destinationVC.imagePicker = imagePicker
        }
    }
}

