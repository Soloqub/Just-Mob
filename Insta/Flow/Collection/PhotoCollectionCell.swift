//
//  PhotoCollectionCell.swift
//  Insta
//
//  Created by Денис Львович on 29.04.2024.
//

import UIKit
import PinLayout

final class PhotoCollectionCell: UICollectionViewCell {
    
    static let reuseIdentifier = "PhotoCollectionCell"
    
    private lazy var photoView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        
        self.contentView.addSubview(view)
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layout()
    }
    
    func configure(image: UIImage) {
        photoView.image = image
        setNeedsLayout()
    }
    
    private func layout() {
        photoView.pin
            .all()
        
        photoView.setCornerRadius(radius: 14.0)
    }
}
