//
//  ChannelVC.swift
//  Smack
//
//  Created by home on 12/27/17.
//  Copyright © 2017 home. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
    }
}
