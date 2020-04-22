//
//  CategoryHeaderView.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/21.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class FoodCategoryHeaderView: UITableViewHeaderFooterView, ReusableView {
    private let categoryLabel = CategoryLabel()
    private let titleLabel = CategoryTitleLabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContentView()
        configureCategoryLabel()
        configureTitleLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureContentView()
        configureCategoryLabel()
        configureTitleLabel()
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
}
