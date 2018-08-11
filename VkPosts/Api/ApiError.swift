class ApiError: Error {
    
    var code: Int = RequestErrorCode.simple.rawValue
    var message: String
    
    init(message: String) {
        self.message = message
    }
    
    init(code: Int, message: String) {
        self.code = code
        self.message = message
    }
    
}

