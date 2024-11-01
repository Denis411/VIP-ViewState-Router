//
//  ViewState.swift
//  VIP+State+Router
//
//  Created by FIX PRICE on 10/22/24.
//

import Combine
import Foundation

final class ViewState: ObservableObject {
    @Published var imageData: Data?
    @Published var isImageBeingSaved: Bool = false
    @Published var isImageBeingLoaded: Bool = false
}
