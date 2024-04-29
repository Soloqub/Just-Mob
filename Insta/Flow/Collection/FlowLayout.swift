//
//  FlowLayout.swift
//  Insta
//
//  Created by Денис Львович on 29.04.2024.
//

import UIKit

final class FlowLayout: UICollectionViewFlowLayout {

    required init(minimumInteritemSpacing: CGFloat = 0, minimumLineSpacing: CGFloat = 0, sectionInset: UIEdgeInsets = .zero) {
        super.init()

        estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        self.minimumInteritemSpacing = minimumInteritemSpacing
        self.minimumLineSpacing = minimumLineSpacing
        self.sectionInset = sectionInset
        sectionInsetReference = .fromSafeArea
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let layoutAttributes = super.layoutAttributesForElements(in: rect)!.map { $0.copy() as! UICollectionViewLayoutAttributes }
        guard scrollDirection == .vertical else { return layoutAttributes }

        let cellAttributes = layoutAttributes.filter{ $0.representedElementCategory == .cell }

        for (_, attributes) in Dictionary(grouping: cellAttributes,
                                          by: { ($0.center.x / 10).rounded(.up) * 10 }) {
            
            var topInset = sectionInset.top

            for attribute in attributes {
                attribute.frame.origin.y = topInset
                topInset = attribute.frame.maxY + minimumInteritemSpacing
            }
        }

        return layoutAttributes
    }
}
