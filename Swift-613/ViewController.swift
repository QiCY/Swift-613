//
//  ViewController.swift
//  Swift-613
//
//  Created by Mac Os on 16/6/13.
//  Copyright © 2016年 Mac Os. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,AuthorizeDelegate {
    let WIDTH  = UIScreen.mainScreen().bounds.size.width//定义屏幕宽度
    let HEIGHT  = UIScreen.mainScreen().bounds.size.height//定义屏幕高度
    var dataArray:NSMutableArray = NSMutableArray()//定义并初始化数据源
    var tableView:UITableView = UITableView()//定义tableView并初始化
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //调用creatTableVewi方法
        creataTableView()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "changeColor:", name: "changeWhiteColor", object: nil)
    }
    func changeColor(notificion:NSNotification?){
        self.tableView.backgroundColor = notificion?.object as? UIColor
    }
    func creataTableView(){
        
        //为数据源dataArray重新赋值
        dataArray = ["ScrollView使用","DataPickerView使用","代理方法使用","通知使用","雪花小动画"]
        
        
        self.tableView.frame = CGRectMake(0, 0, WIDTH, HEIGHT)//为tableView设置frame
        self.tableView.tableFooterView = UIView();//去掉tableView空白行
        self.tableView.delegate = self//设置代理
        self.tableView.dataSource = self//设置数据源
        self.view.addSubview(self.tableView)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //返回数据源数据数量
        return dataArray.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        switch (indexPath.row) {
          case 0:
                let scrollView = ScrollViewController()
                self.navigationController?.pushViewController(scrollView, animated: true)
            break;
        case 1:
                let pickView = PickerViewController()
                self.navigationController?.pushViewController(pickView, animated: true)
            break;
        case 2:
                let authorizeView = AuthorizeViewController()
                authorizeView.delegate = self
                self.navigationController?.pushViewController(authorizeView, animated: true)
            break;
        case 3:
                let notificationView = NotificationViewController()
                self.navigationController?.pushViewController(notificationView, animated: true)
            break;
        case 4:
            let animationView = AnimationViewController()
            self.navigationController?.pushViewController(animationView, animated: true)
            break;
          default:
            break;
        }
        
    }
    
    func changeBackgroundColor(color: UIColor?) {
        self.tableView.backgroundColor = color
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellid = "cellid"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellid)
        if cell == nil
        {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellid)
        }
        
        let name:String? = dataArray[indexPath.row] as? String
        cell?.textLabel?.text = name
        return cell!;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

