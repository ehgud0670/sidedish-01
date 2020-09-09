//
//  ProductCell.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/21.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

final class ProductCell: UITableViewCell, ReusableView {
    private let productImageView = ProductImageView(frame: .zero)
    private let titleLabel = ProductTitleLabel()
    private let subTitleLabel = ProductSubTitleLabel()
    private let normalPriceLabel = PriceLabel()
    private let salePriceLabel = PriceLabel()
    private let eventBadgeStackView = EventBadgeStackView()
    private var disposeBag = DisposeBag()
    let onData: AnyObserver<Product>
    private let data = PublishSubject<Product>()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        onData = data.asObserver()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureProductImageView()
        configureTitleLabel()
        configureSubTitleLabel()
        configureNormalPriceLabel()
        configureSalePriceLabel()
        configureEventBadgeStackView()
        
        bindUI()
    }
    
    required init?(coder: NSCoder) {
        let data = PublishSubject<Product>()
        onData = data.asObserver()
        
        super.init(coder: coder)
        
        configureProductImageView()
        configureTitleLabel()
        configureSubTitleLabel()
        configureNormalPriceLabel()
        configureSalePriceLabel()
        configureEventBadgeStackView()
        
        bindUI()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        clear()
        disposeBag = DisposeBag()
        bindUI() // resubscirbe on data
    }
    
    private func clear() {
        normalPriceLabel.attributedText = nil
        salePriceLabel.attributedText = nil
        eventBadgeStackView.arrangedSubviews.forEach { arrangedSubview in
            eventBadgeStackView.removeArrangedSubview(arrangedSubview)
            arrangedSubview.removeFromSuperview()
        }
        productImageView.image = nil
    }
    
    private func bindUI() {
        data.subscribe(onNext: {
            self.configureTitle(text: $0.title)
            self.configureSubtitle(text: $0.description)
            self.configureEventBadges(badges: $0.badges)
            
            guard let normalPriceText = ProductViewModel.text(price: $0.normal_price) else { return }
            
            let salePriceText = ProductViewModel.text(price: $0.sale_price)
            self.configure(
                normalPriceText: normalPriceText,
                salePriceText: salePriceText,
                unitText: ProductViewModel.unitText
            )
        }).disposed(by: disposeBag)
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
                                           constant: -12).isActive = true
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
    
    func configure(image: UIImage) {
        DispatchQueue.main.async {
            self.productImageView.image = image
            self.productImageView.layer.cornerRadius = self.productImageView.frame.size.width / 2
            self.productImageView.clipsToBounds = true
        }
    }
    
    private func configureTitle(text: String) {
        titleLabel.text = text
    }
    
    private func configureSubtitle(text: String) {
        subTitleLabel.text = text
    }
    
    private func configure(normalPriceText: String, salePriceText: String?, unitText: String) {
        if salePriceText == nil {
            configure(normalPriceText: normalPriceText, unitText: unitText)
        } else {
            configure(normalPriceText: normalPriceText,
                      salePriceText: salePriceText!,
                      unitText: unitText)
        }
    }
    
    private func configure(normalPriceText: String, unitText: String) {
        normalPriceLabel.configureCyan(priceText: normalPriceText, unitText: unitText)
    }
    
    private func configure(normalPriceText: String, salePriceText: String, unitText: String) {
        normalPriceLabel.configureUnderLineSingleGrey(priceText: normalPriceText)
        salePriceLabel.configureCyan(priceText: salePriceText, unitText: unitText)
    }
    
    private func configureEventBadges(badges: [String]) {
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
