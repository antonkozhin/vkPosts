import ObjectMapper

class RestPhotoAttachment: Mappable {
    
    var id: Int!
    var albumId: Int!
    var ownerId: Int!
    var userId: Int!
    var sizes: [RestPhotoSize]!
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id                  <- map["id"]
        albumId             <- map["album_id"]
        ownerId             <- map["owner_id"]
        userId              <- map["user_id"]
        sizes               <- map["sizes"]
    }
    
}
