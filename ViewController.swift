//
//  ViewController.swift
//  MongoAPIPr
//
//  Created by Aisultan Zhaksytayev on 08.01.2023.
//

import UIKit

class ViewController: UIViewController {

    var apiService = ApiService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        apiService.getQuestionsData{(result) in
            print(result)
        }
    }


}

