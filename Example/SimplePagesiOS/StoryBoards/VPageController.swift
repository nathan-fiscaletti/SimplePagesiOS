//
//  VerticalPageController.swift
//  SimplePagesiOS_Example
//
//  Created by Nathan Fiscaletti on 3/11/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import SimplePagesiOS

class VPageController : PageController
{
    override func loadPages() {
        self.add(page: self.storyboard?.instantiateViewController(withIdentifier: "Page1a") as! Page)
        self.add(page: self.storyboard?.instantiateViewController(withIdentifier: "Page1b") as! Page)
    }
}
