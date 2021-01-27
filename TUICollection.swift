//
//  TUICollection.swift
//  nextcare
//
//  Created by apple on 2021/1/13.
//
import UIKit

class TUICollection: UIView , UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    var data_array = [BaseRespModel]()
    
    var item_width:CGFloat!=W(value: 15)
    var item_height:CGFloat!=W(value: 17)
    var padding:CGFloat!=W(value: 5)

    override init(frame:CGRect) {
        super.init(frame:frame)
        load_data()
        setupUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setCellSize(width:CGFloat,height:CGFloat){
        self.item_width=width
        self.item_height=height
    }

    func setupUI() {
        let layout = UICollectionViewFlowLayout.init()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5

        layout.sectionInset = UIEdgeInsets.init(top: 5, left: 5, bottom: 5, right: 5)
        // 设置分区头视图和尾视图宽高
        layout.headerReferenceSize = CGSize.init(width: self.frame.width, height: 10)
        layout.footerReferenceSize = CGSize.init(width: self.frame.width, height: 10)
        layout.itemSize = CGSize(width: 20, height: 20)
        let collectionView = UICollectionView(frame: CGRect(x:0, y:0, width:self.frame.width, height:self.frame.height), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white

        collectionView.register(TCollectionCell.self, forCellWithReuseIdentifier: "cellId")
     
        collectionView.delegate = self;
        collectionView.dataSource = self;
        addSubview(collectionView)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data_array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        cell.frame=CGRect(x: cell.frame.minX, y: cell.frame.minY, width: cell.frame.width, height: cell.frame.height)
    
        item_height=cell.frame.height
        return cell
    }
 
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    // 定义每一个cell的大小
    func collectionView(_ collectionView:UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAt indexPath:IndexPath) ->CGSize {
        return CGSize(width: item_width, height:item_height);
    }
    
    // 定义每个Section的四边间距
    func collectionView(_ collectionView:UICollectionView, layout collectionViewLayout:UICollectionViewLayout, insetForSectionAt section:Int) ->UIEdgeInsets {
        return UIEdgeInsets(top: padding,left: padding,bottom: padding,right: padding);
   
    }
 
    // 两行cell之间的间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10;
    }
    
    // 两列cell之间的间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5;
    }
    
    func load_data(){
        for _ in 1...500 {
//            let testmodel=TestModel()
//            data_array.append(testmodel)
        }
        
    }
    
    

}

