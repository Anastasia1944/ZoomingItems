//
//  PicturesDataSource.swift
//  ZoomingItems
//
//  Created by Анастасия Горячевская on 23.06.2021.
//

import UIKit

class PicturesDataSource: NSObject {
    
  var pictures: [Picture]

  static func generatePicturesData() -> [Picture] {
    return [Picture(name: "baikal", pic_name: "baikal"),
            Picture(name: "alaska", pic_name: "10"),
            Picture(name: "corgi", pic_name: "corgi")]
  }
    

  override init() {
    pictures = PicturesDataSource.generatePicturesData()
  }

  func numberOfPictures() -> Int {
    pictures.count
  }

  func append(picture: Picture, to tableView: UITableView) {
    pictures.append(picture)
    tableView.insertRows(at: [IndexPath(row: pictures.count-1, section: 0)], with: .automatic)
  }

  func picture(at indexPath: IndexPath) -> Picture {
    pictures[indexPath.row]
  }
}
