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
            configureThumbs()
            configureDetails()
        }
    }
    
    private func configureThumbs() {
        detailViewModel?.thumbDatas?.forEach { imageData in
            self.addThumb(imageData)
        }
    }
    
    private func addThumb(_ data: Data) {
        DispatchQueue.main.async {
            let image = UIImage(data: data)
            let thumbView = UIImageView(image: image)
            self.detailVerticalScrollView.addThumb(imageView: thumbView)
        }
    }
    
    private func configureDetails() {
        detailViewModel?.detailDatas?.forEach{ imageData in
                self.addDetail(imageData)
        }
    }
    
    private func addDetail(_ data: Data) {
        DispatchQueue.main.async {
            let image = UIImage(data: data)
            let detailView = UIImageView(image: image)
            self.detailVerticalScrollView.addDetail(imageView: detailView)
        }
    }
}
