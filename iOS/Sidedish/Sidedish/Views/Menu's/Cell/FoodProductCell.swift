//
//  ProductCell.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/21.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class FoodProductCell: UITableViewCell, ReusableView {
    private let productImageView = ProductImageView(frame: .zero)
    private let titleStackView = TitleStackView()
    private let priceStackView = PriceStackView()
    private let eventBadgeStackView = EventBadgeStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureProductImageView()
        configureTitleStackView()
        configurePriceStackView()
        configureEventBadgeStackView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureProductImageView()
        configureTitleStackView()
        configurePriceStackView()
        configureEventBadgeStackView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func configureProductImageView() {
        contentView.addSubview(productImageView)
        
        productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                  constant: 10).isActive = true
        productImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        productImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor,
                                                 multiplier: 1).isActive = true
        productImageView.widthAnchor.constraint(equalTo: productImageView.heightAnchor,
                                                multiplier: 1).isActive = true
    }
    
    private func configureTitleStackView() {
        contentView.addSubview(titleStackView)
        
        titleStackView.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor,
                                                constant: 10).isActive = true
        titleStackView.topAnchor.constraint(equalTo: contentView.topAnchor,
                                            constant: 10).isActive = true
    }
    
    private func configurePriceStackView() {
        contentView.addSubview(priceStackView)
        
        priceStackView.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor,
                                                constant: 10).isActive = true
        priceStackView.topAnchor.constraint(equalTo: titleStackView.bottomAnchor,
                                            constant: 0).isActive = true
    }
    
    private func configureEventBadgeStackView() {
        contentView.addSubview(eventBadgeStackView)
        
        eventBadgeStackView.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor,
                                                     constant: 10).isActive = true
        eventBadgeStackView.topAnchor.constraint(equalTo: priceStackView.bottomAnchor,
                                                 constant: 5).isActive = true
        eventBadgeStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                                    constant: -10).isActive = true
    }
}
