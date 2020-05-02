//
//  DetailInfoView.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/05/02.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class DetailInfoView: UIView {
    private let titleLabel = ProductTitleLabel()
    private let subtitleLabel: ProductSubTitleLabel = {
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
    private let priceTitleLabel: InfoTitleLabel = {
        let label = InfoTitleLabel()
        label.text = DetailViewModel.priceTitleText
        return label
    }()
    private let savingTitleLabel: InfoTitleLabel = {
        let label = InfoTitleLabel()
        label.text = DetailViewModel.savingTitleText
        return label
    }()
    private let deliveryCostTitleLabel: InfoTitleLabel = {
        let label = InfoTitleLabel()
        label.text = DetailViewModel.deliveryCostTitleText
        return label
    }()
    private let deliveryInfoTitleLabel: InfoTitleLabel = {
        let label = InfoTitleLabel()
        label.text = DetailViewModel.deliveryInfoTitleText
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        configureTitleLabel()
        configureSubTitleLabel()
        configureLineView()
        configurePriceTitleLabel()
        configureSavingTitleLabel()
        configureDeliveryCostTitleLabel()
        configureDeliveryInfoTitleLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        translatesAutoresizingMaskIntoConstraints = false
        configureTitleLabel()
        configureSubTitleLabel()
        configureLineView()
        configurePriceTitleLabel()
        configureSavingTitleLabel()
        configureDeliveryCostTitleLabel()
        configureDeliveryInfoTitleLabel()
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
    }
    
    private func configurePriceTitleLabel() {
        addSubview(priceTitleLabel)
        
        priceTitleLabel.topAnchor.constraint(equalTo: lineView.bottomAnchor,
                                             constant: 10).isActive = true
        priceTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
    }
    
    private func configureSavingTitleLabel() {
        addSubview(savingTitleLabel)
        
        savingTitleLabel.topAnchor.constraint(equalTo: priceTitleLabel.bottomAnchor,
                                              constant: 10).isActive = true
        savingTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
    }
    
    private func configureDeliveryCostTitleLabel() {
        addSubview(deliveryCostTitleLabel)
        
        deliveryCostTitleLabel.topAnchor.constraint(equalTo: savingTitleLabel.bottomAnchor,
                                                    constant: 10).isActive = true
        deliveryCostTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
    }
    
    private func configureDeliveryInfoTitleLabel() {
        addSubview(deliveryInfoTitleLabel)
        
        deliveryInfoTitleLabel.topAnchor.constraint(equalTo: deliveryCostTitleLabel.bottomAnchor,
                                                    constant: 10).isActive = true
        deliveryInfoTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        deliveryInfoTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    }
    
    func configure(detailData: ProductDetailData) {
        DispatchQueue.main.async {
            self.titleLabel.text = detailData.title
            self.subtitleLabel.text = detailData.description
        }
    }
}
