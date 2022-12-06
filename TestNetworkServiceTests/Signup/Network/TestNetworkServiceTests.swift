//
//  TestNetworkServiceTests.swift
//  TestNetworkServiceTests
//
//  Created by Daniel Washington Ignacio on 22/11/22.
//

import XCTest
@testable import TestNetworkService

class TestNetworkServiceTests: XCTestCase {
    
    var sut: SignupWebService!
    var signupFormRequestModel: SignupFormRequestModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        
        let sut = SignupWebService(urlString: SignupConstants.signupURLString , urlSession: urlSession)
        
        let signupFormRequestModel = SignupFormRequestModel(firstName: "Daniel", lastName: "Ignacio", email: "danielvertigo@hotmail.com" , password: "12345678")
       // let signupFormRequestModel = SignupFormRequestModel(firstName: "Sergey", lastName: "Kargopolov", email: "test@test.com" , password: "12345678")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        sut = nil
        signupFormRequestModel = nil
        MockURLProtocol.stubResponseData = nil
        MockURLProtocol.error = nil
    }

    func testSignupWebService_WhenGivenSuccessfullResponse_ReturnSuccess(){
        
        let expectation = self.expectation(description: "Signup web service responde expectation")
            
        //Act
        sut.signup(withForm: signupFormRequestModel) { (signupResponseModel, error) in
            
            //Assert
            //"{\"status\":\"ok\"}"
            XCTAssertEqual(signupResponseModel?.status,"ok")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
        
    }

    func testSignupWebService_WhenReceivedDifferentJSONResponse_ErrorTookPlace(){
       
        //Arrange
        let jsonString = "{\"path\":\"/users\",\"error\":\"Internal Server Error\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Signup() different JSON structure")
            
        //Act
        sut.signup(withForm: signupFormRequestModel) { (signupResponseModel, error) in
            
            //Assert
            //"{\"status\":\"ok\"}"
            XCTAssertNil(signupResponseModel, "Trhe response will be nil")
            XCTAssertEqual(error, SignupError.responseModelParsingError, "signup() did not response error")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignupWebservice_WhenEmptyURLStringProvided_ReturnsError(){
        //Arrange
        let expectation = self.expectation(description: "An empty request URL")
        
        sut = SignupWebService(urlString: "")
        
        //Act
        
        sut.signup(withForm: signupFormRequestModel) { (signupResponseModel, error) in
            //Assert
            XCTAssertEqual(error, SignupError.invalidRequestURLStringErrors, "did not response invalid error")
            XCTAssertNil(signupResponseModel, "response model must be nil")
            expectation.fulfill()
        }
        
        
        self.wait(for: [expectation], timeout: 2)
        
    }
    
    func testSignupWebService_WhenURLRequestFails_ReturnErrorMessageDescription(){
        //Arrange
        
        let expectation = self.expectation(description: "A failed Request")
        let errorDescription = "A localized descript error"
        MockURLProtocol.error = SignupError.failedRequest(description: errorDescription)
       
        //Act
        sut.signup(withForm: signupFormRequestModel) { (signupResponseModel, error) in
            //Assert
            XCTAssertEqual(error, SignupError.failedRequest(description: errorDescription), "did not return an expecter error")
            //XCTAssertEqual(error?.localizedDescription, errorDescription)
            expectation.fulfill()
            
        }
        
        self.wait(for: [expectation], timeout: 2)
    }
    
}
