//
//  User.swift
//  OperationQueueTest
//
//  Created by Shantanu Dutta on 5/7/18.
//  Copyright © 2018 Shantanu Dutta. All rights reserved.
//

import Foundation

struct Results: Codable {
    let results: [User]
    let info: Info
}

struct User: Codable {
    let gender: String
    let name: UserName
    let email: String
    let dob: String
    let picture: Picture
    let nationality: String
    
    enum CodingKeys: String, CodingKey {
        case gender
        case name
        case email
        case dob
        case picture
        case nationality = "nat"
    }
    
}

struct UserName: Codable {
    let title: String
    let firstName: String
    let lastName: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case firstName = "first"
        case lastName = "last"
    }
}

struct Picture: Codable {
    let largeImageURL: URL
    let mediumImageURL: URL
    let thumbnailURL: URL
    
    enum CodingKeys: String, CodingKey {
        case largeImageURL = "large"
        case mediumImageURL = "medium"
        case thumbnailURL = "thumbnail"
    }
}

struct Info: Codable {
    let seed: String
    let results: Int
    let page: Int
    let version: String
}
