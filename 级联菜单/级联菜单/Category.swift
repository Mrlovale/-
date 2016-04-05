//
//  Category.swift
//  级联菜单
//
//  Created by 赵大红 on 16/4/2.
//  Copyright © 2016年 赵大红. All rights reserved.
//

import UIKit

class Category: NSObject {
    /// 子类别
    var subcategories: [String]?
    /// 姓名
    var name: String?
    /// 图标
    var icon: String?
    /// 高亮图片
    var highlighted_icon: String?
    
    class func getCategories() -> [Category] {
        var tempArr = [Category]()
        let path = NSBundle.mainBundle().pathForResource("categories", ofType: "plist")
        let categoryArr = NSArray(contentsOfFile: path!)
        for dic in categoryArr! {
            tempArr.append(self.categoryWithDic(dic as! [String : NSObject]))
        }
        return tempArr
    }
    
    class func categoryWithDic(dic: [String: NSObject]) ->Category {
        let category = Category()
        category.setValuesForKeysWithDictionary(dic)
        return category
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
    }
}
