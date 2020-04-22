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
        addArrangedSubview(temp)
    }
}
