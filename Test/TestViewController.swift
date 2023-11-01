//
//  ImageViewController.swift
//  Test
//
//  Created by 曾德明 on 2023/10/25.
//

import UIKit

class TestViewController: UIViewController {
    var page: Int?
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad ()
        print("xyz2")
        guard let page = page else { return }
        self.label.text = "\(page)"
    }
}
