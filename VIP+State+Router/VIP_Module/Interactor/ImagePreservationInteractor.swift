//
//  ImagePerservationInteractor.swift
//  VIP+State+Router
//
//  Created by FIX PRICE on 10/22/24.
//

import Foundation

protocol ImagePreservationProtocol {
    func persist(imageData: Data?)
    func loadImage()
}

final class ImagePreservationInteractor {
    private let repository: InternalRepositoryProtocol
    private let presenter: MainScreenPresenterProtocol
    
    init(
        repository: InternalRepositoryProtocol,
        presenter: MainScreenPresenterProtocol
    ) {
        self.repository = repository
        self.presenter = presenter
    }
}

extension ImagePreservationInteractor: ImagePreservationProtocol {
    func persist(imageData: Data?) {
        Task(priority: .userInitiated) {
            await presenter.setImageSavingStatus(isBeingLoaded: true)
            if let imageData {
                repository.saveImageData(imageData)
            }
            await presenter.setImageSavingStatus(isBeingLoaded: false)
        }
    }
    
    func loadImage() {
        Task(priority: .userInitiated) {
            if let imageData = repository.retrieveImageDataIfExists() {
                await presenter.updateImage(imageData: imageData)
            }
        }
    }
}
