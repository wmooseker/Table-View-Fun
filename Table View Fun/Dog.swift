//
//  Dog.swift
//  Table View Fun
//
//  Created by Gina Sprint on 10/18/18.
//  Copyright © 2018 Gina Sprint. All rights reserved.
//

import Foundation

// MARK: - Archiving
// most the Swift standard types conform the Codable protocol
// what we are going to do
// 1. get a URL to a dogs.plist file in the documents directory where we are going to store our Dog array
// the URL is like a file path, except due to the Application Sandbox the URL changes everytime your run your app
// 2. write a method to save the dogs to the URL using a PropertyListEncoder
// 3. write a method to load the dogs from the URL using PropertyListDecoder

class Dog: Codable {
    var name: String
    var breed: String
    // MARK: LAB #21
    var imageName: String
    
    static let dogPListURL: URL = {
       // this is called an initialization closure
        // get a URL to the documents directory
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        // .userDomainMask refers to the user's home directory
        let fileURL = documentsDirectory.appendingPathComponent("dogs").appendingPathExtension("plist")
        return fileURL
    }()
    
    static func saveToFile(dogs: [Dog]) {
        let plistEncoder = PropertyListEncoder()
        
        if let dogsData = try? plistEncoder.encode(dogs) {
            // Data is a byte representation
            // that we can use to write and read to/from disk
            try? dogsData.write(to: dogPListURL)
        }
    }
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
        // MARK: LAB #21
        // Author credit for image
        /*
         <div>Icons made by <a href="http://www.freepik.com" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
        */
        self.imageName = "dog"
    }
    
}
