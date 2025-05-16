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

## 🎥 Project Video  
A demonstration video of the UI can be found [here](link-to-video).  

## 🚀 Installation  

### Clone the repository:  
```bash
git clone https://github.com/FatmaMoataz/finalProject-flutter.git
cd finalProject-flutter
flutter pub get
flutter run
```

## 👥 Contributors  
- **Fatma Moataz Mahmoud** (230461568) - **Role:** Integrated a toggle switch in profile screen using ```setState``` and added the splash screen
- **Jumana Adel Abdelwanees** (230473749) - **Role:** Worked on the profile screen, allowing users to edit their information  
- **Khaled Mohamed Aly** (230469424) - **Role:** Handled the logout logic and managed the routes in the main file
- **Adham Ihab Shaaban** (230540853) -  **Role:** Implemented the registration UI and logic  
