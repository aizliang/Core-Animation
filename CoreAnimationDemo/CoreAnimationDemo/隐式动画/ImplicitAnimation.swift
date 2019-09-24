//
//  File.swift
//  CoreAnimationDemo
//
//  Created by ai on 2019/9/24.
//  Copyright © 2019 wind. All rights reserved.
//

import UIKit
class ImplicitAnimationVC : UIViewController {
    let implicitView = ImplicitView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Implicit Animation"
        self.view.backgroundColor = UIColor.white
        
        let btn1 = UIButton.init(frame: CGRect.init(x: 50, y: 150, width: UIScreen.main.bounds.size.width - 100, height: 20))
        btn1.setTitle("UIView 和 CALayer 交互验证，请点击", for: .normal)
        btn1.setTitleColor(UIColor.blue, for: .normal)
        btn1.addTarget(self, action: #selector(action1), for: .touchUpInside)
        self.view.addSubview(btn1)
        
        implicitView.frame = CGRect.init(x: 50, y: 200, width: 20, height: 20)
        implicitView.backgroundColor = UIColor .orange
        self.view.addSubview(implicitView)
    }
    
    @objc private func action1() {
        UIView.animate(withDuration: 0.3) {
            self.implicitView.frame = CGRect.init(x:  UIScreen.main.bounds.size.width - 70, y: 200, width: 20, height: 20)
            print("闭包内部动画：\(String(describing: self.implicitView.action(for: self.implicitView.layer, forKey: "position")))")
        }
        
        print("闭包外部动画：\(String(describing: self.implicitView.action(for: self.implicitView.layer, forKey: "position")))")
    }
}

class ImplicitView: UIView {
    override class var layerClass : AnyClass {
        return ImplicitLayer.self
    }
}

class ImplicitLayer: CALayer {
    override func add(_ anim: CAAnimation, forKey key: String?) {
        print("具体动画信息：\(anim.debugDescription)")
        super.add(anim, forKey: key)
    }
}
