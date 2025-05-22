
# validators_and_input_formatters

A lightweight and customizable Flutter package that provides a set of **form validators** and **input formatters** to make form handling cleaner and more efficient.

## ✨ Features

✅ Ready-to-use validators for:
- Required fields
- Email address
- Full name
- Mobile number
- Password & Confirm password
- PIN code
- Integer numbers with range support

✅ Input formatters for:
- Credit card numbers
- Lowercase text
- Decimal numbers (custom decimal precision)

## 📦 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  validators_and_input_formatters: ^0.0.1
```

Then run:

```bash
flutter pub get
```

## 🚀 Usage

### ✅ Validators

```dart
TextFormField(
  validator: (val) => CustomValidators.emailValidation(val),
)
```

### Confirm Password Example

```dart
TextFormField(
  validator: (val) => CustomValidators.confirmPasswordValidation(
    val,
    passwordController.text,
  ),
)
```

### ✅ Input Formatters

#### Credit Card Formatter

```dart
TextFormField(
  inputFormatters: [CreditCardNumberInputFormatter()],
)
```

#### Lowercase Formatter

```dart
TextFormField(
  inputFormatters: [LowerCaseTextFormatter()],
)
```

#### Decimal Number Formatter

```dart
TextFormField(
  inputFormatters: [DecimalNumberInputFormatter(decimalRange: 2)],
)
```

## 📂 Contents

- `CustomValidators`: All reusable form field validation functions.
- `CreditCardNumberInputFormatter`: Formats numbers as credit card layout.
- `LowerCaseTextFormatter`: Automatically converts text to lowercase.
- `DecimalNumberInputFormatter`: Restricts input to decimals with a fixed number of places.

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

Made with ❤️by Manish Talreja for clean forms.
