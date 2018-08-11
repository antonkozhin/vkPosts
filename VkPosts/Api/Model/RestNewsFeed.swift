import ObjectMapper

class RestNewsFeed: Mappable {
    
    var posts: [RestPost]!
    var nextFrom: String!
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        posts                   <- map["items"]
        nextFrom                <- map["next_from"]
    }
    
}
