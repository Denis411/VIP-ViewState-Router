//
//  ApiEndpoint.swift
//  VIP+State+Router
//
//  Created by FIX PRICE on 10/22/24.
//

import Foundation

fileprivate let APINinjasKey = "+mbt+/rt0Wi5pKfaTmBTFQ==ahQ0PZHrB3NLix8G"

enum ImageCategory: String {
    case nature, city, technology, food, still_life, abstract, wildlife
}

enum ApiEndpoint {
    case randomImage(category: ImageCategory, width: UInt, height: UInt)
    
    var baseURL: String {
        switch self {
        case .randomImage:
            return "https://api.api-ninjas.com/"
        }
    }
    
    var path: String {
        switch self {
        case .randomImage:
            return "v1/randomimage"
        }
    }
    
    var parameters: [URLQueryItem]? {
        switch self {
        case .randomImage(let category, let width, let height):
            guard width > 0, height > 0, width <= 5000, height <= 5000 else {
                assertionFailure()
                return nil
            }
            let categoryQI = URLQueryItem(name: "category", value: category.rawValue)
            let widthQI = URLQueryItem(name: "width", value: String(width))
            let heightQI = URLQueryItem(name: "height", value: String(height))
            return [categoryQI, widthQI, heightQI]
        default:
            return nil
        }
    }
    
    var method: Method {
        return .GET
    }
    
    var headerFields: [String: String]? {
        switch self {
        case .randomImage:
            return ["X-Api-Key": APINinjasKey, "Content-Type": "image/jpg"]
        }
    }
}

extension ApiEndpoint {
    enum Method: String {
         case GET
         case POST
         case PUT
         case DELETE
      }
}

