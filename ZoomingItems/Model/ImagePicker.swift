//
//  ImagePicker.swift
//  ZoomingItems
//
//  Created by Анастасия Горячевская on 29.06.2021.
//

import UIKit
import Alamofire

struct Folders {
    static let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    
    static func picturePath(_ name: String) -> URL {
        Folders.documents.appendingPathComponent("\(name)")
    }
}

class ImagePicker {
    
    var successDownload: ( (String) -> Void )?
    
    func downloadImage(imageName: String, imageURL: String) {
        AF
            .download(imageURL, to: { _, _ in
                let fileURL = Folders.picturePath(imageName)
                return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
            })
            .downloadProgress { progress in
                print("Download Progress: \(progress.fractionCompleted)")
            }
            .responseData { response in
                if response.error == nil {
                    self.successDownload?(imageName)
                }
            }
    }
}
