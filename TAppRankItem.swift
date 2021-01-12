//
//  TAppRankItem.swift
//  nextcare
//
//  Created by apple on 2021/1/7.
//

import UIKit

class TAppRankItem: UIView {

    var app_icon:UIImageView!
    var app_duration:TAppDuration!
    override init(frame:CGRect) {
        super.init(frame:frame)
        setupSubView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubView() {
        app_icon=UIImageView(frame: CGRect(x: 0, y: 0, width: self.frame.height, height: self.frame.height));
        app_icon.backgroundColor=UIColor.orange
        app_duration=TAppDuration(frame: CGRect(x: app_icon.frame.maxX+W(value: 5), y: 0, width: self.frame.width-self.frame.height, height:  self.frame.height))
        addSubview(app_icon)
        addSubview(app_duration)
        
    }
    
    func setText(left_text:String,right_text:String) {
        app_duration.setLeftDesc(desc: left_text)
        app_duration.setRightDesc(desc: right_text)
    }
}

