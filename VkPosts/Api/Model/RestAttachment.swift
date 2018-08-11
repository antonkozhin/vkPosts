import ObjectMapper

class RestAttachment: Mappable {
    
    var photo: RestPhotoAttachment!
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        photo           <- map["photo"]
    }
    
}
