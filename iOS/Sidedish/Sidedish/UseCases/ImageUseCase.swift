//
//  ImageUseCase.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/28.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

struct ImageUseCase {
    static func imageData(from urlString: String,  completionHandler: @escaping (Data?) -> ()) {
        guard let imageURL = URL(string: urlString),
            let destinaionURL = try? FileManager.default.url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(imageURL.lastPathComponent) else { return }
        
        if let imageData = try? Data(contentsOf: destinaionURL) {
            completionHandler(imageData)
        } else {
            Self.downloadImageData(requestURL: imageURL, destinationURL: destinaionURL) { imageData in
                guard let imageData = imageData else { return }
                completionHandler(imageData)
            }
        }
    }
    
    private static func downloadImageData(requestURL: URL, destinationURL: URL,
                                  completionHandler: @escaping (Data?) -> ()) {
        URLSession.shared.downloadTask(with: requestURL) { (tempURL, urlResponse, error) in
            guard let tempURL = tempURL else { return }
            do {
                guard let imageData = try? Data(contentsOf: tempURL) else { return }
                completionHandler(imageData)
                try FileManager.default.moveItem(at: tempURL, to: destinationURL)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
}

