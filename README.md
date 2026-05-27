# Flutter E-Commerce App
[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B.svg)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.0+-0175C2.svg)](https://dart.dev/)
[![Flutter_BLoC](https://img.shields.io/badge/flutter__bloc-8.1.3-blue.svg)](https://pub.dev/packages/flutter_bloc)
[![Dio](https://img.shields.io/badge/dio-5.3.3-orange.svg)](https://pub.dev/packages/dio)
[![GetX](https://img.shields.io/badge/get-4.6.6-purple.svg)](https://pub.dev/packages/get)
[![Equatable](https://img.shields.io/badge/equatable-2.0.5-red.svg)](https://pub.dev/packages/equatable)
[![Dartz](https://img.shields.io/badge/dartz-0.10.1-green.svg)](https://pub.dev/packages/dartz)

A Flutter-based e-commerce application developed as part of a technical assessment for a software engineering role.

The project demonstrates mobile application architecture, API integration, state management, cart functionality, authentication flow, and responsive UI development using Flutter.
---

# Features
- Product listing and browsing
- Product details screen
- Shopping cart functionality
- Add-to-cart logic
- Cart state management
- RESTful API integration
- Error handling and failure states
- Responsive mobile UI
- Offline/mock-data fallback support
---

# Screenshots

## Home Page
<img width="1080" height="1920" alt="Screenshot_1779920597" src="https://github.com/user-attachments/assets/f4eb5793-9716-43cd-8aa2-fff9a0a970dc" />


---

## Product Details
<img width="1080" height="1920" alt="Screenshot_1779920702" src="https://github.com/user-attachments/assets/4843ed22-3009-4bf3-b35d-989b5e1918bb" />

---

## Shopping Cart
<img width="1080" height="1920" alt="Screenshot_1779920582" src="https://github.com/user-attachments/assets/03823002-69af-43af-a8a3-b4de215c3599" />


---

# Technologies Used

## Flutter & Dart

The application was developed using Flutter and Dart for cross-platform mobile development.

## BLoC State Management

Used Flutter BLoC for:
- state separation
- business logic handling
- UI state synchronization
- scalable architecture

## RESTful API Integration

Used Dio HTTP client for:
- API requests
- JSON parsing
- error handling
- networking abstraction

## Repository Pattern

Implemented repository-based architecture to separate:
- API layer
- business logic
- presentation layer

## Equatable

Used Equatable for efficient state comparison inside BLoC states and events.

## Functional Error Handling

Used Dartz (`Either`, `Left`, `Right`) for predictable failure handling and cleaner asynchronous flows.

## Responsive UI

Used Sizer package for responsive layouts across different screen sizes.

---

# Project Structure

# Project Structure

```text
lib/
│
├── API/
│   └── API endpoints and request handling
│
├── componenets/
│   └── shared/reusable UI components
│
├── features/
│   └── feature-based modules
│       ├── [feature]/
│       │   ├── bloc/
│       │   │   └── events, states, and BLoC logic
│       │   └── page / UI implementation
│
├── model/
│   └── product, cart, and shared data models
│
├── utils/
│   └── error handling, failures, exceptions, and network helpers
│
├── view/
│   └── shared app views / screen-level UI
│
└── main.dart
```

---

# Notes

This project was originally developed as part of a technical assessment and later maintained as a portfolio project to showcase Flutter development skills, application architecture, and mobile UI implementation.

The backend service used during development is no longer available, so local mock data fallback support was added for demonstration purposes.
