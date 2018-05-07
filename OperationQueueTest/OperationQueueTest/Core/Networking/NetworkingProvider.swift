//
//  NetworkingProvider.swift
//  OperationQueueTest
//
//  Created by Shantanu Dutta on 5/7/18.
//  Copyright © 2018 Shantanu Dutta. All rights reserved.
//

import Foundation

protocol NetworkingProvider {
    func restCall(urlString: String, onCompleted: ((Data?) -> ())?)
}
