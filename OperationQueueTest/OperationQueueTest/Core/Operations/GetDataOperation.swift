//
//  GetDataOperation.swift
//  OperationQueueTest
//
//  Created by Shantanu Dutta on 5/7/18.
//  Copyright © 2018 Shantanu Dutta. All rights reserved.
//

import Foundation

class GetDataOperation: ASOperation {
    private let urlString: String
    private let provider: NetworkingProvider
    
    var responseData: Data?
    
    init(withURLString urlString: String, andNetworkingProvider provider: NetworkingProvider = AFNetworkConnector()) {
        self.urlString = urlString
        self.provider = provider
    }
    
    override func main() {
        guard isCancelled == false else {
            finish(true)
            return
        }
        
        executing(true)
        provider.restCall(urlString: urlString) { (data) in
            self.responseData = data
            self.executing(false)
            self.finish(true)
        }
    }
}
