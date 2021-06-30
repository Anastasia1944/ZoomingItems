//
//  ImagePicker.swift
//  ZoomingItems
//
//  Created by Анастасия Горячевская on 29.06.2021.
//

import UIKit
import Alamofire

class ImagePicker {
    
    
    var successDownload: ( (Picture) -> Void )?
    
    private var downloadedImage = Picture(name: "", pic: UIImage())
    
    init() { }
    
    func downloadImage(imageName:String, imageURL: String) {
        self.downloadedImage.name = imageName
        AF.download(imageURL)
            .downloadProgress { progress in
                print("Download Progress: \(progress.fractionCompleted)")
            }
            .responseData { response in
                if response.error == nil, let imagePath = response.fileURL?.path {
                    self.downloadedImage.pic = UIImage(contentsOfFile: imagePath)!
                    self.successDownload?(self.downloadedImage)
                }
            }
    }
    
    func getDownloadedImage() -> Picture? {
        return downloadedImage
    }
    
}
