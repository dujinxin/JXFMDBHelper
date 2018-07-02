//
//  ViewController.swift
//  JXFMDBHelper
//
//  Created by dujinxin on 07/02/2018.
//  Copyright (c) 2018 dujinxin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func beginTest(_ sender: Any) {
        let vc = JXDBListViewController()
        let nvc = UINavigationController.init(rootViewController: vc)
        
        self.present(nvc, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

