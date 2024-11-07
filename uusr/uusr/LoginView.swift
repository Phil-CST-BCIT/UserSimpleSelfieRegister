//
//  LoginView.swift
//  uusr
//
//  Created by Jianming Chen on 2024-11-02.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoginFailed = false
    @State private var showRegistration = false
    @Binding var isLoggedIn: Bool // Bind to the ContentView's login state
    
    var body: some View {
        VStack(spacing: 20) {
            // App Title
            Text("User Selfie Register")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 40)
            
            // Email Field
            TextField("Email", text: $email)
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
    }
    
    func authenticateUser() {
        let db = Firestore.firestore()
        db.collection("users").whereField("email", isEqualTo: email).getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error fetching user: \(error)")
                self.isLoginFailed = true
                return
            }
            
            guard let documents = querySnapshot?.documents, let document = documents.first else {
                self.isLoginFailed = true
                return
            }
            
            let data = document.data()
            if let storedPassword = data["password"] as? String {
                if storedPassword == self.password {
                    self.isLoginFailed = false
                    self.isLoggedIn = true
                    let user = User(
                        email: email,
                        password: storedPassword,
                        role: (data["role"] as? String == "manager") ? .manager : .individual,
                        firstName: data["firstName"] as? String ?? "",
                        lastName: data["lastName"] as? String ?? "",
                        unitNumber: data["unitNumber"] as? String,
                        buildingName: data["buildingName"] as? String
                    )
                    navigateToPersonalDetailView(user: user)
                } else {
                    self.isLoginFailed = true
                }
            } else {
                self.isLoginFailed = true
            }
        }
    }
    
    func navigateToPersonalDetailView(user: User) {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            window.rootViewController = UIHostingController(rootView: PersonalDetailView(user: user))
            window.makeKeyAndVisible()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    @State static var isLoggedIn = false // Create a temporary state

    static var previews: some View {
        LoginView(isLoggedIn: $isLoggedIn) // Pass state to LoginView's isLoggedIn binding
    }
}
