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
    UIScrollViewDelegate,
    BasePage
{
    @IBInspectable var InferIds: Bool = true
    @IBInspectable var PreferredId: Int = -1
    @IBInspectable var PageName: String = "PageController"
    @IBInspectable var DisableBounce: Bool = false
    @IBInspectable var InitialPageId: Int = 0
    
    var PageIndex: Int = -1
    var CurrentIndex: Int = 0
    
    private var pages: [Page] = []
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        self.pages = self.loadPages()
        
        self.dataSource = self;
        self.delegate = self;
        
        if (self.DisableBounce) {
            self.disableBounce()
        }
        
        self.navigateTo(
            pageWithId: InitialPageId,
            animated: false,
            direction: .forward
        )
    }
    
    open func add(page: Page)
    {
        page.PageController = self
        
        if self.InferIds {
            page.PageIndex = self.pages.count
        } else {
            page.PageIndex = page.PreferredId
        }
        
        self.pages.append(page)
    }
    
    open func pageControllerForIndex(_ index: Int) -> UIViewController? {
        if (self.pages.count > index) {
            return self.pages[index];
        }
        
        return nil
    }
    
    private func disableBounce() {
        for subview in self.view.subviews {
            if let scrollView = subview as? UIScrollView {
                scrollView.delegate = self
                break;
            }
        }
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
                
                break
            }
        }
    }
    
    open func loadPages() -> [Page]
    {
        return self.pages;
    }
    
    private func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (
            CurrentIndex == 0 &&
                scrollView.contentOffset.x < scrollView.bounds.size.width
            ) {
            scrollView.contentOffset = CGPoint(x: scrollView.bounds.size.width, y: 0);
        } else if (
            CurrentIndex == self.pages.count - 1 &&
                scrollView.contentOffset.x > scrollView.bounds.size.width
            ) {
            scrollView.contentOffset = CGPoint(x: scrollView.bounds.size.width, y: 0);
        }
    }
    
    private func scrollViewWillEndDragging(
        _ scrollView: UIScrollView,
        withVelocity velocity: CGPoint,
        targetContentOffset: UnsafeMutablePointer<CGPoint>
        ) {
        if (
            CurrentIndex == 0 &&
                scrollView.contentOffset.x <= scrollView.bounds.size.width
            ) {
            targetContentOffset.pointee = CGPoint(x: scrollView.bounds.size.width, y: 0);
        } else if (
            CurrentIndex == self.pages.count - 1 &&
                scrollView.contentOffset.x >= scrollView.bounds.size.width
            ) {
            targetContentOffset.pointee = CGPoint(x: scrollView.bounds.size.width, y: 0);
        }
    }
    
    private func pageViewController(
        _ pageViewController: UIPageViewController,
        didFinishAnimating finished: Bool,
        previousViewControllers: [UIViewController],
        transitionCompleted completed: Bool
        ) {
        guard completed else {return}
        
        let viewController = pageViewController.viewControllers?.first
        if (viewController is Page) {
            let page = viewController as? Page
            CurrentIndex = (page?.PageIndex)!
        }
    }
    
    public func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController
        ) -> UIViewController? {
        var index:Int = 0
        
        if (viewController is Page) {
            let page = viewController as? Page;
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
        
        if (viewController is Page) {
            let page = viewController as? Page;
            index = page?.PageIndex ?? pages.count - 1;
        }
        
        if (index == pages.count - 1) {
            return nil;
        }
        
        return self.pageControllerForIndex(index + 1);
    }
}
