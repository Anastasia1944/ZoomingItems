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
    
    private var downloadedImage = Picture(name: "", picPath: "")
    
    var destination: DownloadRequest.Destination = { _, _ in
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = documentsURL.appendingPathComponent("image.png")
        
        return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
    }
    
    
    init() { }
    
    func downloadImage(imageName:String, imageURL: String) {
        self.downloadedImage.name = imageName
        picNameDestination(imgName: imageName)
        AF.download(imageURL, to: destination)
            .downloadProgress { progress in
                print("Download Progress: \(progress.fractionCompleted)")
            }
            .responseData { response in
                if response.error == nil, let imagePath = response.fileURL?.path {
                    self.downloadedImage.picPath = imagePath
                    self.successDownload?(self.downloadedImage)
                }
            }
    }
    
    func getDownloadedImage() -> Picture? {
        return downloadedImage
    }
    
    func picNameDestination(imgName: String)  {
        let dest: DownloadRequest.Destination = { _, _ in
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let fileURL = documentsURL.appendingPathComponent("\(imgName).png")
            
            return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
        }
        destination = dest
    }
    
}
