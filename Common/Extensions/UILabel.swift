//
//  UILabel.swift
//  Trial Banner
//
//  Created by Денис Львович on 28.04.2024.
//

import UIKit

extension UILabel {
    func setLineSpacing(lineSpacing: CGFloat) {
        
        guard let labelText = self.text else { return }

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing

        let attributedString = NSMutableAttributedString(string: labelText)
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))

        self.attributedText = attributedString
    }
}
