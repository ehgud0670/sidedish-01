//
//  EventBadgeLabel.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/22.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class EventBadgeLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .purple
        configureText()
    }
    
    private func configureText() {
        font = UIFont.systemFont(ofSize: 13, weight: .regular)
        textColor = .white
        text = "이벤트 특가"
    }
}
