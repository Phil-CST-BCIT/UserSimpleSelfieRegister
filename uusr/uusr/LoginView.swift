//
//  LoginView.swift
//  uusr
//
//  Created by Jianming Chen on 2024-11-02.
//


import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoginFailed = false

    var body: some View {
        VStack(spacing: 20) {
            // App Title
            Text("User Selfie Register")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 40)

            // Email Field
            TextField("Email/Username", text: $email)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
                .autocapitalization(.none)
                .keyboardType(.emailAddress)

            // Password Field
            SecureField("Password", text: $password)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)

            // Login Button
            Button(action: {
                authenticateUser()
            }) {
                Text("Login")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.top, 10)

            // Error Message
            if isLoginFailed {
                Text("Invalid email or password")
                    .foregroundColor(.red)
                    .padding(.top, 10)
            }
            
            Button(action: {
                print("Register tapped")
            }){
                Text("Register").foregroundColor(.blue)
            }
            .padding(.top, 10)

            Spacer()
        }
        .padding()
    }

    func authenticateUser() {
        // Placeholder for authentication logic
        if email.isEmpty || password.isEmpty {
            isLoginFailed = true
        } else {
            isLoginFailed = false
            // Proceed to the next screen or authentication flow
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
