import ObjectMapper

class RestError: Mappable {
    
    var code: Int!
    var message: String!
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        code                    <- map["error_code"]
        message                 <- map["error_msg"]
    }
    
}
