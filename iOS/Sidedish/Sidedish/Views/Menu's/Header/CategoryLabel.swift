//
//  CategoryLabel.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/21.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class CategoryLabel: UILabel {
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
        configureText()
        configureBorder()
    }
    
    private func configureText() {
        textColor = .lightGray
        text = "Category label"
    }
    
    private func configureBorder() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
    }
    
    enum Padding {
        static let left: CGFloat = 4
        static let right: CGFloat = 4
        static let top: CGFloat = 2
        static let bottom: CGFloat = 2
    }
    
    override func drawText(in rect: CGRect) {
        let inset = UIEdgeInsets(top: Padding.top,
                                 left: Padding.left,
                                 bottom: Padding.bottom,
                                 right: Padding.right)
        super.drawText(in: rect.inset(by: inset))
    }
}
