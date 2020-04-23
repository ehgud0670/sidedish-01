//
//  EventBadgeStackView.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/22.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class EventBadgeStackView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        distribution = .fillEqually
        spacing = -10
    }
}
