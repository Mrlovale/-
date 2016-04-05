//
//  CategoryDetailController.swift
//  级联菜单
//
//  Created by 赵大红 on 16/4/2.
//  Copyright © 2016年 赵大红. All rights reserved.
//

import UIKit

let CategoryDetReuseIdentifier = "CategoryReuseIdentifier"
class CategoryDetailController: UIViewController {
    
    private var subcategories: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }
    
    private lazy var tableView: UITableView = {
        let tb = UITableView()
        tb.delegate = self
        tb.dataSource = self
        tb.tableFooterView = UIView()
        tb.contentInset = UIEdgeInsets(top: 64, left: 0, bottom: 0, right: 0)
        tb.registerClass(UITableViewCell.self, forCellReuseIdentifier: CategoryDetReuseIdentifier)
        return tb
    }()
}

extension CategoryDetailController:UITableViewDataSource,UITableViewDelegate, CategoryViewControllerDelegate
{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return subcategories?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier(CategoryDetReuseIdentifier, forIndexPath: indexPath)
        cell.textLabel?.text = subcategories![indexPath.row]
        return cell
    }
    
    // 第一个数据源传来数据
    func didSeletCategoryItem(category: Category) {
        subcategories = category.subcategories
        tableView.reloadData()
    }
}
