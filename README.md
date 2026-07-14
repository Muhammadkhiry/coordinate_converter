# 📐 Coordinate Converter

<p align="center">
  <img src="assets/OIP.webp" width="180"/>
</p>

<h1 align="center">
Coordinate Converter
</h1>

<p align="center">
Convert between Cartesian, Cylindrical and Spherical Coordinate Systems using Flutter.
</p>

<p align="center">

![Flutter](https://img.shields.io/badge/Flutter-3.35-blue?logo=flutter)

![Dart](https://img.shields.io/badge/Dart-3.x-blue?logo=dart)

![Platform](https://img.shields.io/badge/Platform-Android-success)

![License](https://img.shields.io/badge/License-MIT-green)

</p>

---

# ✨ Overview

Coordinate Converter is a Flutter application that converts points between the three most common 3D coordinate systems.

The application performs all mathematical calculations manually without using external conversion libraries.

Supported systems:

- Cartesian Coordinates
- Cylindrical Coordinates
- Spherical Coordinates

---

# 📸 Screenshots

## 🏠 Home

<p align="center">
<img src="screenshots/home_view.png" width="300">
</p>

---

## 📍 Cartesian Coordinates

| Cartesian Input | Result |
|-------|--------|
| <img src="screenshots/display_cart.png" width="300"> | <img src="screenshots/convert_from_cart.png" width="300"> |

---

## 📍 Cylindrical Coordinates

| Cylindrical Input | Result |
|-------|--------|
| <img src="screenshots/display_cycl.png" width="300"> | <img src="screenshots/convert_from_cycl.png" width="300"> |

---

## 📍 Spherical Coordinates

| Spherical Input | Result |
|-------|--------|
| <img src="screenshots/display_sphe.png" width="300"> | <img src="screenshots/convert_from_sphe.png" width="300"> |

---

# ✨ Features

- Convert Cartesian coordinates.
- Convert Cylindrical coordinates.
- Convert Spherical coordinates.
- Instant conversion to all coordinate systems.
- Manual mathematical calculations.
- Responsive UI.
- Reusable Widgets.
- Clean Architecture.
- Null Safety.

---

# 🧮 Mathematical Formulas

## Cartesian → Spherical

```text
r = √(x² + y² + z²)

θ = arccos(z / r)

φ = atan2(y, x)
```

---

## Cartesian → Cylindrical

```text
ρ = √(x² + y²)

φ = atan2(y, x)

z = z
```

---

## Cylindrical → Cartesian

```text
x = ρ cosφ

y = ρ sinφ

z = z
```

---

## Cylindrical → Spherical

```text
r = √(ρ² + z²)

θ = atan2(ρ, z)

φ = φ
```

---

## Spherical → Cartesian

```text
x = r sinθ cosφ

y = r sinθ sinφ

z = r cosθ
```

---

## Spherical → Cylindrical

```text
ρ = r sinθ

φ = φ

z = r cosθ
```

---

# 📂 Project Structure

```text
lib
│
├── models
│   └── coordinate_result.dart
│
├── utils
│   ├── coordinate_converter.dart
│   └── coordinate_sys_enum.dart
│
├── views
│   └── converter_view.dart
│
├── widgets
│   ├── coordinate_input_field.dart
│   └── result_box.dart
│
└── main.dart
```

---

# 🚀 Getting Started

Clone the repository

```bash
git clone https://github.com/Muhammadkhiry/coordinate_converter.git
```

Move into the project

```bash
cd coordinate_converter
```

Install packages

```bash
flutter pub get
```

Run the application

```bash
flutter run
```

---

# 🛠️ Built With

- Flutter
- Dart
- Material Design

---

# 🔮 Future Improvements

- Dark Mode
- Conversion History
- Copy Result
- Responsive Desktop Layout
- Unit Testing
- Animations

---

# 👨‍💻 Author

**Muhammad Khiry**

Computer and Systems Engineering Student

GitHub

https://github.com/Muhammadkhiry

---

<p align="center">

⭐ If you found this project useful, don't forget to star the repository.

</p>