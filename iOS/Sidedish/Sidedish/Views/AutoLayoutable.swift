//
//  AutoLayoutable.swift
//  Sidedish
//
//  Created by kimdo2297 on 2020/04/21.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

protocol AutoLayoutable where Self: UIView {
    func configureTranslatesAutoresizingMaskIntoConstraints()
}

extension AutoLayoutable {
    func configureTranslatesAutoresizingMaskIntoConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
