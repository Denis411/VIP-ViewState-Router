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
    private let presenter: PresenterProtcol
    
    init(presenter: PresenterProtcol) {
        self.presenter = presenter
    }
    
    func loadRandomImage(category: ImageCategory) {
        
    }
}
