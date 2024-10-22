//
//  ViewController.swift
//  VIP+State+Router
//
//  Created by FIX PRICE on 10/22/24.
//

import UIKit

final class Interactor {
    func loadRandomImage(category: ImageCategory) {
        
    }
}

class MainScreen: UIViewController {
    private let interactor = Interactor()
    private let button: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        setUIButton()
    }

    private func setUIButton() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        button.layer.backgroundColor = UIColor.blue.cgColor
        button.layer.cornerRadius = 10.0
        button.setTitle("Random Image", for: .normal)
        button.setTitle("", for: .highlighted)
        button.addTarget(nil, action: #selector(loadImage), for: .touchUpInside)
    }
    
    @objc private func loadImage() {
        interactor.loadRandomImage(category: .city)
    }

}

