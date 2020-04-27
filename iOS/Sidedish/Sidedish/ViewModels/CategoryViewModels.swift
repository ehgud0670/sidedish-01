//
//  CategoryViewModels.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

final class CategoryViewModels {
    enum Notification {
        static let categoryViewModelsDidChange = Foundation.Notification.Name("categoryViewModelsDidChange")
    }
    
    private var categoryViewModels: [CategoryViewModel]
    
    init(count: Int) {
        let dummyHeader = CategoryHeader(id: 0, name: "", description: "")
        let dummyCategoryViewModel = CategoryViewModel(categoryHeader: dummyHeader, productViewModels: [])
        categoryViewModels = [CategoryViewModel].init(repeating: dummyCategoryViewModel, count: count)
    }
    
    func categoryViewModel(at index: Int) -> CategoryViewModel? {
        guard index < categoryViewModels.count else { return nil }
        return categoryViewModels[index]
    }
    
    func insert(at index: Int, categoryViewModel: CategoryViewModel) {
        guard index < categoryViewModels.count else { return  }
        categoryViewModels[index] = categoryViewModel
        NotificationCenter.default.post(name: Notification.categoryViewModelsDidChange,
        object: self, userInfo: ["index": index])
    }
    
    var count: Int {
        return categoryViewModels.count
    }
}
