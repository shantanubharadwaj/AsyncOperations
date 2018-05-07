//
//  NSURLNetworkConnector.swift
//  OperationQueueTest
//
//  Created by Shantanu Dutta on 5/7/18.
//  Copyright © 2018 Shantanu Dutta. All rights reserved.
//

import Foundation

class NSURLNetworkConnector: NetworkingProvider {
    func restCall(urlString: String, onCompleted: ((Data?) -> ())?) {
        guard let url = try? urlString.asURL() else {
            onCompleted?(nil)
            return
        }
        
        let urlTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            onCompleted?(data)
        }
        
        urlTask.resume()
    }
}
