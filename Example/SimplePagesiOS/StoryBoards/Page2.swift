//
//  Page2.swift
//  SimplePagesiOS_Example
//
//  Created by Nathan Fiscaletti on 3/11/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import SimplePagesiOS

class Page2: Page
{
    @IBAction func backTapped(_ sender: Any) {
        self.pageController()?.navigateBack(animated: true)
    }
}
