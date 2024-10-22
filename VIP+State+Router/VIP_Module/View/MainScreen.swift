//
//  ViewController.swift
//  VIP+State+Router
//
//  Created by FIX PRICE on 10/22/24.
//

import UIKit

final class MainScreen: UIViewController {
    private let interactor: InteractorProtocol
    private let viewState: ViewState
    
    let button = UIButton()
    let imageView = UIImageView()
    
    init(
        interactor: InteractorProtocol,
        viewState: ViewState
    ) {
        self.interactor = interactor
        self.viewState = viewState
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        setImageView()
        setUIButton()
    }
}
