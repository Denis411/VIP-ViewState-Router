//
//  Router.swift
//  VIP+State+Router
//
//  Created by FIX PRICE on 10/23/24.
//

import SwiftUI
import UIKit

final class Router {
    private let window: UIWindow
    private let scene: UIWindowScene
    private let screenFactor: ScreenFactory
    
    private var rootNavigationVC: UINavigationController?
    
    init(
        window: UIWindow,
        scene: UIWindowScene,
        screenFactor: ScreenFactory
    ) {
        self.window = window
        self.scene = scene
        self.screenFactor = screenFactor
    }
    
    func setNavVC(nvc: UINavigationController) {
        self.rootNavigationVC = nvc
    }
}

extension Router {
    func openRandomImageScreenInSwiftUI() {
        let screen = screenFactor.mainSwiftUIScreen()
        let hostingScreen = UIHostingController(rootView: screen)
        rootNavigationVC?.pushViewController(hostingScreen, animated: true)
    }
    
    func openRandomImageScreenInUIKit() {
        let screen = screenFactor.mainUIKitScreen()
        rootNavigationVC?.pushViewController(screen, animated: true)
    }
}
