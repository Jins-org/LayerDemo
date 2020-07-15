//
//  ViewController.swift
//  Lyrics
//
//  Created by Jins on 2020/7/15.
//  Copyright © 2020 Jins-org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    
}

extension ViewController {
    private func setupUI() {
        view.backgroundColor = .yellow
        
        let orangeView = UIView()
        orangeView.frame = CGRect(x: 0, y: 0, width: 100, height: 60)
        orangeView.center = CGPoint(x: orangeView.center.x, y: view.center.y)
        orangeView.backgroundColor = .orange
        view.addSubview(orangeView)
        
        let imageView = UIImageView(image: UIImage(named: "Text.png"))
        imageView.bounds = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 80)
        imageView.center = view.center
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        UIView.animate(withDuration: 3, delay: 0, options: [.repeat, .autoreverse], animations: {
            orangeView.frame.origin.x = self.view.bounds.size.width - orangeView.bounds.size.width
        }, completion: nil)`
    }
}
