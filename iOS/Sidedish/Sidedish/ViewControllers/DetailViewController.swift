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
    
    var detailData: ProductDetailData? {
        didSet {
            configureThumbs()
        }
    }
    
    private func configureThumbs() {
        detailData?.thumbs.forEach {
            ImageUseCase.imageData(from: $0) { imageData in
                guard let imageData = imageData else { return }
                self.addThumb(imageData)
            }
        }
    }
    
    private func addThumb(_ data: Data) {
        DispatchQueue.main.async {
            let image = UIImage(data: data)
            let thumbView = UIImageView(image: image)
            self.detailVerticalScrollView.thumbScrollView.addToStack(view: thumbView)
        }
    }
}

final class DetailVerticalScrollView: UIScrollView {
    let thumbScrollView = ThumbScrollView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        configureThumbScrollView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureThumbScrollView() {
        addSubview(thumbScrollView)
        
        thumbScrollView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        thumbScrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        thumbScrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentLayoutGuide.topAnchor.constraint(equalTo: thumbScrollView.topAnchor).isActive = true
    }
}

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
        view.heightAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
}

final class ThumbStackView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        distribution = .fill
    }
}
