//
//  ViewController.swift
//  DraggableImage
//
//  Created by Antonija on 05/11/2016.
//  Copyright © 2016 Antonija Pek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var letterA: dragImg!
    @IBOutlet weak var letterB: dragImg!
    @IBOutlet weak var letterAtarget: UIView!
    @IBOutlet weak var letterBtarget: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        letterA.dropTarget = letterAtarget
        letterB.dropTarget = letterBtarget
        
        let notificationName = Notification.Name("onTarget")
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.onTarget), name: notificationName, object: nil)
    }
    
    func onTarget(notif: AnyObject) {
        // Do something when letter is on target...
    }
}

