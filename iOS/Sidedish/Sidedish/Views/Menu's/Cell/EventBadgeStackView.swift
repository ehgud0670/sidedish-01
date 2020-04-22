//
//  EventBadgeStackView.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/22.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class EventBadgeStackView: UIStackView {
    private let temp = EventBadgeLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        configureTemp()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configure()
        configureTemp()
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        distribution = .fillEqually
        spacing = -10
    }
    
    private func configureTemp() {
        temp.text = "이벤트 특가"
        let widthConstant = temp.intrinsicContentSize.width +
            EventBadgeLabel.Padding.left +
            EventBadgeLabel.Padding.right
        temp.widthAnchor.constraint(equalToConstant:  widthConstant).isActive = true
        let heightContstant = temp.intrinsicContentSize.height +
            EventBadgeLabel.Padding.top +
            EventBadgeLabel.Padding.bottom
        temp.heightAnchor.constraint(equalToConstant: heightContstant).isActive = true
        addArrangedSubview(temp)
    }
}
