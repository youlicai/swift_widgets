import UIKit

class TToast:TUIView {
    
    var toast:TUILabel!
    var padd:TPadding!
    let padding_size:CGFloat=W(value: 3)
    let duration_size:Double=3.0
    let window1: UIWindow = UIApplication.shared.windows.last!
    var set_duration:Bool=false
    override init(frame:CGRect) {
        super.init(frame:frame)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func show(text:String)-> TToast{
        toast=TUILabel(frame: CGRect(x: 0, y: 0, width: W(value: 30), height: W(value: 10)))
        toast.text=text
        toast.textColor=UIColor.white
        toast.textAlignment=NSTextAlignment.center
        toast.sizeToFit()
        padd=TPadding(frame: CGRect(x: (W(value: 100)-toast.frame.width-padding_size*2)/2, y: H(value: 70), width: toast.frame.width+padding_size*2, height: toast.frame.height+padding_size*2))
        padd.padding(left: padding_size, top: padding_size, right: padding_size, bottom:padding_size)
        padd.layer.cornerRadius=toast.frame.height/2
        padd.addView(view: toast)
        window1.addSubview(padd)
        UIView.animate(withDuration: 0.5) {
            self.padd.center.x += 100
        }
        
        padd.backgroundColor=UIColor(valueRGB: 0x333333, alpha: 1)
        
        DispatchQueue.global(qos: .userInitiated).async {
            Thread.sleep(forTimeInterval: self.duration_size)
            if !self.set_duration{
                DispatchQueue.main.async {
                    self.padd.removeFromSuperview()
                }
            }
        }
        return self
    }
    
    func duration(sec:Double)->TToast{
        set_duration=true
        DispatchQueue.global(qos: .userInitiated).async {
            Thread.sleep(forTimeInterval: sec)
            DispatchQueue.main.async {
                self.padd.removeFromSuperview()
            }
        }
        return self
    }
    
    func center()->TToast{
        padd.frame = CGRect(x: (W(value: 100)-toast.frame.width-padding_size*2)/2, y: H(value: 47), width: toast.frame.width+padding_size*2, height: toast.frame.height+padding_size*2)
        return self
    }
    
}
