//
//  AFNetworkConnector.swift
//  OperationQueueTest
//
//  Created by Shantanu Dutta on 5/7/18.
//  Copyright © 2018 Shantanu Dutta. All rights reserved.
//

import Foundation

class AFNetworkConnector: NetworkingProvider {
    func restCall(urlString: String, onCompleted: ((Data?) -> ())?) {
        guard let url = try? urlString.asURL() else {
            onCompleted?(nil)
            return
        }
        
        SessionManager.default.request(url).responseData { response in
            onCompleted?(response.result.value)
        }
    }
}
