//
//  SignupFormRequestModel.swift
//  TestNetworkService
//
//  Created by Daniel Washington Ignacio on 22/11/22.
//

import Foundation

struct SignupFormRequestModel: Encodable {
    
    let firstName: String
    let lastName: String
    let email: String
    let password: String
    
}
