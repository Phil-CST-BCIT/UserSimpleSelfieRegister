// uusrTests.swift
// uusrTests
//
// Created by Jianming Chen on 2024-11-02.

import XCTest
@testable import uusr

final class uusrTests: XCTestCase {
    
    override func setUpWithError() throws {
    }
    
    override func tearDownWithError() throws {
    }

    func testExample() throws {
    }

    func testUserInitialization() throws {
        let user = User(email: "test@example.com", password: "password", role: .individual, firstName: "Test", lastName: "User", unitNumber: "123", buildingName: "Test Building")
        
        XCTAssertEqual(user.email, "test@example.com")
        XCTAssertEqual(user.firstName, "Test")
        XCTAssertEqual(user.role, .individual)
    }
}