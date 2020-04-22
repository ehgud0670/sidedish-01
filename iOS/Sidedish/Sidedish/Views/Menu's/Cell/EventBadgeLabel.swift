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
    }
    
    enum Padding {
        static let left: CGFloat = 5
        static let right: CGFloat = 5
        static let top: CGFloat = 3
        static let bottom: CGFloat = 3
    }
    
    override func drawText(in rect: CGRect) {
        let inset = UIEdgeInsets(top: Padding.top,
                                 left: Padding.left,
                                 bottom: Padding.bottom,
                                 right: Padding.right)
        super.drawText(in: rect.inset(by: inset))
    }
}
