//
//  MainScreen+UI.swift
//  VIP+State+Router
//
//  Created by FIX PRICE on 10/22/24.
//

import UIKit


final class MainScreenView: UIView {
    private let loadImageButton = UIButton()
    private let saveImageButton = UIButton()
    private let imageView = UIImageView()
    private let activityIndicator = UIActivityIndicatorView()
    
    private let loadRandomImageAction: (ImageCategory) -> Void
    private let saveImageAction: (Data?) -> Void
    
    init(
        loadRandomImageAction: @escaping (ImageCategory) -> Void,
        saveImageAction: @escaping (Data?) -> Void
    ) {
        self.loadRandomImageAction = loadRandomImageAction
        self.saveImageAction = saveImageAction
        super.init(frame: .zero)
        setActivityIndicator()
        setImageView()
        setLoadImageButton()
        setSaveButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        activityIndicator.center = self.center
    }
    
    func setImage(_ image: UIImage) {
        imageView.image = image
    }
    
    func setLoadingState(isBeingLoaded: Bool) {
        setLoadingStateInternally(isBeingLoaded: isBeingLoaded)
    }
    
    func setImageSavingStatus(isBeingLoaded: Bool) {
        if isBeingLoaded {
            saveImageButton.setTitle("...", for: .normal)
        } else {
            saveImageButton.setTitle("Save image", for: .normal)
        }
    }
}

// MARK: - UIElements
private extension MainScreenView {
    func setActivityIndicator() {
        activityIndicator.isHidden = true
        self.addSubview(activityIndicator)
        activityIndicator.frame = CGRect(origin: .zero, size: .init(width: 100, height: 100))
        activityIndicator.color = .black
    }
    
    func setLoadingStateInternally(isBeingLoaded: Bool) {
        self.activityIndicator.isHidden = !isBeingLoaded
        self.imageView.isHidden = isBeingLoaded
        if isBeingLoaded {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
    
    func setImageView() {
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.8).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.8).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView.image = UIImage(systemName: "plus.circle")
    }

    func setLoadImageButton() {
        self.addSubview(loadImageButton)
        loadImageButton.translatesAutoresizingMaskIntoConstraints = false
        loadImageButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loadImageButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        loadImageButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50).isActive = true
        loadImageButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        loadImageButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        loadImageButton.layer.backgroundColor = UIColor.blue.cgColor
        loadImageButton.layer.cornerRadius = 10.0
        loadImageButton.setTitle("Random Image", for: .normal)
        loadImageButton.setTitle("", for: .highlighted)
        loadImageButton.addTarget(nil, action: #selector(loadImage), for: .touchUpInside)
    }
    
    func setSaveButton() {
        self.addSubview(saveImageButton)
        saveImageButton.translatesAutoresizingMaskIntoConstraints = false
        saveImageButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        saveImageButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        saveImageButton.bottomAnchor.constraint(equalTo: loadImageButton.topAnchor, constant: -10).isActive = true
        saveImageButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        saveImageButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        saveImageButton.layer.backgroundColor = UIColor.blue.cgColor
        saveImageButton.layer.cornerRadius = 10.0
        saveImageButton.setTitle("Save image", for: .normal)
        saveImageButton.setTitle("", for: .highlighted)
        saveImageButton.addTarget(nil, action: #selector(saveImage), for: .touchUpInside)
    }
    
    @objc func loadImage() {
        setLoadingStateInternally(isBeingLoaded: true)
        loadRandomImageAction(.city)
    }
    
    @objc func saveImage() {
        saveImageAction(imageView.image?.pngData())
    }
}
