//
//  TIcon.swift
//  nextcare
//
//  Created by apple on 2021/1/5.
//

import UIKit

class TIcon: TUIView {

    var icon:TUIImageView!
    var icon_text:TUILabel!
    override init(frame:CGRect) {
        super.init(frame:frame)

        setupSubView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubView() {
        icon=TUIImageView(frame: CGRect(x: W(value: 2.5), y: 0, width: self.frame.width-W(value: 5), height: self.frame.width-W(value: 5)))
        icon_text=TUILabel(frame: CGRect(x: 0, y: icon.frame.maxY+W(value: 2), width: self.frame.width, height:W(value: 3)))
//        icon.backgroundColor=UIColor.blue
        icon_text.textAlignment = NSTextAlignment.center;
        icon_text.fontstyle(size: W(value:3.5), color: UIColor.black, weight: UIFont.Weight.heavy)
        addSubview(icon)
        addSubview(icon_text)
        frame=CGRect(x: self.frame.minX, y: self.frame.minY, width: self.frame.width, height: icon_text.frame.maxY)
    }
    
    func setTitle(title:String,color:UIColor){
        icon_text.text=title
        icon_text.textColor=color
    }
    
    func setImage(name:String){
        icon.image=UIImage(named: name)
    }
}
