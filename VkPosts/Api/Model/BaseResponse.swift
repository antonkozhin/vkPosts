import ObjectMapper

class BaseResponse: Mappable {
    
    var errorCode: Int!
    var errorMessage: String?
    var response: Any?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        errorCode       <- map["errorCode"]
        errorMessage    <- map["errorMessage"]
        response        <- map["response"]
    }
    
    func isSuccess() -> Bool {
        return errorCode == 0
    }
}

