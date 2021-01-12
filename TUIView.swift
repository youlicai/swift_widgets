//
//  TUIView.swift
//  nextcare
//
//  Created by apple on 2021/1/8.
//

import UIKit

class TUIView: UIView {
    typealias block = (UIView) -> ()
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
    func OnClick(completion: @escaping(UIView)->()){
        let singleTapGesture = UITapGestureRecognizer(target: self,action:#selector(click(sender:)))
        self.addGestureRecognizer(singleTapGesture)
        self.isUserInteractionEnabled = true
        self.completion=completion
    }
}

