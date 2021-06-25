//
//  PicturesDataSource.swift
//  ZoomingItems
//
//  Created by Анастасия Горячевская on 23.06.2021.
//

import UIKit

class PicturesDataSource: NSObject {
    
    private var pictures: [Picture]
    
    static func generatePicturesData() -> [Picture] {
        return [Picture(name: "baikal", pic_name: "baikal"),
                Picture(name: "alaska", pic_name: "10"),
                Picture(name: "corgi", pic_name: "corgi"),
                Picture(name: "cat with glasses", pic_name: "cat-with-glasses"),
                Picture(name: "baby elephant", pic_name: "baby-elephant")
        ]
    }
    
    var selectedPicture: Picture? {
        didSet {
            if let selectedPicture = selectedPicture, let index = pictures.firstIndex(of: selectedPicture) {
                selectedPictureIndex = index
            }
        }
    }
    
    var selectedPictureIndex: Int?
    
    override init() {
        pictures = PicturesDataSource.generatePicturesData()
    }
    
    func selectPicture(at indexPath: IndexPath) {
        selectedPicture = pictures[indexPath.row]
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

extension PicturesDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { numberOfPictures()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PictureCell", for: indexPath) as! PictureTableViewCell
        
        cell.picture = picture(at: indexPath)
        return cell
    }
}

