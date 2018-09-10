//
//  UIView+Fade.swift
//  Solving Quadratic Equations
//
//  Created by Hirday Gupta on 21/09/16.
//  Copyright © 2016 Hirday Gupta. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    
    func fadeIn(duration: TimeInterval = 0.35, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.alpha = 0.85
            }, completion: completion)  }
    
    func fadeOut(duration: TimeInterval = 0.35, delay: TimeInterval = 0.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.alpha = 0.0
            }, completion: completion)
    }
    
}
