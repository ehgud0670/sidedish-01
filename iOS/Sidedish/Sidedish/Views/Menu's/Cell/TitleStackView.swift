//
//  TitleStackView.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/22.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class TitleStackView: UIStackView {
    private let productTitleLabel = ProductTitleLabel()
    private let productSubTitleLabel = ProductSubTitleLabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        configureTitleLabel()
        configureSubTitleLabel()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configure()
        configureTitleLabel()
        configureSubTitleLabel()
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        distribution = .fillEqually
        axis = .vertical
        spacing = -5
    }
    
    private func configureTitleLabel() {
        addArrangedSubview(productTitleLabel)
    }
    
    private func configureSubTitleLabel() {
        addArrangedSubview(productSubTitleLabel)
    }
    
    func configureTitle(text: String){
        productTitleLabel.text = text
    }
    
    func configureSubTitle(text: String) {
        productSubTitleLabel.text = text
    }
}
