import ObjectMapper

class BaseResponse: Mappable {
    
    var error: RestError?
    var response: Any?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        error           <- map["error"]
        response        <- map["response"]
    }
    
    func isSuccess() -> Bool {
        return error == nil
    }
}

