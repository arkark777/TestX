//
//  PageViewController.swift
//  Test
//
//  Created by 曾德明 on 2023/10/25.
//

import UIKit

class PageViewController: UIPageViewController,UIPageViewControllerDataSource, UIPageViewControllerDelegate, PageControlProtocool {
    
    private var page = 0
    private let maxPage = 5
    override func viewDidLoad() {
        super.viewDidLoad ( )
        print("xyz1")
        self.dataSource = self
        self.delegate = self
        guard let imageVC = setupImageViewController (page: page) else { return }
        self.setViewControllers ([imageVC], direction: .forward, animated: false, completion: nil)
        ViewController.proto = self
    }
    
    private func setupImageViewController (page: Int) -> UIViewController? {
        if page < 0 || page > maxPage {
            return nil
        }
        guard let imageVC = storyboard? .instantiateViewController(identifier: "TestViewController") as?
                TestViewController else {
            return nil
        }
        print("xyzz\(page)")
        imageVC.page = page
        return imageVC
    }
    
    func pageViewController (_ pageViewController: UIPageViewController, viewControllerBefore
                             viewController: UIViewController) -> UIViewController? {
        return setupImageViewController (page: page - 1)
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter
                            viewController: UIViewController) -> UIViewController? {
        return setupImageViewController (page: page + 1)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if finished {
            guard let imageVC = viewControllers?.first as? TestViewController,
                  let page = imageVC.page else { return }
            self.page = page
        }
    }
    
    func nextPage() {
        page += 1
        guard let imageVC = setupImageViewController (page: page) else { return }
        self.setViewControllers ([imageVC], direction: .forward, animated: true, completion: nil)
    }
    
    func previousPage() {
        page -= 1
        guard let imageVC = setupImageViewController (page: page) else { return }
        self.setViewControllers ([imageVC], direction: .reverse, animated: true, completion: nil)
    }
    
    func setImageViewController (page: Int) {
        guard let imageVC = setupImageViewController (page: page) else { return }
        let diretion: UIPageViewController .NavigationDirection = page > self.page ?.forward : .reverse
        self.page = page
        self.setViewControllers ([imageVC], direction: diretion, animated: true, completion: nil)
    }
    
}
