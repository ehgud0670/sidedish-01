//
//  PriceLabel.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/22.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class PriceLabel: UILabel {
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
    }
    
    func configureUnderLineSingleGreyPrice() {
        guard let text = text else { return }
        let textRange = NSMakeRange(0, text.count)
        let attributedText = NSMutableAttributedString(string: text)
        attributedText.addAttribute(NSAttributedString.Key.font,
                                    value: UIFont.systemFont(ofSize: 17,
                                                             weight: .light),
                                    range: textRange)
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor,
                                    value: UIColor.lightGray,
                                    range: textRange)
        attributedText.addAttribute(NSAttributedString.Key.strikethroughStyle,
                                    value: NSUnderlineStyle.single.rawValue,
                                    range: textRange)
        self.attributedText = attributedText
    }
    
    func configureCyanPrice() {
        guard let text = text else { return }
        let textRange = NSMakeRange(0, text.count)
        let attributedText = NSMutableAttributedString(string: text)
        attributedText.addAttribute(NSAttributedString.Key.font,
                                    value: UIFont.systemFont(ofSize: 25,
                                                             weight: .heavy),
                                    range: textRange)
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor,
                                    value: UIColor.baeminColor,
                                    range: textRange)
        self.attributedText = attributedText
    }
}
