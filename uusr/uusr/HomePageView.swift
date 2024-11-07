//
//  HomePage.swift
//  uusr
//
//  Created by Jianming Chen on 2024-11-05.
//
import SwiftUI

struct HomePageView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Home Page")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .padding(.top, 20)
                    .padding(.leading)
                
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(0..<10, id: \.self) { _ in
                            HStack {
                                // 头像
                                Circle()
                                    .fill(Color.blue.opacity(0.2))
                                    .frame(width: 50, height: 50)
                                    .overlay(
                                        Text("A")
                                            .fontWeight(.bold)
                                            .foregroundColor(.blue)
                                    )
                                
                                VStack(alignment: .leading) {
                                    Text("firstname")
                                        .fontWeight(.bold)
                                        .foregroundColor(.primary)
                                    Text("lastname")
                                        .foregroundColor(.gray)
                                }
                                
                                Spacer()
                                
                                // 图标部分
                                HStack(spacing: 10) {
                                    Circle()
                                        .fill(Color.gray.opacity(0.2))
                                        .frame(width: 20, height: 20)
                                    Rectangle()
                                        .fill(Color.gray.opacity(0.2))
                                        .frame(width: 20, height: 20)
                                    Triangle()
                                        .fill(Color.gray.opacity(0.2))
                                        .frame(width: 20, height: 20)
                                }
                            }
                            .padding()
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(10)
                        }
                    }
                    .padding([.leading, .trailing])
                }
            }
            .navigationBarHidden(true)
            .padding()
        }
    }
}

// 自定义三角形图标
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
