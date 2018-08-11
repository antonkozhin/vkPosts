import ObjectMapper

class RestReposts: Mappable {
    
    var count: Int!
    var isUserReposted: Bool!
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        count                   <- map["count"]
        isUserReposted          <- map["user_reposted"]
    }
    
}
