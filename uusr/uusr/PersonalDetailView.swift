//
//  PersonalDetailView.swift
//  uusr
//
//  Created by Jianming Chen on 2024-11-07.
//
import SwiftUI

struct PersonalDetailView: View {
    var user: User

    var body: some View {
        VStack(spacing: 20) {
            Circle()
                .fill(Color.blue.opacity(0.2))
                .frame(width: 100, height: 100)
                .overlay(
                    Text(String(user.firstName.prefix(1)))
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                )
            
            Text("\(user.firstName) \(user.lastName)")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            // Email
            HStack {
                Text("Email:")
                    .fontWeight(.bold)
                Text(user.email)
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10)
            
            // Role
            HStack {
                Text("Role:")
                    .fontWeight(.bold)
                Text(String(describing: user.role).capitalized)
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10)
            
            // Unit Number
            if let unitNumber = user.unitNumber {
                HStack {
                    Text("Unit Number:")
                        .fontWeight(.bold)
                    Text(unitNumber)
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
            }
            
            // Building Name
            if let buildingName = user.buildingName {
                HStack {
                    Text("Building Name:")
                        .fontWeight(.bold)
                    Text(buildingName)
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("User Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PersonalDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalDetailView(user: User(email: "example@example.com", password: "password", role: .individual, firstName: "John", lastName: "Doe", unitNumber: "101", buildingName: "Main Building"))
    }
}
