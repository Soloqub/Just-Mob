//
//  ViewController.swift
//  Trial Banner
//
//  Created by Денис Львович on 28.04.2024.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var mainView: View = {
        View(frame: .zero)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = mainView
    }
}

