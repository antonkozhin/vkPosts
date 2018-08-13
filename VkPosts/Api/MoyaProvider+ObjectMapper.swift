import RxSwift
import Moya
import ObjectMapper

public extension PrimitiveSequence where TraitType == SingleTrait, ElementType == Response {
    
    public func mapObject<T: BaseMappable>(_ type: T.Type) -> Single<T> {
        return flatMap { response -> Single<T> in
            return Single.create { single in
                guard let jsonResponse = try? response.mapJSON(), let object = Mapper<BaseResponse>().map(JSONObject: jsonResponse) else {
                    single(.error(ApiError(message: "apiError.default".localized)))
                    return Disposables.create()
                }
                if object.isSuccess() {
                    guard let restObject = Mapper<T>().map(JSONObject: object.response) else {
                        single(.error(ApiError(message: "apiError.default".localized)))
                        return Disposables.create()
                    }
                    single(.success(restObject))
                } else if let error = object.error {
                    let apiError = ApiError(code: error.code, message: error.message)
                    single(.error(apiError))
                }
                return Disposables.create()
            }
            
        }
    }
    
    public func mapArray<T: BaseMappable>(_ type: T.Type, context: MapContext? = nil) -> Single<[T]> {
        return flatMap { response -> Single<[T]> in
            return Single.create{ single in
                guard let jsonResponse = try? response.mapJSON(), let object = Mapper<BaseResponse>().map(JSONObject: jsonResponse) else {
                    single(.error(ApiError(message: "apiError.default".localized)))
                    return Disposables.create()
                }
                if object.isSuccess() {
                    guard let restObjects = Mapper<T>().mapArray(JSONObject: object.response) else {
                        single(.error(ApiError(message: "apiError.default".localized)))
                        return Disposables.create()
                    }
                    single(.success(restObjects))
                } else if let error = object.error {
                    let apiError = ApiError(code: error.code, message: error.message)
                    single(.error(apiError))
                }
                return Disposables.create()
            }
        }
    }
    
}

