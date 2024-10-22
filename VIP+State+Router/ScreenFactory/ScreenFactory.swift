//
//  ScreenFactory.swift
//  VIP+State+Router
//
//  Created by FIX PRICE on 10/22/24.
//

import UIKit

// DI is needed to avoid initializing services twice, reusability is more rational in the case
struct DI {
    func getApiService() -> ApiManager {
        ApiManager()
    }
}

final class ScreenFactory {
    private let di = DI()
    
    func mainScreen() -> UIViewController {
        let viewState = ViewState()
        let presenter = Presenter(viewState: viewState)
        let apiManager = di.getApiService()
        let interactor = RandomImageInteractor(presenter: presenter, apiManager: apiManager)
        let screen = MainScreen(interactor: interactor, viewState: viewState)
        return screen
    }
}
