//
//  PicCoding.swift
//  ZoomingItems
//
//  Created by Анастасия Горячевская on 01.07.2021.
//

import Foundation

class PicCoding {
    let file = "List.json"
    
    var pictures: [Picture]?
    
    init() {
        pictures = []
        self.decode()
    }
    
    func encode() {
        let encoder = JSONEncoder()
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(file)
            
            do {
                let jsonData = try encoder.encode(pictures)
                try jsonData.write(to: fileURL)
            }
            catch {
                print("error")
            }
        }
    }
    
    func decode(){
        let decoder = JSONDecoder()
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(file)
            do {
                let data = try Data(contentsOf: fileURL)
                let jsonData2 = try decoder.decode([Picture].self, from: data)
                pictures = jsonData2
            }
            catch {
                print("error")
            }
        } else {
            pictures = []
        }
    }
    
}
