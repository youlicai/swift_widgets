//
//  TLoading.swift
//  nextcare
//
//  Created by apple on 2021/1/15.
//

import UIKit

class TLoading:UIView {
    
    var loading:Bool=true
    override init(frame:CGRect) {
        super.init(frame:frame)
        self.backgroundColor = UIColor.clear
        self.backgroundColor = UIColor.red
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func draw(_ rect: CGRect) {
        DispatchQueue.global(qos: .userInitiated).async {
            var y=0
            while(self.loading){
                y+=1
                for i in 1...33{
                    DispatchQueue.main.async {
                        let circle = UIBezierPath(arcCenter:   CGPoint(x: self.frame.width/2, y: self.frame.width/2), radius: self.frame.width/2-3, startAngle: CGFloat(0), endAngle: CGFloat(Double.pi)/18*CGFloat(i), clockwise: true)
                        
                        let shapeLayer = CAShapeLayer()
                        shapeLayer.path = circle.cgPath
                        shapeLayer.lineCap = CAShapeLayerLineCap.round;
                        shapeLayer.fillColor = nil
                        if(y%2==0){
                            shapeLayer.strokeColor = UIColor.red.cgColor
                        }else{
                            shapeLayer.strokeColor = UIColor.white.cgColor
                        }
                        shapeLayer.lineWidth = self.frame.width/13
                        self.layer.addSublayer(shapeLayer)
                    }
                    Thread.sleep(forTimeInterval: 0.03)
                }
            }
        }
    }
    
    func show() {
        loading=true
    }
    func hidden(){
        loading=false
    }
    func center(){
        self.frame=CGRect(x:self.superview!.frame.width/2-self.frame.width/2, y:self.superview!.frame.height/2-self.frame.height/2, width: self.frame.width, height: self.frame.height)
    }

}
