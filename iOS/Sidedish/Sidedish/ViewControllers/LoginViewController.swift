//
//  LoginViewController.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/21.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
    enum Identifier {
        static let storyboardIdentifier = "LoginViewController"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButtonTouched(_ sender: LoginButton) {
        let oAuth = "https://github.com/login/oauth/authorize?client_id=0a87fff246fe66925f8c&scope=user%20public_repo"
        try? NetworkManager().requestResource(from: oAuth,
                                              httpMethod: .get,
                                              httpBody: nil)
        { (data, urlResponse, error) in
            DispatchQueue.main.async {
                self.dismiss(animated: true)
            }
        }
        
    }
}
