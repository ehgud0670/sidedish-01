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
        spacing = -35
    }
    
    private func configureNormalPriceLabel() {
        normalPriceLabel.configureUnderLineSingleGrey(priceText: "7500")
        addArrangedSubview(normalPriceLabel)
    }
    
    private func configureSalePriceLabel() {
        salePriceLabel.configureCyan(priceText: "7,100", unitText: "원")
        addArrangedSubview(salePriceLabel)
    }
}
