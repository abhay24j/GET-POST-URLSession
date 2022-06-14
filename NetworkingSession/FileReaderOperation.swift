//
//  File.swift
//  NetworkingSession
//
//  Created by Abhishek Sinha on 01/05/22.
//

import Foundation

class FileReaderOperation : Operation {
    var fileName : String?
    var type: String?
    init(fileName: String, type: String) {
        self.fileName = fileName
        self.type = type
    }
    override func main() {
        if(isCancelled) {
            return
        }
        guard let fileName = fileName else {
            return
        }
        guard let type = type else {
            return
        }

        if let path = Bundle.main.path(forResource: fileName, ofType: type) {
            print("Started Reading from file \(fileName)")
            
            do {
                   
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                if let userArray: [User] = try? JSONDecoder().decode([User].self, from: data) {
                    print("Reading of data fom file \(fileName) is done ")
                }
                else {
                }
              } catch {
                 
              }
        }
        else {
        }
    }
}
