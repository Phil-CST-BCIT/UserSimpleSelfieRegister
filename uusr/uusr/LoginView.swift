import SwiftUI
import Firebase
import FirebaseFirestore

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoginFailed = false
    @State private var showRegistration = false
    @EnvironmentObject var userViewModel: UserViewModel

    var body: some View {
        VStack(spacing: 20) {
            // App Title
            Text("User Selfie Register")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 40)
            
            // Email Field
            TextField("Email", text: $email)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
            
            // Password Field
            SecureField("Password", text: $password)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
            
            // Login Button
            Button(action: {
                authenticateUser()
            }) {
                Text("Login")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.top, 10)
            
            // Error Message
            if isLoginFailed {
                Text("Invalid email or password")
                    .foregroundColor(.red)
                    .padding(.top, 10)
            }
            
            // Register Button
            Button(action: {
                showRegistration.toggle()
            }) {
                Text("Register").foregroundColor(.blue)
            }
            .padding(.top, 10)
            .sheet(isPresented: $showRegistration) {
                RegistrationView()
            }
            
            Spacer()
        }
        .padding()
    }
    
    func authenticateUser() {
        let db = Firestore.firestore()
        db.collection("users").whereField("email", isEqualTo: email).getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error fetching user: \(error)")
                self.isLoginFailed = true
                return
            }
            
            guard let documents = querySnapshot?.documents, let document = documents.first else {
                print("No matching documents found.")
                self.isLoginFailed = true
                return
            }
            
            let data = document.data()
            if let storedPassword = data["password"] as? String {
                if storedPassword == self.password {
                    print("Login successful. Changing isLoggedIn state to true.")
                    self.isLoginFailed = false
                    userViewModel.isLoggedIn = true // Update state to show ClientListView
                } else {
                    print("Incorrect password.")
                    self.isLoginFailed = true
                }
            } else {
                print("Password data missing.")
                self.isLoginFailed = true
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(UserViewModel())
    }
}
