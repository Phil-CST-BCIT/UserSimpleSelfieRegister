//
//  HomePage.swift
//  uusr
//  Created by Jianming Chen on 2024-11-05.
//
import SwiftUI

struct HomePageView: View {
    @State private var searchText: String = ""
    @State private var sortAscending: Bool = true
    
    // Sample user data, replace with actual data as needed
    @State private var users = [
        User(email: "admin@example.com", password: "admin123", role: .manager, firstName: "Alice", lastName: "Smith", unitNumber: nil, buildingName: nil),
        User(email: "user@example.com", password: "user123", role: .individual, firstName: "Bob", lastName: "Johnson", unitNumber: nil, buildingName: nil),
        User(email: "user2@example.com", password: "user123", role: .individual, firstName: "Charlie", lastName: "Brown", unitNumber: nil, buildingName: nil)
    ]
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Home Page")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .padding(.top, 20)
                    .padding(.leading)
                
                // Search bar
                TextField("Search", text: $searchText)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
                    .padding([.leading, .trailing])

                // Sort button
                HStack {
                    Text("Sort by First Name")
                        .font(.subheadline)
                    Button(action: {
                        sortAscending.toggle()
                        users.sort { sortAscending ? $0.firstName < $1.firstName : $0.firstName > $1.firstName }
                    }) {
                        Image(systemName: sortAscending ? "arrow.up" : "arrow.down")
                            .foregroundColor(.blue)
                    }
                }
                .padding([.leading, .trailing])
                
                // User list
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(filteredUsers, id: \.id) { user in
                            NavigationLink(destination: PersonalDetailView(user: user)) {
                                UserRowView(user: user)
                            }
                        }
                    }
                    .padding([.leading, .trailing])
                }
            }
            .navigationBarHidden(true)
            .padding()
        }
    }
    
    // Filtered user data
    var filteredUsers: [User] {
        users.filter { user in
            searchText.isEmpty || user.firstName.lowercased().contains(searchText.lowercased())
        }
    }
}

// User information for each row
struct UserRowView: View {
    @ObservedObject var user: User
    
    var body: some View {
        HStack {
            Circle()
                .fill(Color.blue.opacity(0.2))
                .frame(width: 50, height: 50)
                .overlay(
                    Text(String(user.firstName.prefix(1)))
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                )
            
            VStack(alignment: .leading) {
                Text(user.firstName)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                Text(user.lastName)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10)
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
