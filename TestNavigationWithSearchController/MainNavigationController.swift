//
//  MainNavigationController.swift
//  TestNavigationWithSearchController
//
//  Created by Kevin Lu on 4/24/19.
//  Copyright © 2019 Kevin Lu. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    let blueVC = BlueViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        pushViewController(blueVC, animated: true)
        // Do any additional setup after loading the view.
    }


}

