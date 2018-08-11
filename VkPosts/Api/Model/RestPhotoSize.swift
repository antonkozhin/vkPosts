import ObjectMapper

class RestPhotoSize: Mappable {
    
    var type: String!
    var url: String!
    var width: Int!
    var height: Int!
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        type                    <- map["type"]
        url                     <- map["url"]
        width                   <- map["width"]
        height                  <- map["height"]
    }
    
}

