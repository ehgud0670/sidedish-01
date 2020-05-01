//
//  ProductCell.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/21.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class ProductCell: UITableViewCell, ReusableView {
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
        productImageView.image = nil
    }
    
    private func configureProductImageView() {
        contentView.addSubview(productImageView)
        
        productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                  constant: 10).isActive = true
        productImageView.topAnchor.constraint(equalTo: contentView.topAnchor,
                                              constant: 10).isActive = true
        productImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                                 constant: -10).isActive = true
    }
    
    private func configureTitleLabel() {
        contentView.addSubview(titleLabel)
        
        titleLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor,
                                            constant: 10).isActive = true
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor,
                                        constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    }
    
    private func configureSubTitleLabel() {
        contentView.addSubview(subTitleLabel)
        
        subTitleLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor,
                                               constant: 10).isActive = true
        subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                           constant: 2).isActive = true
        subTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                constant: -10).isActive = true
    }
    
    private func configureNormalPriceLabel() {
        contentView.addSubview(normalPriceLabel)
        
        normalPriceLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor,
                                                  constant: 10).isActive = true
        normalPriceLabel.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor,
                                              constant: 8).isActive = true
    }
    
    private func configureSalePriceLabel() {
        contentView.addSubview(salePriceLabel)
        
        salePriceLabel.leadingAnchor.constraint(equalTo: normalPriceLabel.trailingAnchor,
                                                constant: 7).isActive = true
        salePriceLabel.centerYAnchor.constraint(equalTo: normalPriceLabel.centerYAnchor).isActive = true
    }
    
    private func configureEventBadgeStackView() {
        contentView.addSubview(eventBadgeStackView)
        
        eventBadgeStackView.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor,
                                                     constant: 10).isActive = true
        eventBadgeStackView.topAnchor.constraint(equalTo: normalPriceLabel.bottomAnchor,
                                                 constant: 8).isActive = true
        eventBadgeStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
    
    func configureImage(data: Data) {
        DispatchQueue.main.async {
            guard let image = UIImage(data: data) else { return }
            self.productImageView.image = image
            self.productImageView.layer.cornerRadius = self.productImageView.frame.size.width / 2
            self.productImageView.clipsToBounds = true
        }
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
