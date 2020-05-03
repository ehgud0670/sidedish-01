//
//  ThumbScrollView.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/05/02.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class ThumbScrollView: UIScrollView {
    private let thumbStackView = ThumbStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        isPagingEnabled = true
        configureThumbStackView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        translatesAutoresizingMaskIntoConstraints = false
        isPagingEnabled = true
        configureThumbStackView()
    }
    
    private func configureThumbStackView() {
        addSubview(thumbStackView)
        
        thumbStackView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        thumbStackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        thumbStackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentLayoutGuide.widthAnchor.constraint(equalTo: thumbStackView.widthAnchor).isActive = true
    }
    
    func addToStack(view: UIView) {
        thumbStackView.addArrangedSubview(view)
        view.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        view.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        view.contentMode = .scaleAspectFill
    }
}
