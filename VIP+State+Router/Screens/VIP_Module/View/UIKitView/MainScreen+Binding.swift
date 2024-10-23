//
//  MainScreen+Binding.swift
//  VIP+State+Router
//
//  Created by FIX PRICE on 10/22/24.
//

import UIKit
import Combine

extension MainScreen {
    func bind() {
        // image data
        viewState
            .$imageData
            .sink { [weak internalView] imageData in
                guard Thread.isMainThread else {
                    fatalError()
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
            .sink { [weak internalView] isBeingSaved in
                internalView?.setImageSavingStatus(isBeingSaved: isBeingSaved)
            }
            .store(in: &disposedBag)
        
        // loading status
        viewState
            .$isImageBeingLoaded
            .dropFirst()
            .sink { [weak internalView] isBeingLoaded in
                internalView?.setLoadingState(isBeingLoaded: isBeingLoaded)
            }
            .store(in: &disposedBag)
    }
    
}
