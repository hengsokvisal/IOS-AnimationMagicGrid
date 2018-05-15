//
//  RootNavigation.swift
//  APIKitSelfTraining
//
//  Created by HengVisal on 5/10/18.
//  Copyright © 2018 HengVisal. All rights reserved.
//

import UIKit

class RootNavigation: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.pushViewController(HomepageViewController(), animated: false)
    }

}
