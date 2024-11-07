import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userViewModel: UserViewModel

    var body: some View {
        Group {
            if userViewModel.isLoggedIn {
                ClientListView()
                    .environmentObject(userViewModel)
            } else {
                LoginView()
                    .environmentObject(userViewModel)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(UserViewModel())
    }
}
