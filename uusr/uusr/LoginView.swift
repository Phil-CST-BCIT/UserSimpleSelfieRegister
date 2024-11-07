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
    @State private var showRegistration = false
    @State private var isLoginSuccessful = false

    var body: some View {
        NavigationStack {
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

                // Register Button
                Button(action: {
                    showRegistration.toggle()
                }) {
                    Text("Register").foregroundColor(.blue)
                }
                .padding(.top, 10)
                .sheet(isPresented: $showRegistration) {
                    RegistrationView()
                }

                Spacer()
            }
            .padding()
            .navigationDestination(isPresented: $isLoginSuccessful) {
                HomePageView()
            }
        }
    }

    func authenticateUser() {
        // Placeholder for authentication logic
        if email == "test@example.com" && password == "password" { // Replace with actual login logic
            isLoginSuccessful = true
            isLoginFailed = false
        } else {
            isLoginFailed = true
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
