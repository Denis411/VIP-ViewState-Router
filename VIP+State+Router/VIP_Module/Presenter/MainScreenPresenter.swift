//
//  Presenter.swift
//  VIP+State+Router
//
//  Created by FIX PRICE on 10/22/24.
//

import Foundation

protocol MainScreenPresenterProtocol {
    @MainActor func updateImage(imageData: Data?)
}

final class MainScreenPresenter: MainScreenPresenterProtocol {
    private let viewState: ViewState
    
    init(viewState: ViewState) {
        self.viewState = viewState
    }
    
    @MainActor func updateImage(imageData: Data?) {
        viewState.imageData = imageData
    }
}
