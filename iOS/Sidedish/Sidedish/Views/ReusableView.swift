//
//  ReusableView.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/21.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

protocol ReusableView where Self: UIView {
    
}

extension ReusableView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
