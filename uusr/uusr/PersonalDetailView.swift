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
            
            // 这里可以添加更多的用户详细信息
            Text("Additional details about \(user.firstName)")
                .foregroundColor(.gray)
            
            Spacer()
        }
        .padding()
        .navigationTitle("User Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

