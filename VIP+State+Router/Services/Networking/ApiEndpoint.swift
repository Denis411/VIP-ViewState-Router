//
//  ApiEndpoint.swift
//  VIP+State+Router
//
//  Created by FIX PRICE on 10/22/24.
//

import Foundation

// I user https://api-ninjas.com/profile

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
        }
    }
    
    var method: Method {
        return .GET
    }
    
    var headerFields: [String: String]? {
        switch self {
        case .randomImage:
            return ["X-Api-Key": APINinjasKey, "Accept": "image/jpg"]
        }
    }
}
