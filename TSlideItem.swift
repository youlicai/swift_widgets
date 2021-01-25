//
//  TSlideItem.swift
//  nextcare
//
//  Created by apple on 2021/1/12.
//
import UIKit

class TSlideItem: TUIView {

    var text:TUILabel!
    var line_:TUIView!
    var color:UIColor!
    override init(frame:CGRect) {
        super.init(frame:frame)

        setupSubView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubView() {
        text=TUILabel(frame: CGRect(x: W(value: 2), y: 0, width: self.frame.width-W(value: 4), height: self.frame.height-W(value: 2)))
        addSubview(text)
    }
    
    func setTitle(title:String,color:UIColor){
        self.color=color
        text.text=title
        text.textColor=color
        text.sizeToFit()
        text.frame=CGRect(x: (self.frame.width-text.frame.width)/2, y: 0, width: text.frame.width, height: text.frame.height)
        line_=TUIView(frame: CGRect(x: W(value: 3), y: text.frame.maxY+W(value: 2), width: self.frame.width-W(value: 6), height: W(value: 0.8)))
        line_.backgroundColor=color
        frame=CGRect(x:self.frame.minX, y: self.frame.minY, width: self.frame.width, height: text.frame.height+line_.frame.height)
    }
    
    func show_line(){
        addSubview(line_)
    }
    
    func hidden_line(){
        line_.removeFromSuperview()
    }

}
