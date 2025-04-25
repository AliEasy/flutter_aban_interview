
# 🌍 Aban Tether Interview Task – Flutter Application
A Flutter-based mobile application built as part of the Aban Tether interview process. The app follows clean architecture principles with modular, testable code and showcases modern Flutter best practices.

## 🛠 Setup & Installation

### Prerequisites
- Flutter SDK (3.6.0 or above)
- Dart
- Android Studio / VS Code
- Emulator or real device

### Installation Steps

- Clone the project
- Install dependencies
```bash
   flutter pub get
```
- Generate code
```bash
   dart run build_runner build --delete-conflicting-outputs
```
- Run The app

## 🧱 Built With

### Architecture
This project uses **Clean Architecture** to separate responsibilities across layers:

- **Presentation Layer**: Flutter UI + Cubit (Bloc)

- **Domain Layer**: Entities + UseCases (Business Logic)

- **Data Layer**: Repositories + Remote APIs (Dio)

### Key Choices
- **State Management**: Cubit for simple & predictable state handling.

- **Dependency Injection**: injectable + get_it for scalable service location.

- **Data Models & Immutability**: freezed for concise data classes and union types.

- **Networking**: dio for HTTP calls with custom interceptors and error handling.

- **Persistence**: SharedPreferences + FlutterSecureStorage for storing tokens & user data.

- **Localization**: intl with .arb files, supporting multi-language extensibility.


# 📚 Acknowledgements

- [Clean architecture in flutter](https://devmuaz.medium.com/flutter-clean-architecture-series-part-1-d2d4c2e75c47)
- [Clean coding in flutter](https://medium.com/flutter-community/flutter-best-practices-and-tips-7c2782c9ebb5)
- [Modularization in flutter](https://medium.com/flutter-community/mastering-flutter-modularization-in-several-ways-f5bced19101a)
- [Dependency injection with get it](https://pub.dev/packages/get_it)
- [Bloc Architecture in flutter](https://medium.com/codechai/architecting-your-flutter-project-bd04e144a8f1)
