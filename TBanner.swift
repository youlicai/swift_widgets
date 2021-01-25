import UIKit

class TBanner: TUIView,UIScrollViewDelegate{
    
    var current_index:Int=0
    var totle_size:Int!
    var offsetX:CGFloat=0
    var scroll_view:UIScrollView!
    var dots:[TDot]!
    let dot_size=W(value: 2)
    override init(frame:CGRect) {
        super.init(frame:frame)
        setupSubView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupSubView() {
        scroll_view=UIScrollView(frame: CGRect(x: bounds.minX, y: bounds.minY, width: frame.width, height: frame.height))
        scroll_view.delegate=self
        scroll_view.showsVerticalScrollIndicator = false
        scroll_view.showsHorizontalScrollIndicator = false
        scroll_view.isPagingEnabled = true
        addSubview(scroll_view)
    }
    
    func addImageUrls(urls:[String]){
        totle_size=urls.count
        scroll_view.contentSize = CGSize(width:W(value: Float(totle_size)*100),height: frame.height)
        dots=[TDot]()
        var i=0
        var old_dot:TDot!
        for _ in urls {
            var dot:TDot
            let imageview=UIImageView(frame: CGRect(x: frame.width*CGFloat(i), y: 0, width: frame.width, height: frame.height))
            if(i%2==0){
                imageview.backgroundColor=UIColor.blue
            }else{
                imageview.backgroundColor=UIColor.yellow
            }
            scroll_view.addSubview(imageview)
            if i==0{
                let start=CGFloat(frame.width/2.0)-CGFloat(totle_size)*dot_size-0.5*dot_size*2
                dot=TDot(frame: CGRect(x:start, y:bounds.height-dot_size-W(value: 1), width: dot_size, height:  dot_size))
            }else{
                 dot=TDot(frame: CGRect(x:old_dot.frame.maxX+dot_size*2, y:bounds.height-dot_size-W(value: 1), width: dot_size, height:  dot_size))
            }
            old_dot=dot
            dots.append(dot)
            addSubview(dot)
            i+=1
        }
        dots[0].show()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        current_index=Int(scroll_view.contentOffset.x/W(value: 100))
        for dot in dots {
            dot.defalut()
        }
        dots[current_index].show()
    }
    
//    //手势滑动完成 即手抬起
//    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
////        print(4)
//    }
//    //网页滚动完成，即 如果手势快的时候在手抬起时还会有些许滚动
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        current_index=Int(scroll_view.contentOffset.x/W(value: 100))
//        for dot in dots {
//            dot.defalut()
//        }
//        dots[current_index].show()
//        
//        print("-----")
//        print(current_index)
//        print("-----")
//    }
    
    
}
