//
//  DetailScrollView.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/05/02.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class DetailVerticalScrollView: UIScrollView {
    private let thumbScrollView = ThumbScrollView()
    private let detailStackView = DetailStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        configureThumbScrollView()
        configureDetailStackView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        translatesAutoresizingMaskIntoConstraints = false
        configureThumbScrollView()
        configureDetailStackView()
    }
    
    private func configureThumbScrollView() {
        addSubview(thumbScrollView)
        
        thumbScrollView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        thumbScrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        thumbScrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentLayoutGuide.topAnchor.constraint(equalTo: thumbScrollView.topAnchor).isActive = true
    }
    
    private func configureDetailStackView() {
        addSubview(detailStackView)
        
        detailStackView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        detailStackView.topAnchor.constraint(equalTo: thumbScrollView.bottomAnchor).isActive = true
        detailStackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentLayoutGuide.bottomAnchor.constraint(equalTo: detailStackView.bottomAnchor).isActive = true
    }
    
    func addThumb(imageView: UIImageView){
        thumbScrollView.addToStack(view: imageView)
    }
    
    func addDetail(imageView: UIImageView) {
        let ratio =  imageView.frame.height / imageView.frame.width
        
        detailStackView.addArrangedSubview(imageView)
        imageView.widthAnchor.constraint(equalTo: detailStackView.widthAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: ratio).isActive = true
    }
}
