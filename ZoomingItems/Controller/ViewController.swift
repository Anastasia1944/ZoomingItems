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
    
    override func loadView() {
        super.loadView()
        guard let tableView = self.view as? UITableView else { return }
        tableView.delegate = self
        tableView.dataSource = picturesDataSource
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //picturesDataSource.append(picture: Picture(name: "some name", picName: "", picPath: "https://www.fonstola.ru/pic/202010/1920x1080/fonstola.ru-410856.jpg"), to: self.view as! UITableView)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
 
        pic = picturesDataSource.picture(at: indexPath).pic
        
        self.performSegue(withIdentifier: SegueIdentifiers.toImageViewer, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIdentifiers.toImageViewer {
            let destinationVC = segue.destination as! PicturesViewController
            destinationVC.myImage = pic
        }
    }
}

extension ViewController {

  @IBAction func savePictureDetail(_ segue: UIStoryboardSegue) {
    guard
      let addPicViewController = segue.source as? AddPicViewController,
        let picture = addPicViewController.imagePicker.getDownloadedImage()
      else {
        return
    }
    picturesDataSource.append(picture: picture, to: self.view as! UITableView)
  }
}

