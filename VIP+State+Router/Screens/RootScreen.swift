//
//  RootScreen.swift
//  VIP+State+Router
//
//  Created by FIX PRICE on 10/23/24.
//

import UIKit
import SwiftUI

final class RootViewController: UIViewController {
    private let swiftUIViewButton = UIButton()
    private let UIKitViewButton = UIButton()
    
    override func viewWillLayoutSubviews() {
        crateSwiftUIViewButton()
        crateUIKitViewButton()
    }
}

extension RootViewController {
    private func crateSwiftUIViewButton() {
        view.addSubview(swiftUIViewButton)
        swiftUIViewButton.translatesAutoresizingMaskIntoConstraints = false
        swiftUIViewButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        swiftUIViewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        swiftUIViewButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        swiftUIViewButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        swiftUIViewButton.backgroundColor = .blue
        swiftUIViewButton.setTitle("SwiftUI", for: .normal)
        swiftUIViewButton.layer.cornerRadius = 10
    }
    
    private func crateUIKitViewButton() {
        view.addSubview(UIKitViewButton)
        UIKitViewButton.translatesAutoresizingMaskIntoConstraints = false
        UIKitViewButton.topAnchor.constraint(equalTo: swiftUIViewButton.bottomAnchor, constant: 10).isActive = true
        UIKitViewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        UIKitViewButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        UIKitViewButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        UIKitViewButton.backgroundColor = .blue
        UIKitViewButton.setTitle("UIKit", for: .normal)
        UIKitViewButton.layer.cornerRadius = 10
    }
}
