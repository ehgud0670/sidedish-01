//
//  TitleStackView.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/22.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class TitleStackView: UIStackView {
    private let titleLabel = TitleLabel()
    private let subTitleLabel = TitleLabel()

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
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        addArrangedSubview(titleLabel)
    }
    
    private func configureSubTitleLabel() {
        subTitleLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        subTitleLabel.textColor = .lightGray
        addArrangedSubview(subTitleLabel)
    }
}
