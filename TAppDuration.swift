//
//  TAppDuration.swift
//  nextcare
//
//  Created by apple on 2021/1/5.
//

import UIKit

class TAppDuration: UIView {

    var bg_line:UIView!
    var fore_line:UIView!
    var tips:UILabel!
    var left_txt:UILabel!
    var right_txt:UILabel!
    var o:UIView!
    override init(frame:CGRect) {
        super.init(frame:frame)

        setupSubView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubView() {
        left_txt=UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width/3, height: W(value: 3)))
        left_txt.text="支付宝"
        left_txt.font=UIFont.systemFont(ofSize: W(value:3), weight: UIFont.Weight.light)
        right_txt=UILabel(frame: CGRect(x: self.frame.width/3*2, y: 0, width: self.frame.width/3, height: W(value: 3)))
        right_txt.text="1小时40分钟"
        right_txt.textAlignment=NSTextAlignment.right
        right_txt.font=UIFont.systemFont(ofSize: W(value:3), weight: UIFont.Weight.light)
        bg_line=UIView(frame: CGRect(x: 0, y: left_txt.frame.maxY+W(value: 2), width: self.frame.width, height: W(value: 1.5)))
        bg_line.layer.cornerRadius=W(value: 1)
        fore_line=UIView(frame: CGRect(x: 0, y: W(value: 1.75)+left_txt.frame.maxY, width: self.frame.width-W(value: 20), height:W(value: 2)))
        fore_line.layer.cornerRadius=W(value: 1)
        bg_line.backgroundColor=UIColor(valueRGB: 0xEFEFEF, alpha: 1)
        fore_line.backgroundColor=UIColor(valueRGB: 0x4FC367, alpha: 1)
        o=UIView(frame: CGRect(x: W(value: 3), y: bg_line.frame.maxY+W(value: 2), width: W(value: 2.5), height: W(value: 2.5)))

        o.layer.cornerRadius=W(value: 1.5)
        tips=UILabel(frame: CGRect(x: o.frame.maxX+W(value: 2), y: bg_line.frame.maxY+W(value: 1), width: self.frame.width/2, height: W(value: 5)))
        tips.font=UIFont.systemFont(ofSize: W(value:3), weight: UIFont.Weight.light)
        tips.text="未超过建议使用时长"
        addSubview(bg_line)
        addSubview(fore_line)
    }
    
    func setLeftDesc(desc:String){
        left_txt.text=desc
        addSubview(left_txt)
    }
    func setRightDesc(desc:String){
        right_txt.text=desc
        addSubview(right_txt)
    }
    func setBottomDesc(desc:String,type:Int){
        if(type==0){
            o.backgroundColor=UIColor(valueRGB: 0x4FC367, alpha: 1)
            tips.textColor=UIColor(valueRGB: 0x4FC367, alpha: 1)
        }else{
            tips.textColor=UIColor.red
            o.backgroundColor=UIColor.red
        }
        tips.text=desc
        addSubview(o)
        addSubview(tips)
    }
}
