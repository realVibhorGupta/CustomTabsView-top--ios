//
//  ViewController.swift
//  CustomTabBarUpperPortion
//
//  Created by Vibhor Gupta on 12/29/17.
//  Copyright © 2017 Vibhor Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController  {




   // override func viewWillLayoutSubviews() { topTabBar.collectionView.collectionViewLayout.invalidateLayout()}
       // .collectionViewLayout.invalidateLayout() }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        title = "Home"
        view.backgroundColor = UIColor.white

        navigationController?.navigationBar.isTranslucent = false

        //This will make the collection view layouts align according
        //to the tab
        //UICollectionView?.contentInset = UIEdgeInset(50,0,0,0)
       // UICollectionView?.scrollIndicatorInset  = UIEdgeInset(50,0,0,0)

        setUpTopTabBar()
    }


    let topTabBar : TopMenuTabBar = {

        let tb = TopMenuTabBar()

        return tb
    }()

//    override func viewWillLayoutSubviews() {
//        collectionView.collectionViewLayout.invalidateLayout()    }
    private func setUpTopTabBar(){

        view.addSubview(topTabBar)
        view.addConstraints(withVisualFormat: "H:|[v0]|", views: topTabBar)
        view.addConstraints(withVisualFormat: "V:|[v0(50)]", views: topTabBar)

    }



}
extension UIView{
    func addConstraints(withVisualFormat format : String  , views: UIView...){


        var viewsDictionary = [String : UIView]()
        for (index , view) in views.enumerated(){
            let key =  "v\(index)"
            viewsDictionary[ key ] = view
            view.translatesAutoresizingMaskIntoConstraints = false

        }
        let constraints = NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary)

        addConstraints(constraints)

    }
}







