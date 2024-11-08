import SwiftUI
import FirebaseFirestore

struct PersonalDetailView: View {
    @ObservedObject var user: User

    var body: some View {
        VStack(spacing: 20) {
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

            // Status Section
            VStack {
                Text("Status")
                    .font(.headline)
                    .padding(.top, 20)

                ForEach(Status.allCases, id: \.self) { status in
                    HStack {
                        Toggle(isOn: Binding(
                            get: { user.statusDictionary[status.rawValue] ?? false },
                            set: { isSelected in
                                user.statusDictionary[status.rawValue] = isSelected
                                // Cache the updated status locally
                                saveStatusLocally(for: user)
                                // Push to Firestore
                                updateStatusInFirestore(for: user)
                            }
                        )) {
                            Text(status.rawValue.capitalized)
                        }
                    }
                    .padding(.horizontal)
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

    func saveStatusLocally(for user: User) {
        UserDefaults.standard.set(user.statusDictionary, forKey: "status_\(user.id.uuidString)")
    }

    func updateStatusInFirestore(for user: User) {
        let db = Firestore.firestore()
        db.collection("users").document(currentUserDocumentID ?? "").updateData([
            "status": user.statusDictionary
        ]) { error in
            if let error = error {
                print("Error updating status: \(error)")
            } else {
                print("Status successfully updated for user: \(currentUserDocumentID ?? "N/A")")
            }
        }
    }
}
