//
//  TopMenuTabBar.swift
//  CustomTabBarUpperPortion
//
//  Created by Vibhor Gupta on 12/29/17.
//  Copyright © 2017 Vibhor Gupta. All rights reserved.
//

import UIKit

class TopMenuTabBar : UIView , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {


    let cellId = "cellId"


    //let tabTiles = ["Home","Requests","Chats","Friends"]
     let tabTiles = ["Image","Image2","Image3","Image4"]


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) 
        cell.backgroundColor = UIColor.green
//        cell.next = UILabel(named: tabTiles[indexPath.item])
        return cell
    }

    lazy var  collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()


        //layout.scrollDirection = .horizontal //.horizontal
        //layout.itemSize = cellSize
        // layout.itemSize = cellSize

        let cv = UICollectionView(frame: .zero , collectionViewLayout: layout)
        cv.backgroundColor = UIColor.blue

       // cv.collectionViewLayout.invalidateLayout()
        cv.dataSource = self
        cv.dataSource = self
        return cv
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)


        collectionView.register(TabCell.self , forCellWithReuseIdentifier: cellId)





//
   //     let layout = UICollectionViewFlowLayout()

      //  layout.itemSize = CGSize(width:  bounds.width, height : frame.height)
//        layout.minimumInteritemSpacing = 0.0
//        collectionView.setCollectionViewLayout(layout, animated: true)

        addSubview(collectionView)

        addConstraints(withVisualFormat: "H:|[v0]|", views: collectionView)
        addConstraints(withVisualFormat: "V:|[v0]|", views: collectionView)
        let selectedIndexPath = NSIndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath as IndexPath, animated: true, scrollPosition: [])


    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class TabCell : UICollectionViewCell  {

    //    let labelView : UILabel = {
    //        let lv = UILabel()
    //        lv.text = "Home"
    //        lv.tintColor = UIColor.brown
    //
    //        return lv
    //    }()

    let  imageView : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Image")
        iv.tintColor = UIColor.brown
        return iv
    }()
    override var isHighlighted: Bool{

        didSet{

            imageView.tintColor = isHighlighted ? UIColor.white :UIColor.black

            //abelView.tintColor = isHighlighted ? UIColor.white :UIColor.black
        }

    }



    override var isSelected: Bool{
        didSet{
            imageView.tintColor = isSelected ? UIColor.white :UIColor.black

            // labelView.tintColor = isSelected ? UIColor.white :UIColor.black
        }

    }
    override init(frame: CGRect) {
        super.init(frame: frame)


        setUpViews()
    }

    func setUpViews(){

        addSubview(imageView)
        addConstraints(withVisualFormat: "H:[v0(28)]", views: imageView)
        addConstraints(withVisualFormat: "V:[v0(28)]", views: imageView)


        //this code will put the text or image in the center
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY , relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}





























