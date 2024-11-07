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
            // 用户头像
            Circle()
                .fill(Color.blue.opacity(0.2))
                .frame(width: 100, height: 100)
                .overlay(
                    Text(String(user.firstName.prefix(1)))
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                )

            // 用户姓名
            Text("\(user.firstName) \(user.lastName)")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            // 用户详细信息
            VStack(alignment: .leading, spacing: 10) {
                Text("Email: \(user.email)")
                    .foregroundColor(.gray)
                
                Text("Role: \(user.role == .manager ? "Manager" : "Individual")")
                    .foregroundColor(.gray)
                
                Text("First Name: \(user.firstName)")
                    .foregroundColor(.gray)
                
                Text("Last Name: \(user.lastName)")
                    .foregroundColor(.gray)
                
                // 显示地址信息
                if let unitNumber = user.unitNumber, let buildingName = user.buildingName {
                    Text("Address:")
                        .font(.headline)
                        .padding(.top, 10)
                    
                    Text("Unit Number: \(unitNumber)")
                        .foregroundColor(.gray)
                    
                    Text("Building Name: \(buildingName)")
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10)
            
            Spacer()
        }
        .padding()
        .navigationTitle("User Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PersonalDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalDetailView(user: User(
            email: "example@example.com",
            password: "password",
            role: .individual,
            firstName: "John",
            lastName: "Doe",
            unitNumber: "101",
            buildingName: "Sunset Apartments"
        ))
    }
}

