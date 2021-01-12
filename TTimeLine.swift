//
//  TTimeLine.swift
//  nextcare
//
//  Created by apple on 2021/1/6.
//

import UIKit

class TTimeLine: UIView {

    var content:UIView!
    var points = [CGFloat]()
    var point_size=W(value: 3)
    override init(frame:CGRect) {
        super.init(frame:frame)
        self.backgroundColor = UIColor.clear
//        self.backgroundColor=UIColor.blue
        setupSubView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubView() {
        content=UIView(frame: CGRect(x: W(value: 3), y: 0, width: self.frame.width-W(value: 3), height: 0))
        addSubview(content)
        points.append(0)
    }
    
//    func addView() {
//        for i in 0...4{
//            let item:UIView
//
//            if(i==1){
//                item=UIView(frame: CGRect(x: 0, y: content.frame.maxY, width: content.frame.width, height: W(value: 25)))
//                item.backgroundColor=UIColor.yellow
//            }else if(i==2){
//                item=UIView(frame: CGRect(x: 0, y: content.frame.maxY, width: content.frame.width, height: W(value: 18)))
//                item.backgroundColor=UIColor.green
//            }else{
//                item=UIView(frame: CGRect(x: 0, y: content.frame.maxY, width: content.frame.width, height: W(value: 30)))
//                item.backgroundColor=UIColor.green
//            }
//            content.addSubview(item)
//            content.frame=CGRect(x: W(value: 3), y: 0, width: self.frame.width-W(value: 3), height: content.frame.height+item.frame.height)
//            points.append(item.frame.maxY)
//        }
//        self.frame=CGRect(x: self.frame.minX, y: self.frame.minY, width: self.frame.width, height: content.frame.maxY)
//        print(points)
//
//    }
//
    func addView(view:UIView) {
//            let item:UIView
//            item=UIView(frame: CGRect(x: 0, y: content.frame.maxY, width: content.frame.width, height: W(value: 25)))
            content.addSubview(view)
            content.frame=CGRect(x: W(value: 3), y: 0, width: self.frame.width-W(value: 3), height: content.frame.height+view.frame.height)
            points.append(view.frame.maxY)
        self.frame=CGRect(x: self.frame.minX, y: self.frame.minY, width: self.frame.width, height: content.frame.maxY)
    }
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        //设施路径画布
        let lineShape = CAShapeLayer()
        lineShape.frame = CGRect.init(x: 0, y: 0, width:point_size+W(value: 2), height: content.frame.height)
        lineShape.lineDashPattern = [5,9]
        let linePath = UIBezierPath()
        
        
        for i in 0...points.count-2 {
            point(x:0,y:CGFloat(points[i]))
            linePath.move(to: CGPoint.init(x: point_size-W(value: 1), y: CGFloat(points[i])+point_size-W(value: 1)))
            if(i<points.count-2){
                linePath.addLine(to:CGPoint.init(x:CGFloat(point_size-W(value: 1)), y:CGFloat(points[i+1])))
            }
        }
        //宽度
        lineShape.lineWidth = 2
        //线条之间点的样式
        lineShape.lineJoin = CAShapeLayerLineJoin.round
        //              //线条结尾的样式
        //        lineShape.lineCap = CAShapeLayerFillRule.nonZero
        //路径颜色
        lineShape.strokeColor = UIColor.lightGray.cgColor
        //获取贝塞尔曲线的路径
        lineShape.path = linePath.cgPath
        //填充色
        lineShape.fillColor = UIColor.clear.cgColor
        //把绘制的图放到layer上
        layer.addSublayer(lineShape)
    }
    
    func point(x:CGFloat,y:CGFloat){
        let pointShape = CAShapeLayer()
        pointShape.frame = CGRect.init(x: 0, y: 0, width:W(value: 3), height: content.frame.height)
        
        let ovalPath = UIBezierPath(ovalIn: CGRect(x: pointShape.frame.minX+W(value: 0.5)+x, y: pointShape.frame.minY+y+W(value: 1), width: point_size, height: point_size))
        UIColor.lightGray.setFill()
        ovalPath.fill()
        pointShape.path = ovalPath.cgPath
        //填充色
        pointShape.fillColor = UIColor.clear.cgColor
        layer.addSublayer(pointShape)
    }
}

