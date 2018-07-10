//
//  ViewController.swift
//  Makeup app 2
//
//  Created by Jean Cho on 7/10/18.
//  Copyright © 2018 Jean Cho. All rights reserved.
//

import UIKit

class ProductViewController: UITableViewController {
    
    var products = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Makeup Products"
        let query = "https://makeup-api.herokuapp.com/api/v1/products.json"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

