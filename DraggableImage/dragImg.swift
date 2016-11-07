//
//  dragImg.swift
//  DraggableImage
//
//  Created by Antonija on 05/11/2016.
//  Copyright © 2016 Antonija Pek. All rights reserved.
//

import Foundation
import UIKit

class dragImg: UIImageView {
    
    var originalPosition: CGPoint!
    var dropTarget: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        originalPosition = self.center
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: self.superview)
            self.center = CGPoint(x: position.x, y: position.y)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, let target = dropTarget {
            let position = touch.location(in: self.superview)
            let isOnTarget = target.frame.contains(position)

            if isOnTarget {
                NotificationCenter.default.post(Notification(name: Notification.Name(rawValue:"onTarget")))
                // Make it stay there
                self.center = target.center
            } else {
                self.center = originalPosition
            }
        }
    }
}
