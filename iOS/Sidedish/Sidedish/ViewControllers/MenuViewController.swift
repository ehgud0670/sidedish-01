//
//  ViewController.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/21.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class MenuViewController: UIViewController {
    private let menuTableView = MenuTableView()
    private var hasBeenDisplayed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMenuTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presentLoginViewController()
    }
    
    private func configureMenuTableView() {
        view.addSubview(menuTableView)
        
        let safeArea = view.safeAreaLayoutGuide
        menuTableView.leadingAnchor.constraint(equalTo:
            safeArea.leadingAnchor).isActive = true
        menuTableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        menuTableView.widthAnchor.constraint(equalTo: safeArea.widthAnchor,
                                             multiplier: 1).isActive = true
        menuTableView.heightAnchor.constraint(equalTo: safeArea.heightAnchor,
            multiplier: 1).isActive = true
    }
    
    private func presentLoginViewController() {
        if !hasBeenDisplayed {
            guard let loginViewController = storyboard?.instantiateViewController(withIdentifier: LoginViewController.Identifier.storyboardIdentifier) as? LoginViewController else { return }
            loginViewController.modalPresentationStyle = .fullScreen
            present(loginViewController, animated: true)
            hasBeenDisplayed = true
        }
    }
}
