//
//  TCollectionCell.swift
//  nextcare
//
//  Created by apple on 2021/1/14.
//


import UIKit

class TCollectionCell: UICollectionViewCell {
    typealias block = (UIView) -> ()
    var completion: block = {view in
    }
    override init(frame:CGRect) {
        super.init(frame:frame)
        stupUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
    func stupUI() {
        let ticon=TIcon(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height));
        ticon.setTitle(title: "支付宝宝", color: UIColor.black)
        ticon.setImage(name: "home")
//        ticon.backgroundColor=UIColor.yellow
//        let text=TUILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
//        text.text="hello";
        addSubview(ticon)
        frame=CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: ticon.frame.maxY)
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

