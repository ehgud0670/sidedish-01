//
//  ViewController.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/21.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class CategoryViewController: UIViewController {
    private let categoryTableView = CategoryTableView()
    private var categoryViewModels: CategoryViewModels!
    private var hasBeenDisplayed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMenuTableView()
        configureObserver()
        configureUsecase()
    }
    
    private func configureMenuTableView() {
        categoryTableView.delegate = self
        categoryTableView.register(ProductCell.self,
                                   forCellReuseIdentifier: ProductCell.reuseIdentifier)
        categoryTableView.register(CategoryHeaderView.self,
                                   forHeaderFooterViewReuseIdentifier: CategoryHeaderView.reuseIdentifier)
        configureMenuTableViewConstraints()
    }
    
    private func configureMenuTableViewConstraints() {
        view.addSubview(categoryTableView)
        
        let safeArea = view.safeAreaLayoutGuide
        categoryTableView.leadingAnchor.constraint(equalTo:
            safeArea.leadingAnchor).isActive = true
        categoryTableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        categoryTableView.widthAnchor.constraint(equalTo: safeArea.widthAnchor,
                                                 multiplier: 1).isActive = true
        categoryTableView.heightAnchor.constraint(equalTo: safeArea.heightAnchor,
                                                  multiplier: 1).isActive = true
    }
    
    private func configureObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateTableView),
                                               name: CategoryViewModels.Notification.categoryViewModelsDidChange,
                                               object: categoryViewModels)
    }
    
    @objc private func updateTableView(notification: Notification) {
        guard let userInfo = notification.userInfo, let index = userInfo["index"] as? Int else { return }
        DispatchQueue.main.sync {
            self.categoryTableView.reloadSections(IndexSet(integer: index), with: .automatic)
        }
    }
    
    private func configureUsecase() {
        CategoryURLsUseCase.requestCategoryURLs(with: NetworkManager()) { urlStrings in
            guard let urlStrings = urlStrings else { return }
            self.initCategoryViewModels(count: urlStrings.count)
            for index in 0 ..< urlStrings.count {
                CategoryUseCase.makeCategory(from: urlStrings[index],
                                             with: NetworkManager())
                { category in
                    guard let category = category else { return }
                    let categoryViewModel = CategoryViewModel(category: category)
                    self.categoryViewModels.insert(at: index, categoryViewModel: categoryViewModel)
                }
            }
        }
    }
    
    private func initCategoryViewModels(count: Int) {
        categoryViewModels = CategoryViewModels(count: count)
        configureCategoryTableViewDataSource()
    }
    
    private func configureCategoryTableViewDataSource() {
        DispatchQueue.main.async {
            self.categoryTableView.dataSource = self.categoryViewModels
            self.categoryTableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
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

extension CategoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let categoryHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: CategoryHeaderView.reuseIdentifier) as? CategoryHeaderView else { return nil }
        guard let categoryViewModels = categoryViewModels,
            let categoryViewModel = categoryViewModels.categoryViewModel(at: section) else { return nil }
        categoryHeaderView.configure(header: categoryViewModel.categoryHeader)
        return categoryHeaderView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(UIViewController(), animated: true)
        
        guard let categoryViewModels = categoryViewModels,
            let categoryViewModel = categoryViewModels.categoryViewModel(at: indexPath.section),
            let productViewModel = categoryViewModel.productViewModel(at: indexPath.row) else { return }
        
        ProductDetailUseCase.requestCategoryDetail(from: "\(ProductDetailUseCase.EndPoints.banchans)\(productViewModel.id)",
        with: NetworkManager()) { productDetail in
            guard let productDetail = productDetail else { return }
            
        }
    }
}
