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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let loginView = LoginView()
        
        let hostingController = UIHostingController(rootView: loginView)
                
                // Add the hosting controller as a child of the current view controller
                addChild(hostingController)
                hostingController.view.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(hostingController.view)
                
                // Set up constraints to make the SwiftUI view fill the entire ViewController's view
                NSLayoutConstraint.activate([
                    hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
                    hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                    hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
                ])
                
                hostingController.didMove(toParent: self)
    }
    
    @IBAction func signInTapped(_sender: UIButton){
        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        if username.isEmpty || password.isEmpty{
            showAlert(message: "Please enter both username and password.")
        } else {
            authenticateUser(username: username, password:password)
        }
    }
    
    // Action for the sign up button
    @IBAction func signUpTapped(_ sender: UIButton){
        print("Sign up tapped")
    }
    
    func authenticateUser(username: String, password: String){
        if username == "test" && password == "password"{
            print("Login successful")
        }else{
            showAlert(message: "Invalid username or password.")
        }
    }
    
    //a helper function for showing alert message
    func showAlert(message: String){
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true)
    }
    
}

