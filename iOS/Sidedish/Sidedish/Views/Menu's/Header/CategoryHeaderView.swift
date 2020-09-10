//
//  CategoryHeaderView.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/21.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

final class CategoryHeaderView: UITableViewHeaderFooterView, ReusableView {
    private let categoryLabel = CategoryLabel()
    private let titleLabel = CategoryTitleLabel()
    let onData: AnyObserver<CategoryHeader>
    private let data = PublishSubject<CategoryHeader>()
    private var disposeBag = DisposeBag()
    
    override init(reuseIdentifier: String?) {
        onData = data.asObserver()
        
        super.init(reuseIdentifier: reuseIdentifier)
        
        configureContentView()
        configureCategoryLabel()
        configureTitleLabel()
        
        bindUI()
    }
    
    required init?(coder: NSCoder) {
        onData = data.asObserver()
        
        super.init(coder: coder)
        
        configureContentView()
        configureCategoryLabel()
        configureTitleLabel()
        
        bindUI()
    }
    
    override func prepareForReuse() {
        //clear
        categoryLabel.text = nil
        titleLabel.text = nil
        
        //reset disposeBag
        disposeBag = DisposeBag()
        
        //resubscribe on data
        bindUI()
    }
    
    private func configureContentView() {
        contentView.backgroundColor = .systemBackground
    }
    
    private func configureCategoryLabel() {
        contentView.addSubview(categoryLabel)
        
        categoryLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        categoryLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -10).isActive = true
    }

    private func configureTitleLabel() {
        contentView.addSubview(titleLabel)
        
        titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 5).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
    
    func bindUI() {
        data.subscribe(onNext: { [weak self] in
            self?.configure(header: $0)
        }).disposed(by: disposeBag)
    }
    
    private func configure(header: CategoryHeader) {
        categoryLabel.text = header.name
        titleLabel.text = header.description
    }
}
