//
//  ImplicitAnimation.swift
//  CoreAnimationDemo
//
//  Created by ai on 2019/9/25.
//  Copyright © 2019 wind. All rights reserved.
//

import UIKit
import SnapKit

class ImplicitAnimationVC: UIViewController {

    @IBOutlet var contentView: UIView!
    let layer = CALayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        layer.frame = CGRect.init(x: kScreenWidth/2-25, y: 25, width: 50, height: 50)
        layer.backgroundColor = UIColor.blue.cgColor
        self.contentView.layer.addSublayer(layer)
        
        // Do any additional setup after loading the view.
    }

    @IBAction func changeColor(_ sender: Any) {
        let red:CGFloat = CGFloat(arc4random_uniform(UInt32(256)))/CGFloat(256.0)
        let green:CGFloat = CGFloat(arc4random_uniform(UInt32(256)))/CGFloat(256.0)
        let blue:CGFloat = CGFloat(arc4random_uniform(UInt32(256)))/CGFloat(256.0)
        layer.backgroundColor = UIColor.init(red: red , green: green, blue: blue, alpha: 1).cgColor
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
