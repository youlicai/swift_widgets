//
//  TPadding.swift
//  nextcare
//
//  Created by apple on 2021/1/12.
//

import UIKit

class TPadding: UIView {

    var padding:UIView!
    var left:CGFloat!
    var top:CGFloat!
    var right:CGFloat!
    var bottom:CGFloat!
    var vspacing:CGFloat!=0
    var added:UIView!

    override init(frame:CGRect) {
        super.init(frame:frame)
        setupSubView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubView() {
        frame=CGRect(x: self.frame.minX, y: self.frame.minY, width:frame.width, height: 0)
        padding=UIView(frame: CGRect(x: 0, y: 0, width:frame.width, height: self.frame.height))
        addSubview(padding)
    }
    
    
    func padding(left:CGFloat,top:CGFloat,right:CGFloat,bottom:CGFloat){
        padding.frame=CGRect(x:left, y:top, width:frame.width-left-right, height: 0)
        self.left=left;
        self.top=top;
        self.right=right;
        self.bottom=bottom;
    }
    
    func vSpacing(height:CGFloat) {
        vspacing=height
    }

    func addView(view:UIView) {
        if(added != nil){
            view.frame=CGRect(x: view.frame.minX, y: added.frame.maxY+vspacing, width: view.frame.width, height: view.frame.height)
            print("---")
        }else{
            view.frame=CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
            print("first")
        }
        padding.addSubview(view)
        padding.frame=CGRect(x:padding.frame.minX, y:padding.frame.minY, width:padding.frame.width, height:view.frame.maxY)
        frame=CGRect(x:self.frame.minX, y:self.frame.minY, width:frame.width, height: padding.frame.height+top+bottom)
        added=view
    }
    
    func width() ->CGFloat {
        return padding.frame.width
    }
    func height()  ->CGFloat{
        return padding.frame.height
    }
}

