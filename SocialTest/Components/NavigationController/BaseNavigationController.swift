//
//  BaseNavigationController.swift
//  SocialTest
//
//  Created by Mohammad Firouzi on 7/31/20.
//  Copyright © 2020 Mohammad Firouzi. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isHidden = true
        viewControllers = [MStoryboards.Main.homeVC]
    }
}
