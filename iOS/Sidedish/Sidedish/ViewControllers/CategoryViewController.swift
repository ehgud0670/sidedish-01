//
//  ViewController.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/21.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

import RxSwift

final class CategoryViewController: UIViewController {
    private let categoryTableView = CategoryTableView()
    private var categoryViewModels = CategoryViewModels()
    private var hasBeenDisplayed = false
    private let updateQueue = DispatchQueue(label: "serial.update.queue")
    private var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureMenuTableView()
        configureObserver()
        configureURLUsecase()
    }
    
    private func configureMenuTableView() {
        categoryTableView.delegate = self
        categoryTableView.dataSource = categoryViewModels
        categoryTableView.register(
            ProductCell.self,
            forCellReuseIdentifier: ProductCell.reuseIdentifier
        )
        categoryTableView.register(
            CategoryHeaderView.self,
            forHeaderFooterViewReuseIdentifier: CategoryHeaderView.reuseIdentifier
        )
        configureMenuTableViewConstraints()
    }
    
    private func configureMenuTableViewConstraints() {
        view.addSubview(categoryTableView)
        
        let safeArea = view.safeAreaLayoutGuide
        categoryTableView.leadingAnchor.constraint(
            equalTo: safeArea.leadingAnchor).isActive = true
        categoryTableView.topAnchor.constraint(
            equalTo: safeArea.topAnchor).isActive = true
        categoryTableView.widthAnchor.constraint(
            equalTo: safeArea.widthAnchor,
            multiplier: 1).isActive = true
        categoryTableView.heightAnchor.constraint(
            equalTo: safeArea.heightAnchor,
            multiplier: 1).isActive = true
    }
    
    private func configureObserver() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateTableView),
            name: CategoryViewModels.Notification.categoryViewModelsDidChange,
            object: categoryViewModels
        )
    }
    
    @objc private func updateTableView(notification: Notification) {
        guard let userInfo = notification.userInfo,
            let index = userInfo["index"] as? Int else { return }
        
        DispatchQueue.main.sync {
            self.categoryTableView.reloadSections(
                IndexSet(integer: index),
                with: .automatic
            )
        }
    }
    
    private func configureURLUsecase() {
        CategoryURLsUseCase.requestCategoryURLs(with: MockCategoryURLsSuccess()) { urlStrings in
            guard let urlStrings = urlStrings else { return }
            
            self.categoryViewModels.set(count: urlStrings.count)
            self.configureCategoryUseCase(with: urlStrings)
        }
    }
    
    private func configureCategoryUseCase(with urlStrings: [String]) {
        (0 ..< urlStrings.count).forEach { index in
            CategoryUseCase.makeCategory(
                from: urlStrings[index],
                with: MockCategorySuccess()
            ) { category in
                guard let category = category else { return }
                
                let categoryViewModel = CategoryViewModel(category: category)
                self.updateQueue.sync {
                    self.categoryViewModels.insert(at: index, categoryViewModel: categoryViewModel)
                }
            }
        }
    }
}

//MARK:- UITableView Delegate
extension CategoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let categoryHeaderView = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: CategoryHeaderView.reuseIdentifier
            ) as? CategoryHeaderView else { return nil }
        guard let categoryViewModel = categoryViewModels.categoryViewModel(
            at: section
            ) else { return nil }
        
        categoryViewModel.categoryHeader
            .bind(to: categoryHeaderView.onData)
            .disposed(by: disposeBag)
        
        return categoryHeaderView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productDetailViewController = DetailViewController()
        navigationController?.pushViewController(productDetailViewController, animated: true)
        
        guard let categoryViewModel = categoryViewModels.categoryViewModel(at: indexPath.section),
            let productViewModel = categoryViewModel.productViewModel(at: indexPath.row) else { return }
        
        self.configureDetailUseCase(productViewModel: productViewModel) { productDetailData in
            guard let productDetailData = productDetailData else { return }
            
            productDetailViewController.detailViewModel = DetailViewModel(productDetailData: productDetailData)
        }
    }
    
    private func configureDetailUseCase(
        productViewModel: ProductViewModel,
        completionHandler: @escaping (ProductDetailData?) -> Void
    ) {
        
        ProductDetailUseCase.requestCategoryDetail(from: "\(ProductDetailUseCase.EndPoints.banchans)\(productViewModel.id)",
        with: MockProductDetailSuccess()) { productDetail in
            guard let productDetail = productDetail else { return }
            
            completionHandler(productDetail)
        }
    }
}
