//
//  teste.swift
//  TestNetworkServiceTests
//
//  Created by Daniel Washington Ignacio on 22/11/22.
//

import XCTest
@testable import TestNetworkService

class teste: XCTestCase {
    var sut: SignUpFormModelValidator!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        //ARRANGE
        sut = SignUpFormModelValidator()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testSignFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue(){
        
        // Arrange
        //let sut = SignUpFormModelValidator()
        
        //Act
        let isFirstNameValid = sut.isFirtNameValid(firstName: "Daniel")
        
        //Assert
        XCTAssertTrue(isFirstNameValid, "The isFirsNameValid() should have returned TRUE for a valid first name but returne FALSE")
        
    }
    
    func testSignupModelValidator_WhenTooShortFirstNameProvided_ShoudReturnFalse() {
        //Arrange
        //let sut = SignUpFormModelValidator()
        
        //Act
        let isFirstNameValid = sut.isFirtNameValid(firstName: "S")
        
        //Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is shorter than \(SignupConstants.firstNameMinLength) characters but it has returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenTooLongFirstNameProvided_ShouldReturnFalse(){
        
        let isFirstNameValid = sut.isFirtNameValid(firstName: "DanielDaniel")
        
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is longer than \(SignupConstants.firstNameMaxLength) characters but it has returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenValidLastNameProvided_ShouldReturnTrue(){
        
        let isLastNameValid = sut.isLastNameValid(lastName: "Daniel Washington Ignacio")
        
        XCTAssertTrue(isLastNameValid, "isLastNameValid() should have returned TRUE for a valid first name but returne FALSE")
        
    }
    
    func testSignupFormModelValidator_WhenEmailProvided_ShouldReturnTrue(){
        
        let isEmailValid = sut.isEmailValid(email: "danielvertigo@hotmail.com")
        
        XCTAssertTrue(isEmailValid, "isEmailValid() should have returned TRUE for a valid first name but returne FALSE")
        
    }
    
    func testSignupFormModelValidator_WhenPasswordProvided_ShouldReturnTrue(){
        
        let isPasswordValid = sut.isPasswordValid(password: "123123")
        
        XCTAssertTrue(isPasswordValid, "isPasswordValid() should have returned TRUE for a valid first name but returne FALSE")

    }
    
    //Another way
    
    func testeSignupFormModelValidator_WhenEqualPasswordsProvided_ShouldReturnTrue(){
        //act
        let doPasswordMatch = sut.doPasswordMatch(password: "12345678", repeatPassword: "12345678")
        
        XCTAssertTrue(doPasswordMatch, "the doPasswordMatch() should have returned TRUE for matching passwords but it has returned FALSE")
    }
    
    func testeSignupFormModelValidator_WhenNotPasswordsProvided_ShouldReturnFalse(){
        //ACT
        let doPasswordMatch = sut.doPasswordMatch(password: "12345678", repeatPassword: "1234567")
        
        //ASSERT
        XCTAssertFalse(doPasswordMatch, "the doPasswordMatch() should have returned FALSE for matching passwords but it has returned TRUE")
        
    }

}
