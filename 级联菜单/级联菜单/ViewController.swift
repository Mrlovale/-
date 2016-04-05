//
//  ViewController.swift
//  级联菜单
//
//  Created by 赵大红 on 16/4/2.
//  Copyright © 2016年 赵大红. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        addChildViewControllers()
    }
    
    /// 添加子控制器
    private func addChildViewControllers() {
        let width = view.bounds.size.width
        let height = view.bounds.size.height
        
        let category = CategoryViewController()
        addChildViewController(category)
        category.view.frame = CGRect(x: 0, y: 0, width: width * 0.4, height: height)
        view.addSubview(category.view)
        
        let categoryDetail = CategoryDetailController()
        addChildViewController(categoryDetail)
        categoryDetail.view.frame = CGRect(x: width * 0.4, y: 0, width: width * 0.6, height: height)
        view.addSubview(categoryDetail.view)
        
        // 设置代理
        category.categoryDelegate = categoryDetail
    }

}

