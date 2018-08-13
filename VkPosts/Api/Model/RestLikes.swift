import ObjectMapper

class RestLikes: Mappable {
    
    var count: Int!
    var isUserLikes: Bool!
    var isCanLike: Bool!
    var isCanPiblish: Bool!
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        count                   <- map["count"]
        isUserLikes             <- map["user_likes"]
        isCanLike               <- map["can_like"]
        isCanPiblish            <- map["can_publish"]
    }
    
}
