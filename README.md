# 📐 Coordinate Converter

A Flutter application that converts coordinates between the three most common 3D coordinate systems:

- Cartesian Coordinates
- Spherical Coordinates
- Cylindrical Coordinates

The application provides an intuitive interface for entering coordinates, performing instant conversions, and displaying the equivalent coordinates in all supported systems.

---

## 📸 Screenshots

| Home | Cartesian |
|------|-----------|
| <img src="screenshots/home_view.png" width="280"/> | <img src="screenshots/display_cart.png" width="280"/> |

| Cartesian Conversion | Cylindrical |
|----------------------|-------------|
| <img src="screenshots/convert_from_cart.png" width="280"/> | <img src="screenshots/display_cyl.png" width="280"/> |

| Cylindrical Conversion | Spherical |
|------------------------|-----------|
| <img src="screenshots/convert_from_cycl.png" width="280"/> | <img src="screenshots/display_sphe.png" width="280"/> |

| Spherical Conversion |
|----------------------|
| <img src="screenshots/convert_from_sphe.png" width="280"/> |

---

# ✨ Features

- Convert Cartesian coordinates.
- Convert Spherical coordinates.
- Convert Cylindrical coordinates.
- Instant conversion between all coordinate systems.
- Mathematical calculations implemented manually.
- Clean and responsive UI.
- Modular project architecture.
- Null-safe Dart code.

---

# 📚 Coordinate Systems

## Cartesian

Represents a point using

```
(x, y, z)
```

---

## Cylindrical

Represents a point using

```
(ρ, φ, z)
```

where

- ρ → Distance from Z-axis
- φ → Angle in degrees
- z → Height

---

## Spherical

Represents a point using

```
(r, θ, φ)
```

where

- r → Distance from origin
- θ → Polar angle
- φ → Azimuth angle

---

# 🧮 Mathematical Formulas

## Cartesian → Spherical

```
r = √(x² + y² + z²)

θ = arccos(z / r)

φ = atan2(y, x)
```

---

## Cartesian → Cylindrical

```
ρ = √(x² + y²)

φ = atan2(y, x)

z = z
```

---

## Cylindrical → Cartesian

```
x = ρ cos φ

y = ρ sin φ

z = z
```

---

## Cylindrical → Spherical

```
r = √(ρ² + z²)

θ = atan2(ρ, z)

φ = φ
```

---

## Spherical → Cartesian

```
x = r sinθ cosφ

y = r sinθ sinφ

z = r cosθ
```

---

## Spherical → Cylindrical

```
ρ = r sinθ

φ = φ

z = r cosθ
```

---

# 🏗️ Project Structure

```
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

Go to the project

```bash
cd coordinate_converter
```

Install dependencies

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

# 📦 Packages

This project only uses Flutter SDK packages.

No external state management or third-party conversion libraries were used.

---

# 🎯 Future Improvements

- Dark / Light Theme
- Conversion History
- Copy Result Button
- Input Validation
- Unit Tests
- Landscape Layout
- Responsive Desktop UI
- Animations

---

# 👨‍💻 Author

**Muhammad Khiry**

Computer and Systems Engineering Student

GitHub:
https://github.com/Muhammadkhiry

---

# ⭐ Support

If you like this project, consider giving it a ⭐ on GitHub.