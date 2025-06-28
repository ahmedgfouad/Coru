# 📚 Coru – E-Learning Mobile App

Coru is a modern, fully functional mobile e-learning application developed as a volunteer project. Inspired by leading online education platforms, Coru aims to deliver a seamless and engaging learning experience with interactive features, real-time communication, and a clean, responsive UI.

## 🚀 Features

- 🔐 **Secure Authentication**  
  Implemented login and registration using **Firebase Authentication** to ensure user data safety.

- 📖 **Course Browsing & Bookmarking**  
  Users can explore available courses, view details, and save/bookmark their favorite ones.

- 💬 **Real-Time Chat**  
  Enabled real-time chat functionality between users using **Firebase Realtime Database**.

- 📡 **Firebase Integration**  
  Seamlessly integrated various Firebase services including Authentication and Realtime Database.

- 🧠 **State Management with Provider**  
  Used the **Provider** package for efficient and clean state management across the app.

- 🧩 **MVVM Architecture**  
  Adopted the **Model-View-ViewModel (MVVM)** pattern to ensure code scalability and maintainability.

- 🖌️ **Smooth Animations**  
  Added elegant animations to boost interactivity and user engagement.

- 📱 **Responsive UI**  
  Built with a focus on clean design and responsive layout for all screen sizes.

## 🛠️ Tech Stack

- **Flutter** – UI Toolkit  
- **Dart** – Programming Language  
- **Firebase Auth** – Secure Authentication  
- **Firebase Realtime Database** – Real-Time Communication  
- **Provider** – State Management  
- **MVVM** – Clean Architecture Pattern  

## 📷 Screenshots

<img src="screenshots/home.png" width="250"/>
<img src="screenshots/course_details.png" width="250"/>
<img src="screenshots/chat.png" width="250"/>

> 📌 You can add more screenshots inside the `screenshots/` folder and reference them here.

## 📂 Project Structure

```bash
lib/
├── core/           # Common utilities and constants
├── models/         # Data models
├── views/          # UI screens
├── viewmodels/     # Business logic (MVVM)
├── services/       # Firebase services
└── main.dart       # App entry point
