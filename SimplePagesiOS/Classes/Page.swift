
//
//  Page.swift
//  SimplePages
//
//  Created by Nathan Fiscaletti on 3/11/19.
//  Copyright © 2019 Nathan Fiscaletti. All rights reserved.
//

import UIKit

open class Page : UIViewController, BasePage
{
    @IBInspectable public var PreferredId: Int = -1
    @IBInspectable public var PageName: String = "Page"
    public var PageIndex: Int = 1
    public var PageController: PageController?
    
    open func pageController() -> PageController? {
        return PageController
    }
}

public protocol BasePage
{
    var PreferredId    : Int             { get set }
    var PageName       : String          { get set }
    var PageIndex      : Int             { get set }
    var PageController : PageController? { get set }
}
