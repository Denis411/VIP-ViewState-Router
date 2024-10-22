//
//  SceneDelegate.swift
//  VIP+State+Router
//
//  Created by FIX PRICE on 10/22/24.
//

import UIKit

final class ScreenFactory {
    func mainScreen() -> UIViewController {
        MainScreen()
    }
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private let screenFactory = ScreenFactory()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        let rootVC = screenFactory.mainScreen()
        let rootNC = UINavigationController(rootViewController: rootVC)
        window?.rootViewController = rootNC
    }
}

