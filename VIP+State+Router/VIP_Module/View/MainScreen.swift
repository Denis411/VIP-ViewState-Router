//
//  ViewController.swift
//  VIP+State+Router
//
//  Created by FIX PRICE on 10/22/24.
//

import UIKit
import SwiftUI

final class MainScreen: UIViewController {
    private let randomImageInteractor: RandomImageProtocol
    private let imagePreservationInteractor: ImagePreservationProtocol
    
    @ObservedObject private(set) var viewState: ViewState
    private var disposedBag = Set<AnyCancellable>()
    
    private var internalView: MainScreenView { view as! MainScreenView }
    
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

import Combine

private extension MainScreen {
    private func bind() {
        // image data
        viewState
            .$imageData
            .removeDuplicates()
            .sink { [weak internalView] imageData in
                guard Thread.isMainThread else {
                    fatalError()
                }
                
                defer {
                    internalView?.setLoadingState(isBeingLoaded: false)
                }
                guard let imageData = imageData,
                      let updatedImage = UIImage(data: imageData) else {
                    return
                }
                
                internalView?.setImage(updatedImage)
        }
            .store(in: &disposedBag)
        
        // saving status
        viewState
            .$isImageBeingSaved
            .dropFirst()
            .sink { [weak internalView] isBeingLoaded in
                internalView?.setImageSavingStatus(isBeingLoaded: isBeingLoaded)
            }
            .store(in: &disposedBag)
    }
}
