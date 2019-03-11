//
//  PageController.swift
//  SimplePagesiOS_Example
//
//  Created by Nathan Fiscaletti on 3/11/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import SimplePagesiOS

class PageController : SimplePagesiOS.PageController
{
    override func loadPages() -> [Page] {
        return [
            self.storyboard?.instantiateViewController(withIdentifier: "Page1") as! Page,
            self.storyboard?.instantiateViewController(withIdentifier: "Page2") as! Page,
            self.storyboard?.instantiateViewController(withIdentifier: "Page3") as! Page
        ]
    }
}
