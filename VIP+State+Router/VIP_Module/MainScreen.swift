//
//  ViewController.swift
//  VIP+State+Router
//
//  Created by FIX PRICE on 10/22/24.
//

import UIKit

final class ViewState: ObservableObject {
    @Published var imageData: Data?
}

protocol PresenterProtcol {
    func updateImage(imageData: Data)
}

final class Presenter: PresenterProtcol {
    private let viewState: ViewState
    
    init(viewState: ViewState) {
        self.viewState = viewState
    }
    
    func updateImage(imageData: Data) {
        viewState.imageData = imageData
    }
}

protocol InteractorProtocol {
    func loadRandomImage(category: ImageCategory)
}

final class Interactor: InteractorProtocol {
    func loadRandomImage(category: ImageCategory) {
        
    }
}

final class MainScreen: UIViewController {
    private let interactor: InteractorProtocol = Interactor()
    private let button = UIButton()
    private let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        setImageView()
        setUIButton()
    }
}


// MARK: - UIElements
extension MainScreen {
    private func setImageView() {
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: view.bounds.width * 0.8).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: view.bounds.width * 0.8).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.image = UIImage(systemName: "plus.circle")
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
