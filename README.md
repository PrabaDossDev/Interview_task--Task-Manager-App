# Interview Task – Flutter Task Manager App

A simple **Task Management Flutter application** built as part of an interview assignment. The app demonstrates clean architecture, proper state management using **Stacked**, and local persistence using **SQLite (sqflite)**.

---

## ✨ Features

### 🔐 Authentication (Mocked)

* Login screen with email & password validation
* Mock authentication (no real backend)
* Login state persisted locally
* Auto-login if session exists
* Logout clears session and local data

**Mock Credentials (for testing):**

* **Email:** [prabatest@gmail.com]
* **Password:** Prabatest@123

---

### 🏠 Home – Task List

* Displays list of tasks
* Task details:

    * Title
    * Description (optional)
    * Status (Pending / Completed)
* Search tasks by title
* Pull-to-refresh
* Empty states handled gracefully
* Floating Action Button to add new task

#### Swipe to Delete

* Swipe left to delete a task
* Confirmation dialog before delete
* SnackBar with **Undo delete** option

---

### 📝 Create / Edit Task

* Single screen for both create & edit
* Fields:

    * Title (required)
    * Description
    * Status dropdown (Pending / Completed)
* Default status: Pending
* Validation before saving
* Data persisted locally

---

## 🧱 Architecture

This project follows **Stacked Architecture** with clear separation of concerns.

```
lib/
├── core/
│   ├── enum/
│   ├── model/
│   ├── res/
│
├── services/
│   ├── local/        # SQLite DB helper & services
│   ├── shared/       # Preferences, navigation, dialogs
│
├── ui/
│   ├── views/
│   │   ├── login/
│   │   ├── home/
│   │   ├── task_create_edit/
│   │
│   ├── widgets/
│
├── locator.dart
├── router.dart
└── main.dart
```

### Layers Explained

* **UI Layer**: Flutter widgets (Views)
* **ViewModel Layer**: Business logic & state (Stacked)
* **Service Layer**: Database & preferences
* **Data Layer**: SQLite tables & models

---

## 🗃️ Local Persistence

### SQLite (sqflite)

* Tasks stored locally using SQLite
* CRUD operations supported
* Data persists across app restarts

### SharedPreferences

* Stores login/session state
* Clears data on logout

---

## 🧠 State Management

* Uses **Stacked (ViewModelBuilder)**
* ViewModels extend a common `MyBaseViewModel`
* Handles:

    * Loading states
    * Empty states
    * Error handling

---

## 🛠️ Tech Stack

* **Flutter**
* **Stacked** (State management)
* **SQLite (sqflite)**
* **SharedPreferences**
* **GetIt** (Dependency injection)

---

## 🚀 Getting Started

### Prerequisites

* Flutter SDK (latest stable)
* Android Studio / VS Code

### Run the App

```bash
flutter pub get
flutter run
```

---

## 🧪 Error Handling & Validations

* Form validations for login & task creation
* Safe DB operations
* Graceful empty screens
* No unhandled exceptions

---

## ⭐ Bonus Implemented

* Search tasks by title
* Swipe to delete with Undo
* Empty state UI
* Keyboard-safe forms

---

## 📝 Notes

* Authentication is mocked for simplicity
* App focuses on clean architecture & code quality
* Designed to be easily extensible

---

## 👤 Author

**Praba Doss**

---

Thank you for reviewing this project 🙏
