//
//  ViewController.swift
//  UserSimpleSelfieRegister
//
//  Created by ZHANG ZHE on 2024-11-01.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @State private var isLoggedIn = false
    @State private var currentUserRole: UserRole?
    
    // 定义临时的测试用户账号
    let testUsers = [
        User(email: "parker1123@outlook.com", password: "admin123", role: .manager, firstName: "Admin", lastName: "User"),
        User(email: "user@gmail.com", password: "user123", role: .individual, firstName: "User", lastName: "Person")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginView = LoginView(isLoggedIn: $isLoggedIn)
        
        let hostingController = UIHostingController(rootView: loginView)
        addChild(hostingController)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(hostingController.view)
        
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        hostingController.didMove(toParent: self)
    }
    
    @IBAction func signInTapped(_ sender: UIButton) {
        let email = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        print("Email entered: \(email), Password entered: \(password)")
        if email.isEmpty || password.isEmpty {
            showAlert(message: "Please enter both username and password.")
        } else {
            authenticateUser(username: email, password: password)
        }
    }
    
    func authenticateUser(username: String, password: String) {
        // 检查输入的用户名和密码是否匹配测试用户
        if let user = testUsers.first(where: { $0.email == username.lowercased() && $0.password == password }) {
            print("Login successful")
            isLoggedIn = true
            currentUserRole = user.role
            
            // 根据用户角色导航到不同的页面
            if currentUserRole == .manager {
                navigateToHomePage()
            } else {
                navigateToPersonalDetailPage(user: user)
            }
        } else {
            print("No matching user found for email: \(username) and password: \(password)")
            showAlert(message: "Invalid username or password.")
        }
    }
    
    func navigateToHomePage() {
        let homePageView = HomePageView()
        let hostingController = UIHostingController(rootView: homePageView)
        present(hostingController, animated: true, completion: nil)
    }
    
    func navigateToPersonalDetailPage(user: User) {
        let personalDetailView = PersonalDetailView(user: user)
        let hostingController = UIHostingController(rootView: personalDetailView)
        present(hostingController, animated: true, completion: nil)
    }

    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
}

