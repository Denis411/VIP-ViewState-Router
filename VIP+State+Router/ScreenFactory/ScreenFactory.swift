//
//  ScreenFactory.swift
//  VIP+State+Router
//
//  Created by FIX PRICE on 10/22/24.
//

import UIKit

final class ScreenFactory {
    func mainScreen() -> UIViewController {
        let viewState = ViewState()
        let presenter = Presenter(viewState: viewState)
        let interactor = Interactor(presenter: presenter)
        let screen = MainScreen(interactor: interactor, viewState: viewState)
        return screen
    }
}
