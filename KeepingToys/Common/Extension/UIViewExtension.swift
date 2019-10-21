//
//  UIViewExtension.swift
//  KeepingToys
//
//  Created by Julio Collado on 10/21/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import UIKit

extension UIView {
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = abs(CGFloat(Int(newValue * 100)) / 100)
        }
    }
}
