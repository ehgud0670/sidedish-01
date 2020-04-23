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
    private let menuTableViewDataSource = MenuTableViewDataSource()
    private var hasBeenDisplayed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestCategoryURLs(with: MockCategoryURLsSuccessStub()) { urls in
            guard let urls = urls else { return }
            
        }
        configureMenuTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presentLoginViewController()
    }
    
    private func requestCategoryURLs(with manager: NetworkManagable,
                                     completionHandler: @escaping ([URL]?) -> ()) {
        try? manager.requestResource(from: "",
                                     httpMethod: .get, httpBody: nil) {
                                        data, urlResponse, error in
                                        guard error == nil, let data = data,
                                            let response = try? JSONDecoder().decode(CategoryURLsResponse.self,
                                                                         from: data),
                                            response.status == .success else { return }
                                        completionHandler(response.api)
        }
    }
    
    private func configureMenuTableView() {
        menuTableView.dataSource = menuTableViewDataSource
        menuTableView.delegate = self
        menuTableView.register(FoodProductCell.self,
                               forCellReuseIdentifier: FoodProductCell.reuseIdentifier)
        menuTableView.register(FoodCategoryHeaderView.self,
                               forHeaderFooterViewReuseIdentifier: FoodCategoryHeaderView.reuseIdentifier)
        configureMenuTableViewConstraints()
    }
    
    private func configureMenuTableViewConstraints() {
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

extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let foodCategoryHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: FoodCategoryHeaderView.reuseIdentifier) as? FoodCategoryHeaderView else { return nil }
        return foodCategoryHeaderView
    }
}
