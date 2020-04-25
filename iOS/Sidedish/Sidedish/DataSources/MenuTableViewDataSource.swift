//
//  MenuTableViewDataSource.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class MenuTableViewDataSource: NSObject, UITableViewDataSource {
    let sectionCountHandler: () -> (Int?)
    let rowCountHandler: (Int) -> (Int?)
    let modelBindingHandler: (Int, Int) -> (ProductViewModel?)
    
    init(sectionCountHandler: @escaping () -> (Int?),
         rowCountHandler: @escaping (Int) -> (Int?),
         modelBindingHandler: @escaping (Int, Int) -> (ProductViewModel?)) {
        self.sectionCountHandler = sectionCountHandler
        self.rowCountHandler = rowCountHandler
        self.modelBindingHandler = modelBindingHandler
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowCountHandler(section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let productCell = tableView.dequeueReusableCell(withIdentifier: FoodProductCell.reuseIdentifier,
        for: indexPath) as? FoodProductCell else { return FoodProductCell() }
        guard let productViewModel = modelBindingHandler(indexPath.section, indexPath.row) else {
            return FoodProductCell()
        }
        
        productViewModel.performBind { product in
            productCell.configureTitle(text: product.title)
            productCell.configureSubtitle(text: product.description)
            productCell.configureEventBadges(badges: product.badge)
            
            guard let normalPriceText = productViewModel.text(price: product.normal_price) else { return }
            let salePriceText = productViewModel.text(price: product.sale_price)
            productCell.configure(normalPriceText: normalPriceText,
                                  salePriceText: salePriceText,
                                  unitText: productViewModel.unitText)
        }
        return productCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let sectionCount = sectionCountHandler() else { return 0 }
        return sectionCount
    }
}
