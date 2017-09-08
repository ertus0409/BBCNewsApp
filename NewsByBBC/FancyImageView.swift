//
//  FancyImageView.swift
//  NewsByBBC
//
//  Created by Guner Babursah on 08/09/2017.
//  Copyright © 2017 Guner Babursah. All rights reserved.
//

import UIKit

class FancyImageView: UIImageView {

    let SHADOW_GREY: CGFloat = 120.0/255.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 0.8
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        layer.shadowColor = UIColor(red: SHADOW_GREY, green: SHADOW_GREY, blue: SHADOW_GREY, alpha: 0.6).cgColor
    }

}
