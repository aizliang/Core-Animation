//
//  VisionVC.swift
//  CoreAnimationDemo
//
//  Created by ai on 2019/10/3.
//  Copyright © 2019 wind. All rights reserved.
//

import UIKit

class VisionVC: UIViewController {

    let resultView = UIImageView.init()
    let maskLayer = CALayer.init()
    
    @IBOutlet var rectangleImageView: UIImageView!
    @IBOutlet var circleImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(resultView)
        // Do any additional setup after loading the view.
    }


    @IBAction func setMask(_ sender: Any) {
        resultView.snp.makeConstraints { (make) in
            make.left.equalTo(circleImageView.snp_rightMargin).offset(48)
            make.centerY.equalTo(circleImageView)
        }
        
        resultView.image = UIImage.init(named: "矩形")
        maskLayer.contents = UIImage.init(named: "圆形")?.cgImage
        maskLayer.frame = circleImageView.bounds
        resultView.layer.mask = maskLayer
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
