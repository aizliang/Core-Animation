//
//  ViewController.swift
//  CoreAnimationDemo
//
//  Created by ai on 2019/9/24.
//  Copyright © 2019 wind. All rights reserved.
//

import UIKit

let kScreenWidth = UIScreen.main.bounds.size.width
let kScreenHeight = UIScreen.main.bounds.size.height

class ViewController: UIViewController  {

    let moduleTitles = ["图层树", "寄宿图", "图层几何学", "视觉效果", "变化", "专用图层", "隐式动画", "显示动画",
                        "动画时间", "缓冲", "基于定时器的动画", "性能调优", "高效绘图", "图像IO", "图层性能"]
    let moduleVCNames: [Any] = ["图层树", "寄宿图", "图层几何学", VisionVC(), "变化", "专用图层", ImplicitAnimationVC(), "显示动画",
                         "动画时间", "缓冲", "基于定时器的动画", "性能调优", "高效绘图", "图像IO", "图层性能"]
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Core Animation"
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moduleTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell.init(style: .value1, reuseIdentifier: "cell")
        
        guard indexPath.row < moduleTitles.count else {
            return cell
        }
        
        cell.textLabel?.text = moduleTitles[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row < moduleVCNames.count else {
            return
        }
        
        let moduleVC = moduleVCNames[indexPath.row]
        if let detaulVC = moduleVC as? UIViewController {
            self.navigationController?.pushViewController(detaulVC , animated: true)
        }
    }
}

