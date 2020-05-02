//
//  ProductDetailViewController.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/05/01.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {
    private let detailVerticalScrollView = DetailVerticalScrollView()
    private let orderButton: UIButton = {
       let button = UIButton()
        button.tintColor = UIColor.systemBackground
        button.setTitle("주문하기", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.baeminColor
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.borderWidth = 1
        configureView()
        configureDetailVerticalScrollView()
        configureOrderButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    private func configureView() {
        view.backgroundColor = .systemBackground
    }
    
    private func configureDetailVerticalScrollView() {
        view.addSubview(detailVerticalScrollView)
        
        let safeArea = view.safeAreaLayoutGuide
        detailVerticalScrollView.widthAnchor.constraint(equalTo: safeArea.widthAnchor).isActive = true
        detailVerticalScrollView.heightAnchor.constraint(equalTo: safeArea.heightAnchor).isActive = true
        detailVerticalScrollView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        detailVerticalScrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
    }
    
    private func configureOrderButton() {
        view.addSubview(orderButton)
        
        let safeArea = view.safeAreaLayoutGuide
        orderButton.widthAnchor.constraint(equalTo: safeArea.widthAnchor).isActive = true
        orderButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        orderButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        orderButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
    }
    
    var detailViewModel: DetailViewModel? {
        didSet {
            guard let detailViewModel = detailViewModel else { return }
            detailVerticalScrollView.configureThumbs(datas: detailViewModel.thumbDatas)
            detailVerticalScrollView.configureDetails(datas: detailViewModel.detailDatas)
            detailVerticalScrollView.configureDetailInfo(detailData: detailViewModel.productDetailData)
        }
    }
}
