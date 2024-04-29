//
//  BoxViewController.swift
//  Animated Box
//
//  Created by Денис Львович on 26.04.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    lazy var mainView: View = {
        View(frame: .zero)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = mainView
        
        mainView.boxView.startTimer(secondsLeft: 1 * 3_600 + 15 * 60 + 20)
    }
}
