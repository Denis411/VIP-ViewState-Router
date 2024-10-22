//
//  ImagePerservationInteractor.swift
//  VIP+State+Router
//
//  Created by FIX PRICE on 10/22/24.
//

import Foundation

protocol ImagePreservationProtocol {
    func persist(imageData: Data?)
}

final class ImagePreservationInteractor {
    private let repository: InternalRepositoryProtocol
    private let nc = NotificationCenter.default
    
    init(repository: InternalRepositoryProtocol) {
        self.repository = repository
    }
}

extension ImagePreservationInteractor: ImagePreservationProtocol {
    func persist(imageData: Data?) {
        if let imageData {
            repository.saveImageData(imageData)
        }
    }
}
