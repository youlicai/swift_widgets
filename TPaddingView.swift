//
//  TPaddingView.swift
//  nextcare
//
//  Created by apple on 2021/1/5.
//

import UIKit

class TPaddingView: UIView {

    var padding:UIView!
    var left:CGFloat!
    var top:CGFloat!
    var right:CGFloat!
    var bottom:CGFloat!

    override init(frame:CGRect) {
        super.init(frame:frame)
        setupSubView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func padding(left:CGFloat,top:CGFloat,right:CGFloat,bottom:CGFloat,height:CGFloat){
        padding.frame=CGRect(x:padding.frame.minX+left, y:padding.frame.minY+top, width:frame.width-left-right, height: height)
        frame=CGRect(x: frame.minX, y: frame.minY, width:frame.width, height: padding.frame.height+bottom+top)
        self.left=left;
        self.top=top;
        self.right=right;
        self.bottom=bottom;
    }
    func resizeH(height:CGFloat) {
        padding.frame=CGRect(x: padding.frame.minX, y:padding.frame.minY, width:padding.frame.width ,height: height)
        frame=CGRect(x: frame.minX, y: frame.minY, width:frame.width, height: padding.frame.height+bottom+top)
    }
    func setupSubView() {
        padding=UIView(frame: CGRect(x: 0, y: 0, width:frame.width, height: self.frame.height))
        addSubview(padding)
    }
    
    func addView(view:UIView) {
        padding.addSubview(view)
    }
    
    func width() ->CGFloat {
        return padding.frame.width
    }
    func height()  ->CGFloat{
        return padding.frame.height
    }
}
