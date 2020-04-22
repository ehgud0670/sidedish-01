//
//  PriceStackView.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/22.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class PriceStackView: UIStackView {
    private let normalPriceLabel = PriceLabel()
    private let salePriceLabel = PriceLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        configureNormalPriceLabel()
        configureSalePriceLabel()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configure()
        configureNormalPriceLabel()
        configureSalePriceLabel()
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        distribution = .fillEqually
        spacing = -71
    }
    
    private func configureNormalPriceLabel() {
        normalPriceLabel.text = "7,500"
        normalPriceLabel.configureUnderLineSingleGreyPrice()
        addArrangedSubview(normalPriceLabel)
    }
    
    private func configureSalePriceLabel() {
        salePriceLabel.text = "7,100"
        salePriceLabel.configureCyanPrice()
        addArrangedSubview(salePriceLabel)
    }
}
