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
    
    override func drawText(in rect: CGRect) {
        let inset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        super.drawText(in: rect.inset(by: inset))
    }
}
