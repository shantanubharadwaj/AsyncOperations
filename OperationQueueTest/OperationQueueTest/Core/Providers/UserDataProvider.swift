//
//  UserDataProvider.swift
//  OperationQueueTest
//
//  Created by Shantanu Dutta on 12/05/18.
//  Copyright © 2018 Shantanu Dutta. All rights reserved.
//

import Foundation

struct DataSourceConstants {
    enum ParameterKeys {
        case results
        case inc
    }
    
    static let url = "https://randomuser.me/api/?results=1&inc=gender,name,nat,email,dob,picture"
//    https://randomuser.me/api/?results=1&inc=gender,name,nat,email,dob,picture
    static func URLString() -> String? {
        return url
    }
}

struct UserDataProvider {
    var networkingProvider: NetworkingProvider
    
    private let operationQueue: OperationQueue = OperationQueue()
    
    init(withNetworkingProvider networking: NetworkingProvider = AFNetworkConnector()) {
        networkingProvider = networking
    }
 
    func queryUsers() {
        guard let urlString = DataSourceConstants.URLString() else { return }
        
        let networkingOperation = GetDataOperation(withURLString: urlString, andNetworkingProvider: networkingProvider)
        networkingOperation.completionBlock = {
            guard let responseData = networkingOperation.responseData else{
                return
            }
            
            let str = String(data: responseData, encoding: String.Encoding.utf8)
            print("Data Received as :\(String(describing: str))")
            let decoder = JSONDecoder()
            do{
                let user = try decoder.decode(Results.self, from: responseData)
                if user.results.count > 0 {
                    if let firstObj = user.results.first {
                        print("Name : \(firstObj.name.firstName) \(firstObj.name.lastName)")
                        print("DOB : \(firstObj.dob)")
                        print("Image : \(firstObj.picture)")
                    }
                }
            }catch let error {
                print("Error while parsing : [\(error.localizedDescription)]")
            }
        }
        
        self.operationQueue.addOperations([networkingOperation], waitUntilFinished: false)
        
//        self.networkingProvider.restCall(urlString: urlString) { (dataObject) in
//            guard let responseData = dataObject else{
//                return
//            }
//
//            let str = String(data: responseData, encoding: String.Encoding.utf8)
//            print("Data Received as :\(String(describing: str))")
//            let decoder = JSONDecoder()
//            do{
//                let user = try decoder.decode(Results.self, from: responseData)
//                if user.results.count > 0 {
//                    if let firstObj = user.results.first {
//                        print("Name : \(firstObj.name.firstName) \(firstObj.name.lastName)")
//                        print("DOB : \(firstObj.dob)")
//                        print("Image : \(firstObj.picture)")
//                    }
//                }
//            }catch let error {
//                print("Error while parsing : [\(error.localizedDescription)]")
//            }
//        }
    }
}
