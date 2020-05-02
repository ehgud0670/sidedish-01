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
            configureDetails()
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
            self.detailVerticalScrollView.addThumb(imageView: thumbView)
        }
    }
    
    private func configureDetails() {
        detailData?.details.forEach {
            ImageUseCase.imageData(from: $0) { imageData in
                guard let imageData = imageData else { return }
                self.addDetail(imageData)
            }
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

final class DetailStackView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    private func configureView() {
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        distribution = .fill
    }
}
