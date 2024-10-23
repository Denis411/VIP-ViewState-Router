//
//  Presenter.swift
//  VIP+State+Router
//
//  Created by FIX PRICE on 10/22/24.
//

import Foundation

protocol MainScreenPresenterProtocol {
    @MainActor func updateImage(imageData: Data?)
    @MainActor func setImageSavingStatus(isBeingSaved: Bool)
    @MainActor func setImageBeingLoadedStatus(isBeingLoaded: Bool)
}

final class MainScreenPresenter: MainScreenPresenterProtocol {
    private let viewState: ViewState
    
    init(viewState: ViewState) {
        self.viewState = viewState
    }
    
    @MainActor func updateImage(imageData: Data?) {
        if imageData != viewState.imageData {
            viewState.imageData = imageData
        }
    }
    
    @MainActor func setImageSavingStatus(isBeingSaved: Bool) {
        if isBeingSaved != viewState.isImageBeingSaved {
            viewState.isImageBeingSaved = isBeingSaved
        }
    }
    
    @MainActor func setImageBeingLoadedStatus(isBeingLoaded: Bool) {
        if isBeingLoaded != viewState.isImageBeingLoaded {
            viewState.isImageBeingLoaded = isBeingLoaded
        }
    }
}
