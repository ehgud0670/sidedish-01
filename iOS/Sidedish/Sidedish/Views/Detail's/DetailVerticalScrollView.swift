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
    private let detailInfoView = DetailInfoView()
    private let detailStackView = DetailStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        configureThumbScrollView()
        configureDetailInfoView()
        configureDetailStackView()
        configureContentLayoutGuide()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        translatesAutoresizingMaskIntoConstraints = false
        configureThumbScrollView()
        configureDetailInfoView()
        configureDetailStackView()
        configureContentLayoutGuide()
    }
    
    private func configureThumbScrollView() {
        addSubview(thumbScrollView)
        
        thumbScrollView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        thumbScrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        thumbScrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    }
    
    private func configureDetailInfoView() {
        addSubview(detailInfoView)
        
        detailInfoView.topAnchor.constraint(equalTo: thumbScrollView.bottomAnchor, constant: 10).isActive = true
        detailInfoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        detailInfoView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }
    
    private func configureDetailStackView() {
        addSubview(detailStackView)
        
        detailStackView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        detailStackView.topAnchor.constraint(equalTo: detailInfoView.bottomAnchor, constant: 10).isActive = true
        detailStackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    }
    
    private func configureContentLayoutGuide() {
        contentLayoutGuide.topAnchor.constraint(equalTo: thumbScrollView.topAnchor).isActive = true
        contentLayoutGuide.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        contentLayoutGuide.bottomAnchor.constraint(equalTo: detailStackView.bottomAnchor).isActive = true
    }
    
    func configure(thumb: UIImage){
        DispatchQueue.main.async {
            let thumbView = UIImageView(image: thumb)
            self.thumbScrollView.addToStack(view: thumbView)
        }
    }
    
    func configure(detail: UIImage) {
        DispatchQueue.main.async {
            let detailView = UIImageView(image: detail)
            self.addDetail(imageView: detailView)
        }
    }
    
    private func addDetail(imageView: UIImageView) {
        let ratio =  imageView.frame.height / imageView.frame.width
        detailStackView.addArrangedSubview(imageView)
        imageView.widthAnchor.constraint(equalTo: detailStackView.widthAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: ratio).isActive = true
    }
    
    func configureDetailInfo(detailData: ProductDetailData) {
        detailInfoView.configure(detailData: detailData)
    }
}
