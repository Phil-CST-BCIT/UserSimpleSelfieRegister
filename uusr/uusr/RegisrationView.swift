//
//  Register.swift
//  uusr
//
//  Created by Jianming Chen on 2024-11-05.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct RegistrationView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var unitNumber: String = ""
    @State private var buildingName: String = ""
    @State private var password: String = ""
    @State private var showingImagePicker = false
    @State private var profileImage: Image? = nil
    @State private var isEmailInvalid = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Register")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            
            // Profile Image Section
            VStack {
                if profileImage != nil {
                    profileImage?
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .padding()
                } else {
                    Button(action: {
                        showingImagePicker = true
                    }) {
                        Circle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 100, height: 100)
                            .overlay(Text("Add Photo").foregroundColor(.blue))
                    }
                }
            }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(selectedImage: $profileImage)
            }
            
            // First Name Field
            TextField("First Name", text: $firstName)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
            
            // Last Name Field
            TextField("Last Name", text: $lastName)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
            
            // Email Field
            TextField("Email", text: $email)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
                .onChange(of: email) { newValue in
                    isEmailInvalid = !isValidEmail(newValue)
                }
            
            if isEmailInvalid {
                Text("Invalid email address")
                    .foregroundColor(.red)
                    .font(.footnote)
                    .padding(.bottom, 5)
            }
            
            // Password Field
            SecureField("Password", text: $password)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
            
            // Unit Number Field
            TextField("Unit Number", text: $unitNumber)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
            
            // Building Name Field
            TextField("Building Name", text: $buildingName)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
            
            // Register Button
            Button(action: {
                if !isEmailInvalid {
                    registerUser()
                }
            }) {
                Text("Register")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.top, 20)
            .disabled(isEmailInvalid)

            Spacer()
        }
        .padding()
    }
    
    func registerUser() {
        let db = Firestore.firestore()
        
        // Create User instance
        let newUser = User(
            email: email,
            password: password,
            role: .individual,
            firstName: firstName,
            lastName: lastName,
            unitNumber: unitNumber.isEmpty ? nil : unitNumber,
            buildingName: buildingName.isEmpty ? nil : buildingName
        )
        
        // Convert User instance to dictionary for Firestore
        let userData: [String: Any] = [
            "id": newUser.id.uuidString,
            "firstName": newUser.firstName,
            "lastName": newUser.lastName,
            "email": newUser.email,
            "password": newUser.password,
            "unitNumber": newUser.unitNumber ?? "",
            "buildingName": newUser.buildingName ?? "",
            "role": newUser.role == .manager ? "manager" : "individual", // Set role as a string for storage
            "status": Status.allCases.reduce(into: [String: Bool]()) { $0[$1.rawValue] = false } // Initialize all statuses to false
        ]
        
        db.collection("users").addDocument(data: userData) { error in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                print("User successfully registered: \(firstName), \(lastName)")
            }
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: email)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
