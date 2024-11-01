//
//  Interactor.swift
//  VIP+State+Router
//
//  Created by FIX PRICE on 10/22/24.
//

import Foundation

protocol RandomImageProtocol {
    func loadRandomImage(category: ImageCategory)
}

final class RandomImageInteractor: RandomImageProtocol {
    private let apiManager: ApiManagerProtocol
    private let presenter: MainScreenPresenterProtocol
    private var isLoadingInProgress = false
    
    init(
        presenter: MainScreenPresenterProtocol,
        apiManager: ApiManagerProtocol
    ) {
        self.presenter = presenter
        self.apiManager = apiManager
    }
    
    func loadRandomImage(category: ImageCategory) {
        guard !isLoadingInProgress else {
            return
        }
        
        Task(priority: .high) {
            defer {
                isLoadingInProgress = false
                Task {
                    await presenter.setImageBeingLoadedStatus(isBeingLoaded: false)
                }
            }
            isLoadingInProgress = true
            await presenter.setImageBeingLoadedStatus(isBeingLoaded: true)
            let endPoint = ApiEndpoint.randomImage(category: category, width: 200, height: 200)
            let response: NetworkResponse? = try? await apiManager.getResponse(from: endPoint)
            let imageData = response?.data
            await presenter.updateImage(imageData: imageData)
        }
    }
}
