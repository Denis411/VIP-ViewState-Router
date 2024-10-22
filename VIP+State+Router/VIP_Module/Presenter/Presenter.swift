//
//  Presenter.swift
//  VIP+State+Router
//
//  Created by FIX PRICE on 10/22/24.
//

import Foundation

protocol PresenterProtcol {
    func updateImage(imageData: Data)
}

final class Presenter: PresenterProtcol {
    private let viewState: ViewState
    
    init(viewState: ViewState) {
        self.viewState = viewState
    }
    
    func updateImage(imageData: Data) {
        viewState.imageData = imageData
    }
}
