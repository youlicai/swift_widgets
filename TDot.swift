import UIKit

class TDot:TUIView {

    var size:CGFloat!
    var selected:Bool=false
    override init(frame:CGRect) {
        super.init(frame:frame)
        setupSubView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubView() {
        layer.cornerRadius = CGFloat(self.frame.width/2)
        size=self.frame.width
        backgroundColor=UIColor(valueRGB: 0xcfcfcf, alpha: 1)
    }
    func show(){
        frame=CGRect(x:frame.minX, y:frame.minY, width: size*2, height:size)
        backgroundColor=UIColor.white
    }
    func defalut(){
        frame=CGRect(x:frame.minX, y:frame.minY, width: size, height: size)
        backgroundColor=UIColor(valueRGB: 0xcfcfcf, alpha: 1)
    }
}
