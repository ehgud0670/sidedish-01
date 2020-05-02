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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureDetailVerticalScrollView()
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
    
    var detailViewModel: DetailViewModel? {
        didSet {
            guard let detailViewModel = detailViewModel else { return }
            detailVerticalScrollView.configureThumbs(datas: detailViewModel.thumbDatas)
            detailVerticalScrollView.configureDetails(datas: detailViewModel.detailDatas)
            detailVerticalScrollView.configureDetailInfo(detailData: detailViewModel.productDetailData)
        }
    }
}
