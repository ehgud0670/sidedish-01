//
//  DocumentStackView.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/22.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class DocumentStackView: UIStackView {
    private let titleStackView = TitleStackView()
    private let priceStackView = PriceStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        configureTitleStackView()
        configurePriceStackView()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configure()
        configureTitleStackView()
        configurePriceStackView()
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        distribution = .fillEqually
        axis = .vertical
        spacing = 10
    }
    
    private func configureTitleStackView() {
        addArrangedSubview(titleStackView)
    }
    
    private func configurePriceStackView() {
        addArrangedSubview(priceStackView)
    }
}
