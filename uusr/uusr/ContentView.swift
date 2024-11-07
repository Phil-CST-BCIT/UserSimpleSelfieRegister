//
//  ContentView.swift
//  uusr
//
//  Created by Jianming Chen on 2024-11-07.
//

import SwiftUI

struct ContentView: View {
    @State private var userRole: UserRole = .manager // Set based on actual login logic
    @State private var isLoggedIn = false // Initialize to unlogged state

    var body: some View {
        if isLoggedIn {
            // If logged in, show different views based on user role
            if userRole == .manager {
                HomePageView() // Manager access home page
            } else {
                PersonalDetailView(user: User(email: "user@example.com", password: "user123", role: .individual, firstName: "John", lastName: "Doe", unitNumber: nil, buildingName: nil))
            }
        } else {
            // If not logged in, show login page
            LoginView(isLoggedIn: $isLoggedIn)
        }
    }
}

// Preview the ContentView
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
