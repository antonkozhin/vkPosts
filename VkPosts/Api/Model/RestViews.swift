import ObjectMapper

class RestViews: Mappable {
    
    var count: Int!
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        count                   <- map["count"]
    }
    
}



