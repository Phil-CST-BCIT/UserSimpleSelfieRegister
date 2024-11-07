//
//  Register.swift
//  uusr
//
//  Created by Jianming Chen on 2024-11-05.
//

import SwiftUI

struct RegistrationView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var unitNumber: String = ""
    @State private var buildingName: String = ""
    @State private var showingImagePicker = false
    @State private var profileImage: Image? = nil

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
                registerUser()
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

            Spacer()
        }
        .padding()
    }
    
    func registerUser() {
        // Handle the registration logic here
        print("Registering user with information: \(firstName), \(lastName), \(unitNumber), \(buildingName)")
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
