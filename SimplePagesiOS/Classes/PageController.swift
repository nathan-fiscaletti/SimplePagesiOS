//
//  PageController.swift
//  SimplePages
//
//  Created by Nathan Fiscaletti on 3/11/19.
//  Copyright © 2019 Nathan Fiscaletti. All rights reserved.
//

import UIKit

open class PageController :
    UIPageViewController,
    UIPageViewControllerDataSource,
    UIPageViewControllerDelegate,
    BasePage
{
    // Page Controller
    @IBInspectable var InferIds: Bool = true
    @IBInspectable var InitialPageId: Int = 0
    var CurrentIndex: Int = 0
    private var pages: [Page] = []
    private var pageControllers: [PageController] = []
    
    // BasePage
    @IBInspectable public var PreferredId: Int = -1
    @IBInspectable public var PageName: String = "PageController"
    public var PageIndex: Int = -1
    public var PageController: PageController?
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadPages()
        
        self.dataSource = self;
        self.delegate = self;
        
        self.navigateTo(
            pageWithId: InitialPageId,
            animated: false,
            direction: .forward
        )
    }
    
    open func add(page: PageController)
    {
        page.PageController = self
        
        if self.InferIds {
            page.PageIndex = self.pages.count + self.pageControllers.count
        } else {
            page.PageIndex = page.PreferredId
        }
        
        self.pageControllers.append(page)
    }
    
    open func add(page: Page)
    {
        page.PageController = self
        
        if self.InferIds {
            page.PageIndex = self.pages.count + self.pageControllers.count
        } else {
            page.PageIndex = page.PreferredId
        }
        
        self.pages.append(page)
    }
    
    open func pageControllerForIndex(_ index: Int) -> UIViewController? {
        for page in pages {
            if page.PageIndex == index {
                return page
            }
        }
        
        for pageController in pageControllers {
            if pageController.PageIndex == index {
                return pageController
            }
        }
        
        return nil
    }
    
    open func navigateTo(
        pageWithId id:Int,
        animated:Bool,
        direction: UIPageViewController.NavigationDirection
        ) {
        if let vc = self.pageControllerForIndex(id) {
            let startingViewControllers = [vc];
            self.setViewControllers(startingViewControllers, direction: direction, animated: animated) { (success:Bool) in
                if (success) {
                    self.CurrentIndex = id
                }
            }
        }
    }
    
    open func navigateTo(
        pageWithName name: String,
        animated:Bool,
        direction: UIPageViewController.NavigationDirection
        ) {
        for page in pages {
            if (page.PageName == name) {
                self.navigateTo(
                    pageWithId: page.PageIndex,
                    animated: true,
                    direction: direction
                )
                
                return
            }
        }
        
        for page in pageControllers {
            if (page.PageName == name) {
                self.navigateTo(
                    pageWithId: page.PageIndex,
                    animated: true,
                    direction: direction
                )
                
                break
            }
        }
    }
    
    open func navigateBack(animated: Bool)
    {
        if (CurrentIndex != 0) {
            self.navigateTo(pageWithId: CurrentIndex - 1, animated: animated, direction: .reverse)
        }
    }
    
    open func navigateForward(animated: Bool) {
        if (CurrentIndex != pages.count + pageControllers.count - 1) {
            self.navigateTo(pageWithId: CurrentIndex + 1, animated: animated, direction: .forward)
        }
    }
    
    open func loadPages()
    {
        // Not implemented
    }
    
    public func pageViewController(
        _ pageViewController: UIPageViewController,
        didFinishAnimating finished: Bool,
        previousViewControllers: [UIViewController],
        transitionCompleted completed: Bool
    ) {
        guard completed else {return}
        
        let viewController = pageViewController.viewControllers?.first
        if (viewController is BasePage) {
            let page = viewController as? BasePage;
            CurrentIndex = (page?.PageIndex)!
        }
    }
    
    public func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController
        ) -> UIViewController? {
        var index:Int = 0
        
        if (viewController is BasePage) {
            let page = viewController as? BasePage;
            index = page?.PageIndex ?? 0;
        }
        
        if (index == 0) {
            return nil;
        }
        
        return self.pageControllerForIndex(index - 1);
    }
    
    public func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController
        ) -> UIViewController? {
        var index:Int = pages.count - 1
        
        if (viewController is BasePage) {
            let page = viewController as? BasePage;
            index = page?.PageIndex ?? (pages.count + pageControllers.count) - 1;
        }
        
        if (index == (pages.count + pageControllers.count) - 1) {
            return nil;
        }
        
        return self.pageControllerForIndex(index + 1);
    }
}
