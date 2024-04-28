//
//  Scaled.swift
//  Animated Box
//
//  Created by Денис Львович on 26.04.2024.
//

import UIKit

extension Double {
    var scaled: CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        return screenWidth * CGFloat(self) / 375.0
    }
}
