//
//  AnimationViewController.swift
//  Swift-613
//
//  Created by Mac Os on 16/6/13.
//  Copyright © 2016年 Mac Os. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {
    let WIDTH  = UIScreen.mainScreen().bounds.size.width//定义屏幕宽度
    let HEIGHT  = UIScreen.mainScreen().bounds.size.height//定义屏幕高度
    var snowList:NSMutableArray = NSMutableArray()
    var num = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Plain, target: self, action: "back")
        self.title = "Animation"
        let bgImgView = UIImageView(image: UIImage(named: "winner.png"))
        bgImgView.frame = self.view.frame
        self.view.addSubview(bgImgView)
        createSnowView()
        
    }
    
//    开始动画
    func startAnimation(){
//     从数组中逐个取出snowView if判断是否超出数组
            if num<14{
                num++
            }else{
                num = 0;
            }
            let snowView = snowList[num]
//            判断snowView是否处于完成动画状态，若是，修改frame为起始位置
        if snowView.frame.origin.y == HEIGHT {
            (snowView as? UIImageView)! .frame = getSnowViewStartFrame()
        }
//        调用开始动画函数
        slowDownAnimation(snowView as! UIImageView)
        
    }
    
//    创建snwoView，在创建完成所有snowView之后开启定时器，执行动画
    func createSnowView(){
        
        for (var i:Int = 0; i<15; i++) {
            let snowView = UIImageView(image: UIImage(named: "snow"))
           
            snowView.frame = getSnowViewStartFrame()
            self.view.addSubview(snowView)
            
            snowList.addObject(snowView)
        }
        NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: Selector("startAnimation"), userInfo: nil, repeats: true)
    

}
    
//    获取snowView结束位置frame
    func getSnowViewEndFrame()->CGRect{
        let snowX = Float(arc4random())%320
        let snowY = self.HEIGHT
        let snowW:CGFloat = 30
        let snowH:CGFloat = 30
        
        return CGRectMake(CGFloat(snowX),snowY, snowW, snowH)

    }
//    获取snowView开始位置frame
    func getSnowViewStartFrame()->CGRect{
        let snowX = Float(arc4random())%400
        let snowY:CGFloat = 0
        let snowW:CGFloat = 30
        let snowH:CGFloat = 30
        return CGRectMake(CGFloat(snowX),snowY, snowW, snowH)
    }
    
//    snowView动画操作
    func slowDownAnimation(snowView:UIImageView){
        
        UIView.animateWithDuration(4) { () -> Void in
            snowView.frame = self.getSnowViewEndFrame()
        }
    }
    func back(){
        
        self.navigationController?.popViewControllerAnimated(true)
    }

}
