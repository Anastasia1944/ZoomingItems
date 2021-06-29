//
//  ImagePicker.swift
//  ZoomingItems
//
//  Created by Анастасия Горячевская on 29.06.2021.
//

import UIKit
import Alamofire

class ImagePicker {
    private var downloadedImage = Picture(name: "", pic: UIImage())
    
    let destination: DownloadRequest.Destination = { _, _ in
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = documentsURL.appendingPathComponent("image.png")

        return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
    }
    
    func downloadImage(imageName:String, imageURL: String) {
        self.downloadedImage.name = imageName
        AF.download(imageURL, to: destination)
            .downloadProgress { progress in
            print("Download Progress: \(progress.fractionCompleted)")
        }
        .response { response in
            debugPrint(response)

            if response.error == nil, let imagePath = response.fileURL?.path {
                self.downloadedImage.pic = UIImage(contentsOfFile: imagePath)!
            }
        }
    }
    
    func getDownloadedImage() -> Picture? {
        return downloadedImage
    }

}
