//
//  ViewController.swift
//  APIKitSelfTraining
//
//  Created by HengVisal on 5/10/18.
//  Copyright © 2018 HengVisal. All rights reserved.
//

import UIKit
import SnapKit

class HomepageViewController: UIViewController {
    let presenter : HomepagePresenter = HomepagePresenter()
    let label : UILabel = UILabel()
    let button : UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        createComponenet()
        addSupview()
        layoutSetup()
        
    }
}


// MARK: - CreateComponents
extension HomepageViewController{
    func createComponenet() -> Void {
        
        //Button
        button.setTitle("Get Data", for: .normal)
        button.backgroundColor = UIColor.blue
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        
        //Label
        label.text = ""
        label.textColor = UIColor.black
        
    }
}

// MARK: - AddSupview
extension HomepageViewController{
    func addSupview() -> Void {
        
        self.view.addSubview(button)
        self.view.addSubview(label)
        
    }
}

// MARK: - LayoutSetup
extension HomepageViewController{
    func layoutSetup() -> Void {
        
        //Button
        button.snp.makeConstraints { (make) in
            make.center.equalTo(self.view.snp.center)
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
        //Label
        button.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view.snp.centerX)
        }
    }
}

extension HomepageViewController{
    
    @objc func buttonClicked() -> Void {
        presenter.request()
    }
}
