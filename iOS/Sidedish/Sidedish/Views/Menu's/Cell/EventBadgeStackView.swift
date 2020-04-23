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
        configureTempLabel()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configure()
        configureTempLabel()
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        distribution = .fillProportionally
        spacing = 5
    }
    
    private func configureTempLabel() {
        let label = EventBadgeLabel()
        label.text = "임시"
        addArrangedSubview(label)
    }
}
