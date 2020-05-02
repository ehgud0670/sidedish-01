//
//  DetailInfoView.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/05/02.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class DetailInfoView: UIView {
    let titleLabel = ProductTitleLabel()
    let subtitleLabel: ProductSubTitleLabel = {
        let label = ProductSubTitleLabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        return label
    }()
    private let lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray5
        view.heightAnchor.constraint(equalToConstant: 5).isActive = true
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        configureTitleLabel()
        configureSubTitleLabel()
        configureLineView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        translatesAutoresizingMaskIntoConstraints = false
        configureTitleLabel()
        configureSubTitleLabel()
        configureLineView()
    }
    
    private func configureTitleLabel() {
        addSubview(titleLabel)
        
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
    }
    
    private func configureSubTitleLabel() {
        addSubview(subtitleLabel)
        
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                           constant: 5).isActive = true
        subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
    }
    
    private func configureLineView() {
        addSubview(lineView)
        
        lineView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor,
                                      constant: 10).isActive = true
        lineView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        lineView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        lineView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    }
}
