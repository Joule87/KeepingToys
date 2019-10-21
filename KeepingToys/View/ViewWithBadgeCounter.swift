//
//  ViewWithBadgeCounter.swift
//  KeepingToys
//
//  Created by Julio Collado on 10/21/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import UIKit

class ViewWithBadgeCounter: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var badgeCounterLabel: UILabel!
    static let nibName = "ViewWithBadgeCounter"
    var counterItem: Int = 0 {
        didSet{
            badgeCounterLabel.text = "\(counterItem)"
        }
    }
    
    func setImage(imageName: String) {
        imageView.image = UIImage(named: imageName)
    }
    
}
