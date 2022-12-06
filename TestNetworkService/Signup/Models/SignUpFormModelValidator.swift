//
//  SignUpFormModelValidator.swift
//  TestNetworkService
//
//  Created by Daniel Washington Ignacio on 23/11/22.
//

import Foundation

class SignUpFormModelValidator {
    
    func isFirtNameValid(firstName: String) -> Bool {
        var returnValue = true
        
        if firstName.count < SignupConstants.firstNameMinLength || firstName.count > SignupConstants.firstNameMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isLastNameValid(lastName: String) -> Bool {
    
        let lastNameArr = lastName.components(separatedBy: " ")
        print("\(lastNameArr.last ?? "")")
        if lastNameArr.last != " " {
            return true
        } else {
            return false
        }
    }
    
    func isEmailValid(email: String) -> Bool {
    
        if email.contains("@") && email.contains(".com") {
            return true
        }else{
            return false
        }
        
    }
    
    func isPasswordValid(password: String) -> Bool {
        
        var returnValue = true
        
        return returnValue
        
    }
    
    
    func doPasswordMatch(password: String, repeatPassword: String) -> Bool {
//        var returnValue = true
//
//        if password != repeatPassword {
//            returnValue = false
//        }
        
        return password == repeatPassword
    }
    
}
