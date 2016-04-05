//
//  CategoryViewController.swift
//  级联菜单
//
//  Created by 赵大红 on 16/4/2.
//  Copyright © 2016年 赵大红. All rights reserved.
//

import UIKit

protocol CategoryViewControllerDelegate: NSObjectProtocol {
    func didSeletCategoryItem(category: Category)
}

let CategoryReuseIdentifier = "CategoryReuseIdentifier"
class CategoryViewController: UIViewController {
    var categories: [Category]?
    weak var categoryDelegate: CategoryViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
        
        // 加载数据
        categories = Category.getCategories()
        tableView.selectRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), animated: false, scrollPosition: UITableViewScrollPosition.None)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        categoryDelegate?.didSeletCategoryItem(categories!.first!)
    }
    
    // MARK:- 懒加载
    private lazy var tableView: UITableView = {
        let tb = UITableView()
        tb.delegate = self
        tb.dataSource = self
        tb.tableFooterView = UIView()
        tb.registerClass(UITableViewCell.self, forCellReuseIdentifier: CategoryReuseIdentifier)
        tb.contentInset = UIEdgeInsets(top: 64, left: 0, bottom: 0, right: 0)
        return tb
    }()
}

extension CategoryViewController:UITableViewDataSource,UITableViewDelegate
{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return categories?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier(CategoryReuseIdentifier, forIndexPath: indexPath)
        let category = categories![indexPath.row]
        cell.textLabel?.text = category.name
        cell.imageView?.image = UIImage(named: category.icon!)
        cell.imageView?.highlightedImage = UIImage(named: category.highlighted_icon!)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // 将数据传递给第二个数据源
        categoryDelegate?.didSeletCategoryItem(categories![indexPath.row])
    }
}
