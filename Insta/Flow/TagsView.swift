//
//  TagsView.swift
//  Insta
//
//  Created by Денис Львович on 29.04.2024.
//

import UIKit
import FlexLayout

final class TagsView: UIScrollView {
    
    //  Да, этот view можно было сделать через коллекцию.
    //  Но, во-первых, одна коллекция в проекте уже есть, а это всё-таки демо.
    //  Во-вторых, через флекс это делается проще, быстрее и приятнее. А преимущества коллекции, вроде переиспользуемости ячеек, для такого небольшого и лёгкого элемента как теги, не особо важны.
    //  Поэтому FlexLayout
        
    private func tagLabel(text: String) -> UILabel {
        let view = UILabel(frame: .zero)
        view.textColor = .tagTextColor
        view.text = text
        view.textAlignment = .center
        view.font = FontBuilder
            .systemSemibold(size: 11.0)
            .build
        
        view.layer.masksToBounds = true
        
        return view
    }
    
    private lazy var contentView: UIView = {
        let view = UIView()
        self.addSubview(view)

        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layout()
    }
        
    func configure(tags: [String]) {
        cleanTagsView()
        
        contentView.flex
            .direction(.row)
            .gap(4.0.scaled)
            .wrap(.wrap)
            .define { flex in
                for tag in tags {
                    flex.addItem(tagLabel(text: tag))
                        .height(100%)
                        .backgroundColor(.tagBackground)
                        .paddingHorizontal(12.0.scaled)
                        .grow(1)
                }
            }
    }
    
    private func cleanTagsView() {
        contentView.subviews.forEach {
            $0.removeFromSuperview()
        }
    }
        
    private func layout() {
        backgroundColor = .black
        showsHorizontalScrollIndicator = false
        
        contentView.pin
            .height(of: self)
        
        contentView.flex
            .layout(mode: .adjustWidth)
        
        contentView.subviews.forEach {
            $0.setCornerRadius(inPercentOfHeight: 50.0)
        }
        
        contentSize = contentView.bounds.size
    }
}
