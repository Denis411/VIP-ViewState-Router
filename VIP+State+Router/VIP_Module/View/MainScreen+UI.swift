//
//  MainScreen+UI.swift
//  VIP+State+Router
//
//  Created by FIX PRICE on 10/22/24.
//

import UIKit

// MARK: - UIElements
extension MainScreen {
    func setActivityIndicator() {
        activityIndicator.isHidden = true
        view.addSubview(activityIndicator)
        activityIndicator.frame = CGRect(origin: .zero, size: .init(width: 100, height: 100))
        activityIndicator.center = view.center
        activityIndicator.color = .black
    }
    
    func setLoadingState(isBeingLoaded: Bool) {
        self.activityIndicator.isHidden = !isBeingLoaded
        self.imageView.isHidden = isBeingLoaded
        if isBeingLoaded {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
    
    func setImageView() {
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: view.bounds.width * 0.8).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: view.bounds.width * 0.8).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.image = UIImage(systemName: "plus.circle")
    }

    func setLoadImageButton() {
        view.addSubview(loadImageButton)
        loadImageButton.translatesAutoresizingMaskIntoConstraints = false
        loadImageButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loadImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadImageButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        loadImageButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        loadImageButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        loadImageButton.layer.backgroundColor = UIColor.blue.cgColor
        loadImageButton.layer.cornerRadius = 10.0
        loadImageButton.setTitle("Random Image", for: .normal)
        loadImageButton.setTitle("", for: .highlighted)
        loadImageButton.addTarget(nil, action: #selector(loadImage), for: .touchUpInside)
    }
    
    func setSaveButton() {
        view.addSubview(saveImageButton)
        saveImageButton.translatesAutoresizingMaskIntoConstraints = false
        saveImageButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        saveImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveImageButton.bottomAnchor.constraint(equalTo: loadImageButton.topAnchor, constant: -10).isActive = true
        saveImageButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        saveImageButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        saveImageButton.layer.backgroundColor = UIColor.blue.cgColor
        saveImageButton.layer.cornerRadius = 10.0
        saveImageButton.setTitle("Save image", for: .normal)
        saveImageButton.setTitle("", for: .highlighted)
        saveImageButton.addTarget(nil, action: #selector(saveImage), for: .touchUpInside)
    }
    
    @objc func loadImage() {
        setLoadingState(isBeingLoaded: true)
        randomImageInteractor.loadRandomImage(category: .city)
    }
    
    @objc func saveImage() {
        imagePreservationInteractor.persist(imageData: viewState.imageData)
    }
}
