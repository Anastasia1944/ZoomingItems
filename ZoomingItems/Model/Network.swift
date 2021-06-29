//
//  Network.swift
//  ZoomingItems
//
//  Created by Анастасия Горячевская on 29.06.2021.
//

import Foundation
import Alamofire

class Network {
    
    var downloadedImage = UIImage(named: "10")
    let destination: DownloadRequest.Destination = { _, _ in
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        print(documentsURL)
        let fileURL = documentsURL.appendingPathComponent("image1.png")

        return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
    }
    
    func downloadImage() {
        AF.download("https://httpbin.org/image/png", to: destination).response { response in
            debugPrint(response)

            if response.error == nil, let imagePath = response.fileURL?.path {
                self.downloadedImage = UIImage(contentsOfFile: imagePath)!
            }
        }
    }
    
    func getDownloadedImage() -> UIImage {
        return downloadedImage!
    }
}
