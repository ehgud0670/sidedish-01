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
    private var categories: [Category]!
    private var hasBeenDisplayed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeCategories()
        configureMenuTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presentLoginViewController()
    }
    
    private func makeCategories() {
        requestCategoryURLs(with: MockCategoryURLsSuccessStub()) { urlStrings in
            guard let urlStrings = urlStrings else { return }
            self.initCategories(count: urlStrings.count)
            for index in 0 ..< urlStrings.count {
                self.makeCategory(from: urlStrings[index],
                                  with: MockCategorySuccessStub()) { category in
                                    guard let category = category else { return }
                                    self.categories[index] = category
                }
            }
        }
    }
    
    private func initCategories(count: Int) {
        let dummy = Category(category_id: 0,
                             category_name: "dummy",
                             category_description: "dummy",
                             banchans: [])
        categories = [Category].init(repeating: dummy, count: count)
    }
    
    private func requestCategoryURLs(with manager: NetworkManagable,
                                     completionHandler: @escaping ([String]?) -> ()) {
        try? manager.requestResource(from: "아직 없음",
                                     httpMethod: .get, httpBody: nil) {
                                        data, urlResponse, error in
                                        guard error == nil, let data = data,
                                            let response = try? JSONDecoder().decode(CategoryURLsResponse.self,
                                                                                     from: data),
                                            response.status == .success else { return }
                                        completionHandler(response.api)
        }
    }
    
    private func makeCategory(from urlString: String,
                              with manager: NetworkManagable,
                              completionHandler: @escaping (Category?) -> ()) {
        try? manager.requestResource(from: urlString, httpMethod: .get, httpBody: nil,
                                     completionHandler: {
                                        data, urlResponse, error in
                                        guard error == nil, let data = data,
                                            let response = try? JSONDecoder().decode(CategoryResponse.self,
                                                                                     from: data),
                                            response.status == .success else { return }
                                        let category = Category(category_id: response.category_id,
                                                                category_name: response.category_name,
                                                                category_description: response.category_description,
                                                                banchans: response.banchans)
                                        completionHandler(category)
        })
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
