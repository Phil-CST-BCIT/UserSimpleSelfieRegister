//
//  HomePage.swift
//  uusr
//
//  Created by Jianming Chen on 2024-11-05.
//
import SwiftUI

struct HomePageView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Home Page")
                    .font(.title)
                    .foregroundColor(.purple)
                    .padding(.top, 20)
                
                List(0..<10) { _ in
                    HStack {
                        // Profile icon
                        Circle()
                            .fill(Color.purple.opacity(0.3))
                            .frame(width: 50, height: 50)
                            .overlay(
                                Text("A")
                                    .fontWeight(.bold)
                                    .foregroundColor(.purple)
                            )
                        
                        VStack(alignment: .leading) {
                            Text("firstname")
                                .fontWeight(.bold)
                            Text("lastname")
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        // Placeholder for icons on the right
                        HStack(spacing: 10) {
                            Circle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 20, height: 20)
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 20, height: 20)
                            Triangle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 20, height: 20)
                        }
                    }
                    .padding()
                    .background(Color.purple.opacity(0.1))
                    .cornerRadius(10)
                }
                .padding([.leading, .trailing])
            }
            .navigationBarHidden(true)
        }
    }
}

// Custom triangle shape for the icon
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

