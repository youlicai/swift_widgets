//
//  TIcon.swift
//  nextcare
//
//  Created by apple on 2021/1/5.
//

import UIKit

class TIcon: UIView {

    var icon:TUIImageView!
    var icon_text:UILabel!
    override init(frame:CGRect) {
        super.init(frame:frame)

        setupSubView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubView() {
        icon=TUIImageView(frame: CGRect(x: W(value: 2), y: 0, width: self.frame.width-W(value: 4), height: self.frame.width-W(value: 4)))
        icon_text=UILabel(frame: CGRect(x: 0, y: icon.frame.maxY+W(value: 2), width: self.frame.width, height: self.frame.height-self.frame.width+W(value: 2)))

        icon_text.textAlignment = NSTextAlignment.center;
        icon_text.font=UIFont.systemFont(ofSize: W(value:3.5), weight: UIFont.Weight.heavy)
        addSubview(icon)
        addSubview(icon_text)
        icon.OnClick { (this) in
            
        }
    }
    
    func setTitle(title:String,color:UIColor){
        icon_text.text=title
        icon_text.textColor=color
    }
    
    func setImage(name:String){
        icon.image=UIImage(named: name)
    }
}
