import UIKit
protocol ImageProtocol {
    var data: Data { get }
    init(data:Data)
}

protocol Base64Encoding: ImageProtocol {
    var base64Encoded: String? { get }
}

protocol ImageEncoding: ImageProtocol {
    var jpegData: Data? { get }
    var pngData: Data? { get }
    var initSerial:String { get set}
}

protocol ImagePersistance: ImageProtocol {
    func load(from url: URL) -> Self?
    func save(to url: URL) throws
}
class EncodableImage: ImageEncoding {
    var initSerial: String
    
    var jpegData: Data?
    
    var pngData: Data?
    
    var data: Data
    
    required init(data: Data) {
        self.data = data
        initSerial = "empty"
    }
}

class Base64EncodablePersistableImage: Base64Encoding, ImageEncoding {
    private var initData = "first"
    var initSerial:String {
        get {
            return initData
        }
        set {
            self.initData = newValue
        }
    }
    
    var data: Data
    
    required init(data: Data) {
        self.data = data
    }
}

// default behavior. Important to set calculated property to Optional (?) type.
//Because otherwise ini() is required, and that will trumph the default property in the extension.
extension Base64Encoding {
    var base64Encoded:String? {
        return "hi from Base64Encoding extension"
    }
}
extension ImageEncoding {
    // Notice: it is not possible for a Swift extension to contain stored property (e.g. var name = "Anna")
    // Therefore it is also not possible to define a property with {set} because that would normally require access
    // to some stored property. 
    
    var jpegData:Data? {
        guard let uiImage = UIImage.init(data: self.data),
            let jpegData = uiImage.jpegData(compressionQuality: 1.0) else {
        return nil
        }
        return jpegData
    }
    
    var pngData:Data? {
        guard let uiImage = UIImage.init(data: self.data), let pngData = uiImage.pngData() else {
            return nil
        }
        return pngData
    }
}

var image = Base64EncodablePersistableImage(data: Data())
print(image.base64Encoded!)
image.initSerial = "changed"
print(image.initSerial)









