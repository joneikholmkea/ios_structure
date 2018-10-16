//
//  ImageProtocols.swift
//  iOS_Structure
//
//  Created by Jon Eikholm on 16/10/2018.
//  Copyright © 2018 Jon Eikholm. All rights reserved.
//

import Foundation

protocol ImageProtocol {
    var data: Data { get }
    init(data:Data)
}

protocol Base64Encoding: ImageProtocol {
    var base64Encoded: String { get }
}

protocol ImageEncoding: ImageProtocol {
    var jpegData: Data? { get }
    var pngData: Data? { get }
}

protocol ImagePersistance: ImageProtocol {
    func load(from url: URL) -> Self?
    func save(to url: URL) throws
}
class EncodableImage: ImageEncoding {
    var jpegData: Data?
    
    var pngData: Data?
    
    var data: Data
    
    required init(data: Data) {
        self.data = data
    }
}

class Base64EncodablePersistableImage: Base64Encoding, ImageEncoding {
    var base64Encoded: String
    
    var jpegData: Data?
    
    var pngData: Data?
    
    var data: Data
    
    required init(data: Data) {
        self.data = data
        self.base64Encoded = ""
    }
}

// default behavior
extension Base64Encoding {
    var base64Encoded:String {
        return "hi from Base64Encoding extension"
    }
}



