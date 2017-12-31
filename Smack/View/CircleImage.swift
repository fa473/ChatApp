//
//  CircleImage.swift
//  Smack
//
//  Created by home on 12/30/17.
//  Copyright © 2017 home. All rights reserved.
//

import UIKit

@IBDesignable
class CircleImage: UIImageView {

 

    override func awakeFromNib() {
        setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
}
