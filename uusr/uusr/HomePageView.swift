//
//  HomePage.swift
//  uusr
//
//  Created by Jianming Chen on 2024-11-05.
//
import SwiftUI

struct HomePageView: View {
    @State private var searchText: String = ""
    @State private var sortAscending: Bool = true
    
    // 示例用户数据，可以根据实际情况替换
    @State private var users = [
        User(email: "admin@example.com", password: "admin123", role: .manager, firstName: "Alice", lastName: "Smith"),
        User(email: "user@example.com", password: "user123", role: .individual, firstName: "Bob", lastName: "Johnson"),
        User(email: "user2@example.com", password: "user123", role: .individual, firstName: "Charlie", lastName: "Brown")
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
                
                // 搜索框
                TextField("Search", text: $searchText)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
                    .padding([.leading, .trailing])

                // 排序按钮
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
                
                // 用户列表
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(filteredUsers) { user in
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
    
    // 过滤用户数据
    var filteredUsers: [User] {
        users.filter { user in
            searchText.isEmpty || user.firstName.lowercased().contains(searchText.lowercased())
        }
    }
}

// 每行的用户信息视图
struct UserRowView: View {
    var user: User
    
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
