//
//  ViewController.swift
//  Test
//
//  Created by 曾德明 on 2023/10/25.
//

import UIKit


protocol PageControlProtocool {
    func nextPage()
    func previousPage()
}
class ViewController: UIViewController {
    static var proto: PageControlProtocool?
    var son: PageViewController?
    @IBAction func prev(_ sender: Any) {
        print("xyzppp")
        self.son?.previousPage()
        
    }
    @IBAction func next(_ sender: Any) {
        self.son?.nextPage()

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        son = children.first as? PageViewController
        
        // Do any additional setup after loading the view.
    }


}

