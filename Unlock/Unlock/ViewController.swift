//
//  ViewController.swift
//  Unlock
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
        view.backgroundColor = .orange
        
        let containerView = UIView()
        containerView.bounds = CGRect(x: 0, y: 0, width: 300, height: 80)
        containerView.center = view.center
        containerView.backgroundColor = .red
        view.addSubview(containerView)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = containerView.bounds
        /// 渐变颜色
        gradientLayer.colors = [UIColor.black.cgColor, UIColor.white.cgColor, UIColor.black.cgColor]
        /// 每种颜色渐变停止位置
        gradientLayer.locations = [0.25, 0.5, 0.75]
        /// 设置颜色从x轴变化
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        containerView.layer.addSublayer(gradientLayer)
        
        let text: NSString = "Jins"
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        
        let textAttribute: [NSAttributedString.Key: AnyObject] = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Thin", size: 30)!, NSAttributedString.Key.paragraphStyle: style]
        
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, 0)
        text.draw(in: containerView.bounds, withAttributes: textAttribute)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let textLayer = CALayer()
        textLayer.frame = view.bounds.offsetBy(dx: 0, dy: 20)
        textLayer.contents = image?.cgImage
        gradientLayer.mask = textLayer
        gradientLayer.add(animation(), forKey: "LocationAnimation")
    }
    
    private func animation() -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [0.0, 0.0, 0.25]
        animation.toValue = [0.75, 1.0, 1.0]
        animation.duration = 3.0
        animation.repeatCount = Float.infinity
        return animation
    }
}
