//
//  MenuTableViewDataSource.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/21.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class MenuTableViewDataSource: NSObject, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let temp = 10
        return temp
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let productCell = tableView.dequeueReusableCell(withIdentifier: FoodProductCell.reuseIdentifier,
                                                              for: indexPath) as? FoodProductCell else { return FoodProductCell() }
        return productCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        let temp = 10
        return temp
    }
}
