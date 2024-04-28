//
//  FontBuilder.swift
//  Animated Box
//
//  Created by Денис Львович on 27.04.2024.
//

import UIKit

enum FontBuilder {
    case system(size: Double)
    case systemSemibold(size: Double)
    case systemBold(size: Double)
    case systemMedium(size: Double)

    var build: UIFont {
        switch self {
        case .system(let size):
            return UIFont.systemFont(ofSize: size.scaled)
        case .systemBold(let size):
            return UIFont.systemFont(ofSize: size.scaled, weight: .bold)
        case .systemSemibold(let size):
            return UIFont.systemFont(ofSize: size.scaled, weight: .semibold)
        case .systemMedium(let size):
            return UIFont.systemFont(ofSize: size.scaled, weight: .medium)
        }
    }
}
