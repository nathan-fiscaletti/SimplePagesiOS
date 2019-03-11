
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
    @IBInspectable var PreferredId: Int = -1
    @IBInspectable var PageName: String = "Page"
    var PageIndex: Int = 1
    
    var PageController: PageController?
    
    required public init?(coder aDecoder: NSCoder) {
        PageController = nil
        super.init(coder: aDecoder)
    }
    
    open func inferredPageIndex() -> Int
    {
        return 0
    }
    
    open func pageController() -> PageController? {
        return PageController
    }
}

protocol BasePage
{
    /// The index for this page afte rcomputing.
    ///
    var PageIndex:Int {get}
    
    /// The index for this page.
    ///
    /// If InferPageIndex is set to true,
    /// this value will be ignored.
    var PreferredId:Int {get set}
    
    /// The name for this page.
    ///
    var PageName:String {get set}
}
