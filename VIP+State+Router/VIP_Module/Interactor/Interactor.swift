//
//  Interactor.swift
//  VIP+State+Router
//
//  Created by FIX PRICE on 10/22/24.
//

import Foundation

protocol InteractorProtocol {
    func loadRandomImage(category: ImageCategory)
}

final class Interactor: InteractorProtocol {
    private let apiManager: ApiManagerProtocol
    private let presenter: PresenterProtocol
    private var isLoadingInProgress = false
    
    init(
        presenter: PresenterProtocol,
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
            }
            isLoadingInProgress = true
            let endPoint = ApiEndpoint.randomImage(category: category, width: 200, height: 200)
            let response: NetworkResponse? = try? await apiManager.getResponse(from: endPoint)
            let imageData = response?.data
            await presenter.updateImage(imageData: imageData)
        }
    }
}
