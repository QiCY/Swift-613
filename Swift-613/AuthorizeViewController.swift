//
//  AuthorizeViewController.swift
//  Swift-613
//
//  Created by Mac Os on 16/6/13.
//  Copyright © 2016年 Mac Os. All rights reserved.
//

import UIKit

public protocol AuthorizeDelegate:NSObjectProtocol {
    func  changeBackgroundColor(color:UIColor?)
}


class AuthorizeViewController: UIViewController {
    var delegate:AuthorizeDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Plain, target: self, action: "back")
        self.title = "Authorize"
        
        
    }
    func back(){
        if self.delegate != nil
        {
            self.delegate?.changeBackgroundColor(UIColor.blueColor())
        }
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
}
