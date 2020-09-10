//
//  ImageUseCase.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/28.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

import RxSwift

struct ImageUseCase {
    static func requestImageRx(from urlString: String) -> Observable<UIImage> {
        return Observable.create { emitter in
            requestImage(from: urlString) { image in
                guard let image = image else { return }
                emitter.onNext(image)
            }
            return Disposables.create()
        }
    }
    
    static func requestImage(from urlString: String,  completionHandler: @escaping (UIImage?) -> ()) {
        guard let imageURL = URL(string: urlString),
            let destinaionURL = try? FileManager.default.url(
                for: .cachesDirectory,
                in: .userDomainMask,
                appropriateFor: nil,
                create: false
            ).appendingPathComponent(imageURL.lastPathComponent) else { return }
        
        if let imageData = try? Data(contentsOf: destinaionURL) {
            completionHandler(UIImage(data: imageData))
            
        } else {
            Self.downloadImageData(
            requestURL: imageURL,
            destinationURL: destinaionURL
            ) { imageData in
                guard let imageData = imageData else { return }
                
                completionHandler(UIImage(data: imageData))
            }
        }
    }
    
    private static func downloadImageData(requestURL: URL,destinationURL: URL,
                                          completionHandler: @escaping (Data?) -> ()) {
        URLSession.shared.downloadTask(with: requestURL) { (tempURL, urlResponse, error) in
            guard let tempURL = tempURL else { return }
            try? FileManager.default.moveItem(at: tempURL, to: destinationURL)
            guard let imageData = try? Data(contentsOf: destinationURL) else { return }
            completionHandler(imageData)
        }.resume()
    }
}
