//
//  ViewController.swift
//  KeepingToys
//
//  Created by Julio Collado on 10/21/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import UIKit

class KeepToysViewController: UIViewController {
    
    @IBOutlet weak var jetImageView: UIImageView!
    @IBOutlet weak var boxImageView: UIImageView!
    @IBOutlet weak var bearImageView: UIImageView!
    @IBOutlet weak var castleImageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        addPanGesture(view: jetImageView)
        addPanGesture(view: bearImageView)
        addPanGesture(view: castleImageView)
    }
    
    func addPanGesture(view: UIView) {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(self.handlePan(sender:)))
        view.addGestureRecognizer(pan)
    }
    
    @objc func handlePan(sender: UIPanGestureRecognizer) {
        guard let toyView = sender.view else { return }
        
        switch sender.state {
        case .began, .changed:
            moveViewWithPan(concreteView: toyView, sender: sender)
        case .ended:
            keepToyInTheBox(concreteView: toyView)
        default:
            break
        }
    }
    
    func moveViewWithPan(concreteView: UIView, sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: concreteView)
        concreteView.center = CGPoint(x: concreteView.center.x + translation.x, y: concreteView.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: view)
    }
    
    func keepToyInTheBox(concreteView: UIView) {
        if concreteView.frame.intersects(boxImageView.frame) {
            UIView.animate(withDuration: 0.3, animations: {
                concreteView.alpha = 0.0
            }) { _ in
                concreteView.removeFromSuperview()
            }
        }
    }


}

