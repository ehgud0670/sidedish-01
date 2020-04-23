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
    private var categoryHeaderViewModels: [CategoryHeaderViewModel]!
    private var productsViewModels: [ProductsViewModel]!
    private var hasBeenDisplayed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMenuTableView()
        makeCategories()
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
    
    private func makeCategories() {
        requestCategoryURLs(with: MockCategoryURLsSuccessStub()) { urlStrings in
            guard let urlStrings = urlStrings else { return }
            self.initCategoryHeaderViewModels(count: urlStrings.count)
            self.initProductsViewModels(count: urlStrings.count)
            for index in 0 ..< urlStrings.count {
                self.makeCategory(from: urlStrings[index],
                                  with: MockCategorySuccessStub()) { category in
                                    guard let category = category else { return }
                                    
                                    let header = category.header
                                    self.categoryHeaderViewModels[index] = CategoryHeaderViewModel(header: header)
                                    let products = category.products
                                    self.productsViewModels[index] = ProductsViewModel(products: products)
                }
            }
        }
    }
    
    private func initCategoryHeaderViewModels(count: Int) {
        let dummy = CategoryHeader(id: 0, name: "loading", description: "loading")
        let dummyCategoryHeaderViewModel = CategoryHeaderViewModel(header: dummy)
        categoryHeaderViewModels = [CategoryHeaderViewModel].init(repeating: dummyCategoryHeaderViewModel,
                                                                  count: count)
    }
    
    private func initProductsViewModels(count: Int) {
        let dummy = [Product]()
        let dummyProductViewModel = ProductsViewModel(products: dummy)
        productsViewModels = [ProductsViewModel].init(repeating: dummyProductViewModel, count: count)
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
                                        let header = CategoryHeader(id: response.category_id,
                                                                    name: response.category_name,
                                                                    description: response.category_description)
                                        let category = Category(header: header,
                                                                products: response.banchans)
                                        completionHandler(category)
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presentLoginViewController()
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
