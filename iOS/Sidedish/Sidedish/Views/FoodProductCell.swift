//
//  ProductCell.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/21.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class FoodProductCell: UITableViewCell, ReusableView {
    private let productImageView = ProductImageView(frame: .zero)
    private let documentStackView = DocumentStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureProductImageView()
        configureDocumentStackView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureProductImageView()
        configureDocumentStackView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func configureProductImageView() {
        contentView.addSubview(productImageView)
        
        productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        productImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        productImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor,
                                                 multiplier: 1).isActive = true
        productImageView.widthAnchor.constraint(equalTo: productImageView.heightAnchor,
                                                multiplier: 1).isActive = true
    }
    
    private func configureDocumentStackView() {
        contentView.addSubview(documentStackView)
        
        documentStackView.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor).isActive = true
        documentStackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        documentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
