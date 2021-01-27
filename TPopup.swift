import UIKit

class TPopup:TUIView {

    var size:CGFloat!
    var selected:Bool=false
    var bg:UIView!
    override init(frame:CGRect) {
        super.init(frame:frame)
        bg=UIView(frame: CGRect(x: 0, y: 0, width: W(value: 100), height: H(value: 100)))
        bg.backgroundColor=UIColor(valueRGB: 0x666666, alpha: 1)
        bg.alpha=0.3
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func center(this:UIViewController,view:UIView){
        view.alpha=0.5
        view.frame=CGRect(x: 0, y: 0, width: view.frame.width-W(value: 3), height: view.frame.height-W(value: 3))
        view.center.x=this.view.center.x
        view.center.y=this.view.center.y
        view.backgroundColor=UIColor.red
        this.view.addSubview(view)
        this.view.addSubview(bg)
        UIView.animate(withDuration: 0.5) {
            view.frame.size.width = view.frame.width+W(value: 3)
            view.frame.size.height = view.frame.height+W(value: 3)
            view.center.x=this.view.center.x
            view.center.y=this.view.center.y
            view.alpha=1
        }
    }
    
    func down_up(this:UIViewController,view:UIView){
        view.frame=CGRect(x:0, y: H(value: 100), width: view.frame.width, height: view.frame.height)
        view.backgroundColor=UIColor.red
        this.view.addSubview(bg)
        this.view.addSubview(view)
        UIView.animate(withDuration: 0.3) {
            view.center.y=H(value: 100)-view.frame.height/2.0-kTabBarHeight
        }
    }
    
 
}
