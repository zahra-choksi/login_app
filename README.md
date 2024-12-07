# login_app

## Overview
login_app is a sample Flutter application designed to showcase best practices in software architecture and design patterns. It follows Clean Architecture principles and employs the BLoC (Business Logic Component) pattern for state management.

## Features

- Submit / login button
- Directly go to home screen if you are a customer of that app
- Sign up if you are a new user

## Clean Architecture

Clean Architecture is a software design philosophy that separates the concerns of an application into layers, each with a specific responsibility. The layers typically include:

1. **Presentation Layer**: Handles UI-related logic and interacts with the BLoC layer.
2. **Domain Layer**: Contains business logic, usecase,entities .
3. **Data Layer**: Manages data access, including interactions with local and remote data sources.

The separation of concerns makes the codebase modular, scalable, and easy to maintain. Clean Architecture promotes testability and allows for the flexibility to change one layer without affecting others.

## Code Pattern: BLoC

BLoC is a state management pattern widely used in Flutter applications. It stands for Business Logic Component and separates the presentation layer from the business logic. Key components of the BLoC pattern include:

- **BLoC**: Manages the state of the application and contains business logic.
- **States**: Represent the state of the UI at a specific point in time.

BLoC simplifies the UI by removing business logic, making the application more modular and testable. It also provides a clear separation between the UI and business logic.

## Libraries Used

- **firebase**: Storing Authentication
- **flutter_bloc** : For state management
- **get_it**: A service locator for dependency injection, facilitating the management of object instances.
- **dartz**:Type class instances for included types, as well as for several standard Dart types

## Getting Started

Follow these instructions to get a copy of the project up and running on your local machine.

### Prerequisites

- Flutter installed on your machine ([Installation Guide](https://flutter.dev/docs/get-started/install))
- Emulator or physical device for testing

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/zahra-choksi/login_app.git
2. Change into the project directory:

   ```bash
    cd login_app
3. Install dependencies:

    ```bash
    flutter pub get
4. Run the app:

    ```bash
   flutter run
