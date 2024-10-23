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
    private let rootNavigationVC: UINavigationController
    private let screenFactor: ScreenFactory
    
    init(
        window: UIWindow,
        scene: UIWindowScene,
        rootNavigationVC: UINavigationController,
        screenFactor: ScreenFactory
    ) {
        self.window = window
        self.scene = scene
        self.rootNavigationVC = rootNavigationVC
        self.screenFactor = screenFactor
    }
    
    func openRandomImageScreenInSwiftUI() {
        let screen = screenFactor.mainSwiftUIScreen()
        let hostingScreen = UIHostingController(rootView: screen)
        rootNavigationVC.pushViewController(hostingScreen, animated: true)
    }
    
    func openRandomImageScreenInUIKit() {
        let screen = screenFactor.mainUIKitScreen()
        rootNavigationVC.pushViewController(screen, animated: true)
    }
}
