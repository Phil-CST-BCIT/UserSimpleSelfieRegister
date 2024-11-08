# User Simple Selfie Register

This is a SwifUI-Based iOS application designed to register users with a photo and display clinet details in a list view. The app includes login functionality, client list view with sorting and searching, and detailed client information with customizable statuses.
## Features
- **Login Page**: User can log in with an email and password
- **Client List View**: Displays a list of clients with their photo, name, and address. User can sort by first name, last name, or unit number and search by name or address.

- **Client Detail View**: Upon selecting a client, users are presented with more detailed information, including a larger photo, name, address, and other client-specific details

- **Status Update**: Allows users to set the status of each client, such as "Completed", "Refused", pr "Partial." Statues are updated locally and posted back to the server when feasible.

- **Data Caching**: Client data is cached locally to prevent data loss and updated when possible

## Installation

1. Clone the repository:
```bash
git clone https://github.com/Phil-CST-BCIT/UserSimpleSelfieRegister.git

cd UserSimpleSelfieRegister

```
2. Open the project in Xcode:
```bash
open UserSimpleSelfieRegister
```
3. Build and run the project in the simulator or on an iOS device.

## Usage
1. **Login**: Use test credentials (e.g., test@example.com / password) to log in.
2. **View Clients**: After logging in, the app displays a list of clients. Scroll through the list to view client names, photos, and addresses.
3. **Sort and Search**: Use the sort option to sort clients by first name, last name, or unit number. Use the search bar to filter clients by name or address.
4. **View Client Details**: Tap on a client in the list to view their details, including a larger photo and full address information.
5. **Update Status**: In the detail view, set the client's status, which is then stored locally and posted back when possible.

## Acknowledgments (BCIT bachelor of science in computer science)
- Parker Chen (parkerchen1123@outlook.com)
- Jerry Zhang (zhangzhe941020@yahoo.com)
- Phil Teng (https://github.com/Phil-CST-BCIT)


## License

[MIT](https://choosealicense.com/licenses/mit/)
