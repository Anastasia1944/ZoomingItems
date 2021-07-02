//
//  PicturesDataSource.swift
//  ZoomingItems
//
//  Created by Анастасия Горячевская on 23.06.2021.
//

import UIKit

class PicturesDataSource: NSObject {
    
    private var pictures: [String]
    var picCoding = PicCoding()
    
    static func generatePicturesData() -> [String] {
        let picCode = PicCoding()
        return picCode.pictures!
    }
    
    var selectedPicture: String? {
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
    
    func append(picture: String, to tableView: UITableView) {
        pictures.append(picture)
        tableView.insertRows(at: [IndexPath(row: pictures.count-1, section: 0)], with: .automatic)
        picCoding.pictures!.append(picture)
        picCoding.encode()
    }
    
    
    func picture(at indexPath: IndexPath) -> String {
        pictures[indexPath.row]
    }
}

extension PicturesDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberOfPictures()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PictureCell", for: indexPath) as! PictureTableViewCell
        
        cell.picture = picture(at: indexPath)
        return cell
    }
}

