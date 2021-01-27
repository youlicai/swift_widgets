//
//  Tool.swift
//  nextcare
//
//  Created by apple on 2021/1/4.
//

import Foundation
import UIKit
let padding=2
let statusBarH = UIApplication.shared.statusBarFrame.height
var tabbarH:CGFloat!
var topbarH:CGFloat!
let screenW = UIScreen.main.bounds.width
let screenH = UIScreen.main.bounds.height
let THEMECOLOR:UInt = 0x00AC8E
let BGCOLOR:UInt=0xF6F6F6
func padding(value:Int) -> CGFloat {
    return CGFloat(value)
}

func W(value:Float)->CGFloat{
    return CGFloat(Float(screenW)/100*value)
}
func H(value:Float)->CGFloat{
    return CGFloat(Float(screenH)/100*value)
}

func bottomAreaH() -> CGFloat {
    let isIphoneX = UIScreen.main.bounds.height >= 812 ? true : false
    let navigationBarHeight:CGFloat = isIphoneX ? 34 : 20
    return navigationBarHeight
}


func skip(from:UIViewController,to:UIViewController) {
    from.navigationController?.pushViewController(to, animated: true)
    
//    from.present(to, animated: false, completion: nil)
}

func back(from:UIViewController){
    from.navigationController?.popViewController(animated:true)
}
func backto(from:UIViewController,to:UIViewController){
    from.navigationController?.popToViewController(to, animated: true)
}


///底部安全距离
private
func getTabbarSafeBottomMargin() -> CGFloat {
    var safeBottom:CGFloat = 0
    if #available(iOS 11, *) {
        let safeArea = UIApplication.shared.keyWindow?.safeAreaInsets
        safeBottom = safeArea?.bottom ?? 0
    }
    return safeBottom
}

  
 
///底部安全距离
let KTabbarSafeBottomMargin:CGFloat = getTabbarSafeBottomMargin()
let kTabBarHeight:CGFloat =  KTabbarSafeBottomMargin
