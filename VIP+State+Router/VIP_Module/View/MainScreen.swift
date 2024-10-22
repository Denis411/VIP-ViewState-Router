//
//  ViewController.swift
//  VIP+State+Router
//
//  Created by FIX PRICE on 10/22/24.
//

import UIKit
import SwiftUI

final class MainScreen: UIViewController {
    /*private*/ let interactor: InteractorProtocol
    @ObservedObject private(set) var viewState: ViewState
    
    private var disposedBag = Set<AnyCancellable>()
    
    /*private*/ let button = UIButton()
    /*private*/ let imageView = UIImageView()
    
    init(
        interactor: InteractorProtocol,
        viewState: ViewState
    ) {
        self.interactor = interactor
        self.viewState = viewState
        super.init(nibName: nil, bundle: nil)
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        setImageView()
        setUIButton()
    }
}

import Combine

private extension MainScreen {
    private func bind() {
        viewState
            .$imageData
            .removeDuplicates()
            .sink { [weak imageView] imageData in
                guard let imageData = imageData,
                      let updatedImage = UIImage(data: imageData) else {
                    return
                }
                
                imageView?.image = updatedImage
        }
            .store(in: &disposedBag)
    }
}
