//
//  ViewController.swift
//  VIP+State+Router
//
//  Created by FIX PRICE on 10/22/24.
//

import UIKit
import SwiftUI
import Combine

final class MainScreen: UIViewController {
    private let randomImageInteractor: RandomImageProtocol
    private let imagePreservationInteractor: ImagePreservationProtocol
    
    @ObservedObject private(set) var viewState: ViewState
    var disposedBag = Set<AnyCancellable>()
    
    var internalView: MainScreenView { view as! MainScreenView }
    
    init(
        randomImageInteractor: RandomImageProtocol,
        imagePreservationInteractor: ImagePreservationProtocol,
        viewState: ViewState
    ) {
        self.randomImageInteractor = randomImageInteractor
        self.imagePreservationInteractor = imagePreservationInteractor
        self.viewState = viewState
        super.init(nibName: nil, bundle: nil)
        bind()
    }
    
    override func loadView() {
        view = MainScreenView(
            loadRandomImageAction: randomImageInteractor.loadRandomImage,
            saveImageAction: imagePreservationInteractor.persist
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green

        imagePreservationInteractor.loadImage()
    }
}
