//
//  ViewController.swift
//  OperationQueueTest
//
//  Created by Shantanu Dutta on 5/7/18.
//  Copyright © 2018 Shantanu Dutta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let dataProvider = UserDataProvider(withNetworkingProvider: AFNetworkConnector())
        dataProvider.queryUsers()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

