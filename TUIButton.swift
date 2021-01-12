//
//  TUIButton.swift
//  nextcare
//
//  Created by apple on 2021/1/11.
//

import UIKit

class TUIBotton:UIButton {
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
        addTarget(self, action: #selector(click), for: .touchUpInside)
        self.completion=completion
    }
}
