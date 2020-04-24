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
    private let titleLabel = ProductTitleLabel()
    private let subTitleLabel = ProductSubTitleLabel()
    private let normalPriceLabel = PriceLabel()
    private let salePriceLabel = PriceLabel()
    private let eventBadgeStackView = EventBadgeStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureProductImageView()
        configureTitleLabel()
        configureSubTitleLabel()
        configureNormalPriceLabel()
        configureSalePriceLabel()
        configureEventBadgeStackView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureProductImageView()
        configureTitleLabel()
        configureNormalPriceLabel()
        configureEventBadgeStackView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        normalPriceLabel.attributedText = nil
        salePriceLabel.attributedText = nil
        eventBadgeStackView.arrangedSubviews.forEach { arrangedSubview in
            eventBadgeStackView.removeArrangedSubview(arrangedSubview)
            arrangedSubview.removeFromSuperview()
        }
    }
    
    private func configureProductImageView() {
        contentView.addSubview(productImageView)
        
        productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                  constant: 0).isActive = true
        productImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        productImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor,
                                                 multiplier: 1).isActive = true
        productImageView.widthAnchor.constraint(equalTo: productImageView.heightAnchor,
                                                multiplier: 1).isActive = true
    }
    
    private func configureTitleLabel() {
        contentView.addSubview(titleLabel)
        
        titleLabel.heightAnchor.constraint(equalToConstant: titleLabel.intrinsicContentSize.height).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor,
                                            constant: 0).isActive = true
        titleLabel.topAnchor.constraint(equalTo: productImageView.topAnchor,
                                        constant: 15).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    }
    
    private func configureSubTitleLabel() {
        contentView.addSubview(subTitleLabel)
        
        subTitleLabel.heightAnchor.constraint(equalToConstant: titleLabel.intrinsicContentSize.height).isActive = true
        subTitleLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor,
                                               constant: 0).isActive = true
        subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                           constant: 2).isActive = true
        subTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                constant: -10).isActive = true
    }
    
    private func configureNormalPriceLabel() {
        contentView.addSubview(normalPriceLabel)
        
        normalPriceLabel.heightAnchor.constraint(equalToConstant: titleLabel.intrinsicContentSize.height).isActive = true
        normalPriceLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor,
                                                  constant: 0).isActive = true
        normalPriceLabel.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor,
                                              constant: 8).isActive = true
    }
    
    private func configureSalePriceLabel() {
        contentView.addSubview(salePriceLabel)
        
        salePriceLabel.heightAnchor.constraint(equalToConstant: titleLabel.intrinsicContentSize.height).isActive = true
        salePriceLabel.leadingAnchor.constraint(equalTo: normalPriceLabel.trailingAnchor,
                                                constant: 7).isActive = true
        salePriceLabel.topAnchor.constraint(equalTo: normalPriceLabel.topAnchor).isActive = true
    }
    
    private func configureEventBadgeStackView() {
        contentView.addSubview(eventBadgeStackView)
        
        eventBadgeStackView.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor,
                                                     constant: 0).isActive = true
        eventBadgeStackView.topAnchor.constraint(equalTo: normalPriceLabel.bottomAnchor,
                                                 constant: 8).isActive = true
        eventBadgeStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                                    constant: -20).isActive = true
    }
    
    func configureTitle(text: String) {
        titleLabel.text = text
    }
    
    func configureSubtitle(text: String) {
        subTitleLabel.text = text
    }
    
    func configure(normalPriceText: String, salePriceText: String?, unitText: String) {
        if salePriceText == nil {
            configure(normalPriceText: normalPriceText, unitText: unitText)
        } else {
            configure(normalPriceText: normalPriceText,
                      salePriceText: salePriceText!,
                      unitText: unitText)
        }
    }
    
    func configure(normalPriceText: String, unitText: String) {
        normalPriceLabel.configureCyan(priceText: normalPriceText, unitText: unitText)
    }
    
    func configure(normalPriceText: String, salePriceText: String, unitText: String) {
        normalPriceLabel.configureUnderLineSingleGrey(priceText: normalPriceText)
        salePriceLabel.configureCyan(priceText: salePriceText, unitText: unitText)
    }
    
    func configureEventBadges(badges: [String]) {
        let eventBadgeLabels = badges.map { badge -> EventBadgeLabel in
            let label = EventBadgeLabel()
            label.text = badge
            return label
        }
        eventBadgeLabels.forEach {
            eventBadgeStackView.addArrangedSubview($0)
        }
    }
}
