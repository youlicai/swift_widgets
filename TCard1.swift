
import UIKit

class TCard1: UIView {
    var title:UILabel!
    var title_value:UILabel!
    var important_value:UILabel!
    var right_img:UIImageView!
    override init(frame:CGRect) {
        super.init(frame:frame)

        setupSubView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubView() {

    }
}

