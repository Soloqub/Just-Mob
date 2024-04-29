//
//  ViewController.swift
//  Insta
//
//  Created by Денис Львович on 28.04.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let imagesProvider = ImagesProvider()
    private let cellTemplate = PhotoCollectionCell()
    
    private lazy var mainView: View = {
        View(frame: .zero)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = mainView
        
        setTags()
        setCollection()
        setTimer()
    }
    
    private func setTimer() {
        mainView.animatedBox.startTimer(secondsLeft: 3_650)
    }
    
    private func setTags() {
        let tags = TagsProvider().tags
        mainView.tagsView.configure(tags: tags)
    }
    
    private func setCollection() {
        mainView.collectionView.register(PhotoCollectionCell.self, forCellWithReuseIdentifier: PhotoCollectionCell.reuseIdentifier)

        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        imagesProvider.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionCell.reuseIdentifier, for: indexPath) as! PhotoCollectionCell
        
        cell.configure(image: imagesProvider.images[indexPath.item])
        return cell
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.bounds.width / 2 - 4.0.scaled
        let image = imagesProvider.images[indexPath.item]
        let height = width * (image.size.height / image.size.width)
                
        return CGSize(width: width, height: height)
    }
}

final class ImagesProvider {
    let images: [UIImage] = [.photo1, .photo2, .photo3, .photo4, .photo1, .photo2, .photo3, .photo4]
}

final class TagsProvider {
    let tags: [String] = ["#Осень", "#Портрет", "#Insta-стиль", "#Люди", "#Природа", "#Путешествие", "#Жизнь", "#Cчастье", "#Фотодня"]
}


class FlowLayout: UICollectionViewFlowLayout {

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

