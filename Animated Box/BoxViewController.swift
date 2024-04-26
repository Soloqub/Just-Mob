//
//  BoxViewController.swift
//  Animated Box
//
//  Created by Денис Львович on 26.04.2024.
//

import UIKit

class BoxViewController: UIViewController {
    
    lazy var mainView: BoxView = {
        BoxView(frame: .zero)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = mainView
    }
}

