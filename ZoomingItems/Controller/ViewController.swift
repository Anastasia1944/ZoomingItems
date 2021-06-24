//
//  ViewController.swift
//  ZoomingItems
//
//  Created by Анастасия Горячевская on 17.06.2021.
//

import UIKit

class ViewController: UITableViewController {
    
    var picturesDataSource = PicturesDataSource()
    var picName = "alaska"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


        //self.performSegue(withIdentifier: "goToPics", sender: self)
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        picName = picturesDataSource.picture(at: indexPath).pic_name
        
        self.performSegue(withIdentifier: "goToPics", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToPics" {
            let destinationVC = segue.destination as! PicturesViewController
            destinationVC.myImage = UIImage(named: picName)!
        }
    }
}

extension ViewController {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { picturesDataSource.numberOfPictures() }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "PictureCell", for: indexPath) as! PictureTableViewCell
    
    
    cell.picture = picturesDataSource.picture(at: indexPath)
    return cell
  }
}

