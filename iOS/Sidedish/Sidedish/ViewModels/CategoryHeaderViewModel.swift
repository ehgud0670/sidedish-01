//
//  CategoryHeaderViewModel.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/23.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

final class CategoryHeaderViewModel: ViewModelBinding {
    typealias Key = CategoryHeader
    private let header: Key
    private var changedHandler: (Key) -> ()
    
    init(header: Key, handler: @escaping (Key) -> () = { _ in } ) {
        self.header = header
        self.changedHandler = handler
        changedHandler(header)
    }
    
    func performBind(changed handler: @escaping (Key) -> ()) {
        self.changedHandler = handler
        changedHandler(header)
    }
}
