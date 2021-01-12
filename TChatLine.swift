//
//  TChatLine.swift
//  nextcare
//
//  Created by apple on 2021/1/5.
//
import UIKit
import Foundation
import UIKit
class TChatLine:UIView {
    
    var bg_rect:UIView!
    var step:CGFloat!
    override init(frame: CGRect) {
        super.init(frame: frame)
        //设置背景色为透明，否则是黑色背景
        self.backgroundColor = UIColor.clear
                
        setupSubView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setupSubView() {
        bg_rect=UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height:self.frame.height))
//        bg_rect.backgroundColor=UIColor(valueRGB: 0xF2FBF9, alpha: 1)
//        bg_rect.backgroundColor = UIColor.clear
        addSubview(bg_rect);
    }
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        //获取绘图上下文
        createVline()

        //设施路径画布
        let lineShape = CAShapeLayer()
        lineShape.frame = CGRect.init(x: bg_rect.frame.minX+W(value: 2), y: bg_rect.frame.minY+W(value: 2), width:  bg_rect.frame.width-W(value: 4), height: bg_rect.frame.height-W(value: 8))

        step=lineShape.frame.width/12
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint.init(x: 0, y: lineShape.frame.height))
        point(x:0,y:lineShape.frame.height)
        for i in 1...12 {
            let random = Int(arc4random_uniform(UInt32(lineShape.frame.height)))

            linePath.addLine(to: CGPoint.init(x:Int(CGFloat(i)*step), y: random))
            point(x:CGFloat(i)*step,y:CGFloat(random))
        }
        //宽度
        lineShape.lineWidth = 2
        //线条之间点的样式
        lineShape.lineJoin = CAShapeLayerLineJoin.round
        //              //线条结尾的样式
        //        lineShape.lineCap = CAShapeLayerFillRule.nonZero
        //路径颜色
        lineShape.strokeColor = UIColor(valueRGB: THEMECOLOR, alpha: 1).cgColor
        //获取贝塞尔曲线的路径
        lineShape.path = linePath.cgPath
        //填充色
        lineShape.fillColor = UIColor.clear.cgColor
        //把绘制的图放到layer上
        layer.addSublayer(lineShape)

        
    }
    
    func point(x:CGFloat,y:CGFloat){
        let pointShape = CAShapeLayer()
        pointShape.frame = CGRect.init(x: bg_rect.frame.minX+W(value: 2), y: bg_rect.frame.minY+W(value: 2), width:  bg_rect.frame.maxX-W(value: 4), height: bg_rect.frame.maxY-W(value: 4))

        let ovalPath = UIBezierPath(ovalIn: CGRect(x: pointShape.frame.minX-W(value: 1)+x, y: pointShape.frame.minY-W(value: 1)+y, width: W(value: 2), height: W(value: 2)))
        UIColor(valueRGB: THEMECOLOR, alpha: 1).setFill()
        ovalPath.fill()
        pointShape.path = ovalPath.cgPath
        //填充色
        pointShape.fillColor = UIColor.clear.cgColor
        layer.addSublayer(pointShape)
    }
    
    func createVline(){
        for i in 0...12 {
            let lineShape = CAShapeLayer()
            lineShape.frame = CGRect.init(x: W(value: 2), y: W(value: 2), width:  bg_rect.frame.maxX-W(value: 4), height: bg_rect.frame.maxY-W(value: 8))
            step=lineShape.frame.width/12.0
            lineShape.lineDashPattern = [3,4]
            let linePath = UIBezierPath()

            linePath.move(to: CGPoint.init(x: CGFloat(i)*step, y: lineShape.frame.height))
            linePath.addLine(to: CGPoint.init(x:Int(CGFloat(i)*step), y:0))

            //宽度
            lineShape.lineWidth = 1
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
//            layer.lineDashPattern=0

            layer.addSublayer(lineShape)
            
            if(i%2>0&&i>0&&i<12){
                let temp=i*2
                let dayStr2:String=String(format:"%02d",temp)+"点"
                let font2 = UIFont.boldSystemFont(ofSize:  12)
                let style = NSMutableParagraphStyle ()
                let attributes = [ NSAttributedString.Key.font : UIFont .systemFont(ofSize: W(value: 3)),
                                   NSAttributedString.Key.foregroundColor : UIColor.lightGray,
                                   NSAttributedString.Key.paragraphStyle : style]
                dayStr2.draw(at:CGPoint.init(x:(CGFloat(i)*step)-W(value: 1), y:lineShape.frame.height+W(value: 4)),withAttributes: attributes)
            }
        }

    }
}
