//
//  ScrollViewController.swift
//  Swift-613
//
//  Created by Mac Os on 16/6/13.
//  Copyright © 2016年 Mac Os. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Plain, target: self, action: "back")
        self.title = "ScrollView"
    }
    
    func back(){
        self.navigationController?.popViewControllerAnimated(true)
    }
}
