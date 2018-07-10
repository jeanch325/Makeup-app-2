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
        if let url = URL(string: query) {
            if let data = try? Data(contentsOf: url) {
                let json = try! JSON(data: data)
                parse(json: json)
                return
            }
        }
        loadError()
    }
    
    //Step 3
    func parse(json : JSON) {
        for result in json["products"].arrayValue {
            let product = result["product_type"].stringValue
            if !products.contains(product) {
                products.append(product)
            }
        }
        tableView.reloadData()
    }
    
    func loadError() {
        let alert = UIAlertController(title: "Loading Error",
                                      message: "There was a problem loading the makeup products",
                                      preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

