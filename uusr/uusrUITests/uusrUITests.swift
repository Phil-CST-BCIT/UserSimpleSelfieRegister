// uusrUITests.swift
// uusrUITests
//
// Created by Jianming Chen on 2024-11-02.

import XCTest

final class uusrUITests: XCTestCase {

    override func setUpWithError() throws {
   
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testLoginView() throws {
        let app = XCUIApplication()
        app.launch()

        let emailTextField = app.textFields["Email"]
        XCTAssertTrue(emailTextField.exists)
        emailTextField.tap()
        emailTextField.typeText("test@example.com")

        let passwordSecureField = app.secureTextFields["Password"]
        XCTAssertTrue(passwordSecureField.exists)
        passwordSecureField.tap()
        passwordSecureField.typeText("password")

        let loginButton = app.buttons["Login"]
        XCTAssertTrue(loginButton.exists)
        loginButton.tap()
    }
}