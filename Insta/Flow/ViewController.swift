//
//  ViewController.swift
//  Insta
//
//  Created by Денис Львович on 28.04.2024.
//

import UIKit

final class ViewController: UIViewController {
    
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

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        imagesProvider.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionCell.reuseIdentifier, for: indexPath) as! PhotoCollectionCell
        
        cell.configure(image: imagesProvider.images[indexPath.item])
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let image = imagesProvider.images[indexPath.item]
        
        let width = collectionView.bounds.width / 2 - 4.0.scaled
        let height = width * (image.size.height / image.size.width)
                
        return CGSize(width: width, height: height)
    }
}
