//
//  KFC1Tests.swift
//  KFC1Tests
//
//  Created by Mac on 2/5/2563 BE.
//  Copyright © 2563 Mac. All rights reserved.
//

import XCTest
@testable import KFC1

class KFC1Tests: XCTestCase {
    var viewController: SignInViewController?
    override func setUpWithError() throws {
        viewController = SignInViewController()
    }

    override func tearDownWithError() throws {
        viewController = nil
    }

    func testInputEmailCorrected() {
        let emailTextField = UITextField()
        viewController?.emailTextField = emailTextField
        emailTextField.text = "Jo"
        XCTAssertNotNil(viewController?.emailTextField)
    }
    func testInputEmailBlank(){
        let emailTextField = UITextField()
        viewController?.emailTextField = emailTextField
        XCTAssertEqual(viewController?.emailTextField.text, "")
        
    }
}
