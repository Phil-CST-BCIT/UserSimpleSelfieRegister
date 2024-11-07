//
//  ContentView.swift
//  uusr
//
//  Created by Jianming Chen on 2024-11-07.
//

import SwiftUI

struct ContentView: View {
    @State private var userRole: UserRole = .manager // 可以通过实际的登录逻辑设置用户角色
    @State private var isLoggedIn = false // Initialize to unlogged state

    var body: some View {
        if isLoggedIn {
            // 如果已登录，根据用户角色显示不同的页面
            if userRole == .manager {
                HomePageView() // 管理员访问首页
            } else {
                PersonalDetailView(user: User(email: "user@example.com", password: "user123", role: .individual, firstName: "John", lastName: "Doe"))
            }
        } else {
            // 如果未登录，显示登录页面
            LoginView(isLoggedIn: $isLoggedIn)
        }
    }
}

// 定义用户角色
//enum UserRole {
//    case manager
//    case individual
//}
