import SwiftUI
import Firebase
import FirebaseFirestore

struct PersonalDetailView: View {
    @StateObject var user: User
    @State private var isLoading: Bool = true

    var body: some View {
        VStack(spacing: 20) {
            if isLoading {
                ProgressView()
            } else {
                // Profile Circle with Initial
                Circle()
                    .fill(Color.blue.opacity(0.2))
                    .frame(width: 100, height: 100)
                    .overlay(
                        Text(String(user.firstName.prefix(1)))
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                    )
                
                // Full Name
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
                    Text(user.role == .manager ? "Manager" : "Individual")
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
                
                // Unit Number
                if let unitNumber = user.unitNumber, !unitNumber.isEmpty {
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
                if let buildingName = user.buildingName, !buildingName.isEmpty {
                    HStack {
                        Text("Building Name:")
                            .fontWeight(.bold)
                        Text(buildingName)
                    }
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
                }
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("User Details")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            fetchUserDetails()
        }
    }
    
    func fetchUserDetails() {
        let db = Firestore.firestore()
        db.collection("users").document(user.id.uuidString).getDocument { (document, error) in
            if let document = document, document.exists {
                if let data = document.data() {
                    DispatchQueue.main.async {
                        user.firstName = data["firstName"] as? String ?? ""
                        user.lastName = data["lastName"] as? String ?? ""
                        user.email = data["email"] as? String ?? ""
                        user.password = data["password"] as? String ?? ""
                        user.role = (data["role"] as? String == "manager") ? .manager : .individual
                        user.unitNumber = data["unitNumber"] as? String
                        user.buildingName = data["buildingName"] as? String
                        isLoading = false
                    }
                } else {
                    isLoading = false
                }
            } else {
                isLoading = false
            }
        }
    }
}

struct PersonalDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalDetailView(user: User(email: "example@example.com", password: "password", role: .individual, firstName: "John", lastName: "Doe", unitNumber: "101", buildingName: "Sunset Apartments"))
    }
}
