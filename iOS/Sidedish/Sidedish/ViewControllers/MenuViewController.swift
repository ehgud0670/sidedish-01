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
    private var menuTableViewDataSource: MenuTableViewDataSource!
    private var categoryViewModels: CategoryViewModels!
    private var hasBeenDisplayed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMenuTableViewDataSource()
        configureMenuTableView()
        configureObserver()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.makeMenuViewModels()
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
    
    private func configureMenuTableViewDataSource() {
        menuTableViewDataSource = MenuTableViewDataSource(
            sectionCountHandler: {
                guard let categoryViewModels = self.categoryViewModels else { return nil }
                return categoryViewModels.count
        },
            rowCountHandler: { section -> Int? in
                guard let categoryViewModels = self.categoryViewModels,
                    let categoryViewModel = categoryViewModels.categoryViewModel(at: section) else { return nil }
                return categoryViewModel.productViewModelsCount
        },
            modelBindingHandler: { section, row -> ProductViewModel? in
                guard let categoryViewModels = self.categoryViewModels,
                    let categoryViewModel = categoryViewModels.categoryViewModel(at: section),
                    let productViewModel = categoryViewModel.productViewModel(at: row) else { return nil }
                return productViewModel
        })
    }
    
    private func configureObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateTableView),
                                               name: CategoryViewModels.Notification.categoryViewModelsDidChange, object: categoryViewModels)
    }
    
    @objc private func updateTableView() {
        DispatchQueue.main.async {
            self.menuTableView.reloadData()
        }
    }
    
    private func makeMenuViewModels() {
        requestCategoryURLs(with: MockCategoryURLsSuccessStub()) { urlStrings in
            guard let urlStrings = urlStrings else { return }
            self.initCategoryViewModels(count: urlStrings.count)
            for index in 0 ..< urlStrings.count {
                self.makeMenuViewModel(from: urlStrings[index],
                                       with: MockCategorySuccessStub()) { categoryViewModel in
                                        guard let categoryViewModel = categoryViewModel else { return }
                                        self.categoryViewModels.insert(at: index,
                                                                       categoryViewModel: categoryViewModel)
                }
            }
        }
    }
    
    private func initCategoryViewModels(count: Int) {
        categoryViewModels = CategoryViewModels(count: count)
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
    
    private func makeMenuViewModel(from urlString: String,
                                   with manager: NetworkManagable,
                                   completionHandler: @escaping (CategoryViewModel?) -> ()) {
        try? manager.requestResource(from: urlString, httpMethod: .get, httpBody: nil,
                                     completionHandler: {
                                        data, urlResponse, error in
                                        guard error == nil, let data = data,
                                            let response = try? JSONDecoder().decode(CategoryResponse.self,
                                                                                     from: data),
                                            response.status == .success else { return }
                                        let categoryHeader = CategoryHeader(id: response.category_id,
                                                                            name: response.category_name,
                                                                            description: response.category_description)
                                        let productViewModels =  response.banchans.map { ProductViewModel(product: $0) }
                                        let categoryViewModel = CategoryViewModel(categoryHeader: categoryHeader, productViewModels: productViewModels)
                                        completionHandler(categoryViewModel)
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
        guard let categoryViewModels = categoryViewModels,
            let categoryViewModel = categoryViewModels.categoryViewModel(at: section) else { return nil }
        categoryViewModel.performBind { header in
            foodCategoryHeaderView.configureCategory(text: header.name)
            foodCategoryHeaderView.configureTitle(text: header.description)
        }
        return foodCategoryHeaderView
    }
}
