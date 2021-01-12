//
//  TCardTitle.swift
//  nextcare
//
//  Created by apple on 2021/1/5.
//

import UIKit

class TCardTitle: UIView {

    var v_line:UIView!
    var title:UILabel!
    var right_tips:UILabel!
    override init(frame:CGRect) {
        super.init(frame:frame)
        setupSubView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubView() {
        v_line=UIView(frame: CGRect(x: 0, y: 0, width:W(value: 1.3), height: self.frame.height))
        v_line.backgroundColor=UIColor(valueRGB: THEMECOLOR, alpha: 1)
        v_line.layer.cornerRadius=2
        title=UILabel(frame: CGRect(x: v_line.frame.maxX+W(value: 2), y: W(value: -0.3), width: self.frame.width/2, height: self.frame.height))
        
        title.font=UIFont.systemFont(ofSize: W(value:4.5), weight: UIFont.Weight.bold)
        addSubview(v_line)
        addSubview(title)
        
    }
    
    func setTitle(title_:String){
        title.text = title_
    }
}

