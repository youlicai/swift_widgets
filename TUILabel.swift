//
//  TUILabel.swift
//  nextcare
//
//  Created by apple on 2021/1/12.
//

import UIKit

class TUILabel: UILabel {
    typealias block = (UILabel) -> ()
    var completion: block = {view in
    }
    override init(frame:CGRect) {
        super.init(frame:frame)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func click(sender:UIGestureRecognizer){
        completion(self)
    }
    func OnClick(completion: @escaping(UILabel)->()){
        let singleTapGesture = UITapGestureRecognizer(target: self,action:#selector(click(sender:)))
        self.addGestureRecognizer(singleTapGesture)
        self.isUserInteractionEnabled = true
        self.completion=completion
    }
    
    func fontstyle(size:CGFloat,color:UIColor,weight:UIFont.Weight){
        font=UIFont.systemFont(ofSize: size, weight: weight)
        self.textColor=color
    }
}

