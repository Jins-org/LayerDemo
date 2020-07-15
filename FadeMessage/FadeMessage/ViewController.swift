//
//  ViewController.swift
//  FadeMessage
//
//  Created by Jins on 2020/7/15.
//  Copyright © 2020 Jins-org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let identifier = "MessageCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
}

extension ViewController {
    private func setupUI() {
        let imageView = UIImageView(image: UIImage(named: "emma-watson.jpg"))
        imageView.frame = view.bounds
        imageView.contentMode = .scaleAspectFill
        view.addSubview(imageView)
        
        let tableViewSuperView = UIView()
        tableViewSuperView.frame = CGRect(x: 0, y: 200, width: view.frame.size.width, height: view.frame.size.height - 200)
        view.addSubview(tableViewSuperView)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.black.withAlphaComponent(0.2).cgColor,
                                UIColor.black.cgColor]
        gradientLayer.frame = tableViewSuperView.bounds
        gradientLayer.locations = [0, 0.2, 1]
        tableViewSuperView.layer.mask = gradientLayer
        
        let tableView = UITableView()
        tableView.frame = tableViewSuperView.bounds
        tableView.rowHeight = 50
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(MessageCell.self, forCellReuseIdentifier: identifier)
        tableView.dataSource = self
        tableViewSuperView.addSubview(tableView)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) ?? MessageCell()
        return cell
    }
}
