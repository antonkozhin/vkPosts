import ObjectMapper

class RestPost: Mappable {
    
    var id: Int!
    var date: Date!
    var text: String!
    var attachments: [RestAttachment]!
    var likes: RestLikes!
    var reposts: RestReposts!
    var views: RestViews!
    
    init() {
        
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id                      <- map["post_id"]
        date                    <- (map["date"], DateTransform())
        text                    <- map["text"]
        attachments             <- map["attachments"]
        likes                   <- map["likes"]
        reposts                 <- map["reposts"]
        views                   <- map["views"]

    }
    
}
