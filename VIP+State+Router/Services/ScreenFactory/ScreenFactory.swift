//
//  ScreenFactory.swift
//  VIP+State+Router
//
//  Created by FIX PRICE on 10/22/24.
//

import UIKit
import SwiftUI

// DI is needed to avoid initializing services twice, reusability is more rational in the case
struct DI {
    func getApiService() -> ApiManagerProtocol {
        ApiManager()
    }
    
    func getInternalRepository() -> InternalRepositoryProtocol {
        InternalRepository()
    }
}

final class ScreenFactory {
    private let di = DI()
    
    func mainUIKitScreen() -> UIViewController {
        let apiManager = di.getApiService()
        let internalRepository = di.getInternalRepository()
        
        let viewState = ViewState()
        let presenter = MainScreenPresenter(viewState: viewState)
        let randomImageInteractor = RandomImageInteractor(
            presenter: presenter,
            apiManager: apiManager
        )
        let imagePresenrvationInteractor = ImagePreservationInteractor(
            repository: internalRepository,
            presenter: presenter
        )
        let screen = MainScreen(
            randomImageInteractor: randomImageInteractor,
            imagePreservationInteractor: imagePresenrvationInteractor,
            viewState: viewState
        )
        return screen
    }
    
    func mainSwiftUIScreen() -> UIViewController {
        let apiManager = di.getApiService()
        let internalRepository = di.getInternalRepository()
        
        let viewState = ViewState()
        let presenter = MainScreenPresenter(viewState: viewState)
        let randomImageInteractor = RandomImageInteractor(
            presenter: presenter,
            apiManager: apiManager
        )
        let imagePresenrvationInteractor = ImagePreservationInteractor(
            repository: internalRepository,
            presenter: presenter
        )
        let view = MainScreenSwiftUIView(
            viewState: viewState,
            randomImageInteractor: randomImageInteractor,
            imagePreservationInteractor: imagePresenrvationInteractor
        )
        
        return UIHostingController(rootView: view)
    }
}
