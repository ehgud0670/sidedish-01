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
    private let eventBadgeStackView = EventBadgeStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        configureTitleStackView()
        configurePriceStackView()
        configureEventBadgeStackView()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configure()
        configureTitleStackView()
        configurePriceStackView()
        configureEventBadgeStackView()
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        distribution = .fillEqually
        axis = .vertical
        spacing = -3
    }
    
    private func configureTitleStackView() {
        addArrangedSubview(titleStackView)
    }
    
    private func configurePriceStackView() {
        addArrangedSubview(priceStackView)
    }
    
    private func configureEventBadgeStackView() {
        addArrangedSubview(eventBadgeStackView)
    }
}
