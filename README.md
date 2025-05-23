# Final Project - Mobile Application 🚀 

### 📱 Project Description  
This project is a complete **Flutter mobile application** developed using the **MVVM architecture**.  
The app incorporates:  
- State management using the **Provider** package  
- Persistent storage using **SharedPreferences**  
- User authentication  
- API integration  
- Theme switching (Dark/Light mode)  
- Basic **CRUD operations**  

## 🌟 Features  

### User Authentication:  
- **Sign Up:** Register with name, email, and password (validated).  
- **Login:** Sign in with saved login status (using SharedPreferences).  

### Home Screen:  
- Displays items fetched from a public API using the **http** package.  

### Dashboard Screen:  
- Shows the items added by the user.  

### Add Items Screen:  
- Allows users to add custom items (name, description, images).  
- State managed using **Provider**.  

### Details Screen:  
- Displays detailed information about a selected item.  

### Favorite Screen:  
- Shows items marked as favorites by the user.  
- Toggle favorite status using **Provider**.  

### Profile Screen:  
- Displays user information and allows editing.  
- **Logout** button to clear SharedPreferences.  
- **Dark/Light mode** switcher stored in SharedPreferences.  

## 🛠️ Technical Stack  
- **Framework:** Flutter  
- **State Management:** Provider  
- **Architecture:** MVVM  
- **Local Storage:** SharedPreferences  
- **API Calls:** http package  
- **Form Handling:** Form and TextFormField with validation
  
## 💡 Bonus Features
- **Dark/Light Mode** with persistence  
- Clean and structured code following **MVVM** and **Provider** best practices  

## 🎥 Project Video  
A demonstration video of the UI can be found [here](https://drive.google.com/file/d/1mfLjoY9MBNZ6LDW3Y1V5b8-Ni32HwVMH/view?usp=sharing).  

## 🚀 Installation  

### Clone the repository:  
```bash
git clone https://github.com/FatmaMoataz/finalProject-flutter.git
cd finalProject-flutter
flutter pub get
flutter run
```

## 👥 Contributors  

- [Fatma Moataz Mahmoud](https://github.com/FatmaMoataz) (230461568)  
  - **Role:** Integrated a toggle switch in the profile screen using `setState`, added the splash screen, and developed the registration service using **SharedPreferences**.  

- [Jumana Adel Abdelwanees](https://github.com/jumanaadell5) (230473749)  
  - **Role:** Developed the profile screen, allowing users to edit their information.  
  - **Additional Contributions:** Implemented the **Dark/Light mode** feature and created the **About Page**.  

- [Khaled Mohamed Aly](https://github.com/khaledalawagy) (230469424)  
  - **Role:** Managed the logout functionality and handled routing within the main file.  

- [Adham Ihab Shaaban](https://github.com/AdhamGhalwash) (230540853)  
  - **Role:** Implemented the registration UI and validation logic for input handling.  
