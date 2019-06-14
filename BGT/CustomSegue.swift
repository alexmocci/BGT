//
//  CustomSegue.swift
//  BGT
//
//  Created by user153403 on 4/22/19.
//  Copyright © 2019 alexmocci. All rights reserved.
//

import UIKit

class CustomSegue: UIStoryboardSegue {
    override func perform() {
        let src = self.source as UIViewController
        let dst = self.destination as UIViewController
        
        src.view.superview?.insertSubview(dst.view, aboveSubview: src.view)
        dst.view.transform = CGAffineTransform(translationX: 0, y: -src.view.frame.size.height)
        
        UIView.animate(withDuration: 1.0, animations: {
            dst.view.transform = CGAffineTransform(translationX: 0, y: 0)
            
        }) { (Finished) in
            src.present(dst, animated: false, completion: nil)
        }
    }
}
