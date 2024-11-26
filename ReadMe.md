# Project

## Overview
The project is a SwiftUI-based application designed to provide a modular and scalable structure.  
It includes features such as product listing, cart management, detailed error handling, and analytics tracking.

## Key Features
- **Networking Module:** Handles HTTP requests and responses with extensibility in mind.
- **Routing System:** Ensures seamless navigation between views using a declarative approach.
- **Firebase Integration:** Provides analytics and error logging capabilities.
- **Dependency Injection:** Uses environment variables and explicit function parameter passing for clear and testable code.
- **Custom Components:** Includes reusable UI components such as SnackBar, CachedAsyncImage, and more.

## Assumptions Made
1. **Environment-Driven Dependency Injection:**  
   - Dependencies are injected using SwiftUI's environment object for shared data and services.
   - For specific functions requiring dependencies, these are passed explicitly in function signatures.

2. **Firebase Integration:**  
   - The project uses Firebase for analytics and crash reporting.  
   - The `GoogleService-Info.plist` file is included in the project for Firebase configuration.

3. **Code Modularity:**  
   - Each feature is encapsulated in its own module (e.g., `Cart`, `ProductList`) for maintainability.

## Choices Around Plugins and Libraries
- **Firebase:** Used for its robust analytics, crash reporting, and event tracking.
- **Native Swift Libraries:** Wherever possible, native Swift libraries are used to minimize third-party dependency overhead and enhance maintainability.
- **Custom Utility Extensions:** Includes utilities like `Codable+Extensions` and `URLRequest+Curl` for enhanced functionality.

## Project Structure
```
Carry1st/
├── App/
│   ├── Configuration/
│   └── AppCoordinator.swift
├── Core/
│   ├── Networking/
│   ├── API/
│   ├── Routing/
│   ├── Extensions/
│   └── Utilities/
├── Features/
│   ├── Cart/
│   └── ProductList/
├── Components/
├── Services/
│   ├── Analytics/
│   ├── Product/
│   └── ErrorLogging/
└── Assets/
```
- **App/**: Contains app-wide configurations and entry point (`Carry1stApp.swift`).
- **Core/**: Centralized logic for networking, API requests, and routing.
- **Features/**: Individual app features encapsulated with View and ViewModel pairs.
- **Components/**: Reusable UI components.
- **Services/**: Contains service interfaces and implementations such as analytics and product services.

## Setup
1. Ensure you have Xcode installed with a minimum version compatible with SwiftUI and Firebase SDKs.
2. Add your Firebase configuration file (`GoogleService-Info.plist`) to the project.
3. xcodebuild --resolvePackageDependencies

## Usage
1. Open the project in Xcode.
2. Build and run the project on your simulator or connected device.

## Notes
- This project adheres to the MVVM-C architecture for better separation of concerns.
- The `Router` module is used to manage navigation dynamically.

## Contribution Guidelines
1. Follow the existing folder structure.
2. Write unit tests for all ViewModels and Services.
3. Use dependency injection wherever possible to improve testability.

## License
This project is licensed under the MIT License. See the LICENSE file for details.