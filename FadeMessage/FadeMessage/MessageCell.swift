//
//  MessageCell.swift
//  Swifter
//
//  Created by Jins on 2020/7/15.
//  Copyright © 2020 Jins-org. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
}

extension MessageCell {
    
    private func setupUI() {
        backgroundColor = .clear
        selectionStyle = .none
        
        let label = UILabel()
        label.frame = CGRect(x: 10, y: 5, width: 300, height: 40)
        label.text = "  这是一条测试消息"
        label.textColor = .white
        label.backgroundColor = .orange
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        contentView.addSubview(label)
    }
    
}
