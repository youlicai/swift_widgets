//
//  TUIAlert.swift
//  nextcare
//
//  Created by apple on 2021/1/25.
//

import  UIKit

class  TUIAlert :  UIView  {
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func alert(this:UIViewController,title:String,message:String,ok_text:String,cancel_text:String,ok:@escaping()->(),cancel:@escaping()->()){
        let  alertController =  UIAlertController (title: "\n\n\n\n\n\n\n" ,
                                                   message:nil , preferredStyle: .alert)
        let  cancelAction =  UIAlertAction (title:cancel_text, style: .cancel, handler:{
            action in
            cancel()
        })
        let  okAction =  UIAlertAction (title:ok_text , style: . default , handler: {
            action  in
            ok()
        })
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        this.present(alertController, animated:  true , completion:  nil )

    }
    
    func actionSheet(this:UIViewController,title:String,message:String,ok_text:String,cancel_text:String,ok:@escaping()->(),cancel:@escaping()->()){
        let  alertController =  UIAlertController (title: title ,
                                                   message:message , preferredStyle: UIAlertController.Style.actionSheet)

        let  cancelAction =  UIAlertAction (title:cancel_text, style: .cancel, handler:{
            action in
            cancel()
        })
        let  okAction =  UIAlertAction (title:ok_text , style: . default , handler: {
            action  in
            ok()
        })
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        this.present(alertController, animated:  true , completion:  nil )
    }
    
    func popu_center(this:UIViewController,view:UIView,ok:@escaping()->()){
        let  alertController =  UIAlertController (title: "" ,
                                                   message:"" , preferredStyle: .alert)
        for view in alertController.view.subviews {
            view.removeFromSuperview()
        }
        alertController.view.addSubview(view)
        this.present(alertController, animated:  true , completion:  nil )
    }
    
    func popu_down(this:UIViewController,view:UIView,ok:@escaping()->(),cancel:@escaping()->()){
        let  alertController =  UIAlertController (title: "" ,
                                                   message:"" , preferredStyle: .actionSheet)
        for view in alertController.view.subviews {
            view.removeFromSuperview()
        }
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: alertController, action: #selector(onTap)))
        view.isUserInteractionEnabled = true
        alertController.view.addSubview(view)
        this.present(alertController, animated:  true , completion:  nil )
    }
    
    @objc func onTap() {
        print("视图被点击dd")
    }

}
