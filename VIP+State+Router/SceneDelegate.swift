//
//  SceneDelegate.swift
//  VIP+State+Router
//
//  Created by FIX PRICE on 10/22/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    private let screenFactory = ScreenFactory()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        guard let window else {
            fatalError()
        }
        window.makeKeyAndVisible()
        let rootNVC = screenFactory.rootViewController(window: window, scene: windowScene)
        window.rootViewController = rootNVC
    }
}

