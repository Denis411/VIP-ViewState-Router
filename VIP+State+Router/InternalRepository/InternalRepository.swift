//
//  InternalRepository.swift
//  VIP+State+Router
//
//  Created by FIX PRICE on 10/22/24.
//

import Foundation

protocol InternalRepositoryProtocol {
    func saveImageData(_ data: Data)
    func retrieveImageDataIfExists() -> Data?
}

final class InternalRepository {
    private let ud = UserDefaults.standard
    private let imageKey = "imageKey"
}

extension InternalRepository: InternalRepositoryProtocol {
    func saveImageData(_ data: Data) {
        ud.set(data, forKey: imageKey)
    }
    
    func retrieveImageDataIfExists() -> Data? {
        guard let imageData = ud.value(forKey: imageKey) as? Data else {
            return nil
        }
        
        return imageData
    }
}
