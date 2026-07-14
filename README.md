<div align="center">

# 📡 Tarassul — Syrian Telecom Companion App

### A feature-first Flutter application for managing telecom subscriptions, billing, and self-service operations

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Architecture](https://img.shields.io/badge/Architecture-Feature--First-orange?style=for-the-badge)
![RTL](https://img.shields.io/badge/RTL-Arabic%20Support-green?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-In%20Development-yellow?style=for-the-badge)

</div>

---

## 📖 Overview

**Tarassul** (package name `tarassul_new`) is a Flutter mobile application built for **Syrian Telecom (السورية للاتصالات)** subscribers, giving them a single, RTL-first interface to check their subscription status, monitor data package usage, review billing history, look up available network ports, purchase extra data, manage their password, and reach customer support. The app is structured using a **feature-first folder layout** with a clear separation between routing, theming, and reusable UI infrastructure in `core/`, and self-contained business features under `feature/`. All screens are built with native Flutter widgets and `setState`-based state management, making the codebase lightweight, dependency-free, and easy to reason about.

---



## ✨ Features

### 🔐 Authentication
- Login screen with subscriber number and password fields
- Client-side form validation (required fields, minimum password length, email format via regex)
- Password visibility toggle (show/hide)
- Loading state on the login button during the (simulated) authentication call
- "Forgot password" flow with a dedicated screen, email validation, and a simulated reset-link request with success feedback via `SnackBar`
- Centralized Arabic validation messages (`LoginValidators`)

### 🏠 Home Dashboard
- Subscriber information card: name, subscriber number, registration date, charge type (prepaid/postpaid), fixed address, and a color-coded status badge (active / suspended / other)
- Active data package card with:
  - Circular progress indicator showing percentage of data consumed
  - Color escalation to a warning/error tone once usage passes 85%
  - Package size, remaining data, and expiry date rows
- Custom gradient app bar with company branding and an end-drawer trigger

### 🧭 Navigation & Sidebar
- Custom `Drawer`-based side menu (`SideBar`) with a branded gradient header and app version footer
- Expandable/collapsible "Self-Service" section (`AnimatedRotation` + `AnimatedSize`) grouping related sub-features
- Direct navigation entries for Bill Inquiry, Available Ports, Contact Us, About, and Logout

### 🧾 Main Services
- **Bill Inquiry** — list of past invoices with month, amount (SYP), and a paid/due status chip
- **Available Ports** — searchable list of network exchanges/areas with live filtering and an availability badge (available count / full)
- **Contact Us** — hotline, email, and headquarters address as tappable tiles, plus social media shortcut buttons
- **About** — company description, app version, and placeholder links for Terms of Use and Privacy Policy

### ⚙️ Self-Service
- **Usage History** — chronological list of data/call usage entries with icons and formatted values
- **Buy Extra Data** — selectable list of data package options with a dynamic "Buy X GB for Y SYP" confirmation button
- **Change Password** — current/new/confirm password form with matching-password validation and success feedback

### 🎨 Design System
- Centralized color palette (`AppColors`) covering primary/secondary brand colors, neutral grayscale, status colors, gradients, and shadows
- Centralized typography scale (`AppTextStyles`) covering display, headline, title, body, and label text styles
- Custom `Tajawal` font family applied app-wide for proper Arabic typography
- Full right-to-left (RTL) layout support across all screens using explicit `TextDirection.rtl`

---

## 🛠️ Tech Stack

| Category | Details |
|---|---|
| **Language** | Dart |
| **Framework** | Flutter (Material) |
| **Architecture** | Feature-first, layered `presentation` structure |
| **State Management** | Native `StatefulWidget` / `setState` |
| **Navigation** | Named routes via a centralized `onGenerateRoute` router |
| **Theming** | Centralized color & text-style constants (`core/theme`) |
| **Networking** | Not yet implemented (all data is currently mocked/local) |
| **Packages** | None beyond the Flutter SDK — no third-party dependencies are imported anywhere in `lib/` |

> Only `package:flutter/material.dart` is imported across the entire codebase; no external pub.dev packages, HTTP clients, or state-management libraries are currently wired in.

---

## 🏗️ Architecture

The project follows a **feature-first** organization rather than a strict Clean Architecture split into `data` / `domain` / `presentation` layers:

- **`core/`** — cross-cutting, app-wide concerns shared by every feature: routing, theme (colors + text styles), and reusable widgets (e.g. the secondary app bar).
- **`feature/<name>/presentation/`** — each business feature (`auth`, `home`, `splash`) contains its own `screens/` and `widgets/` folders. There is currently **no `data/` or `domain/` layer** — screens hold their own mock data and simulated async calls (`Future.delayed`) directly, with `// TODO` comments marking where a real repository/Bloc call is meant to be wired in later.
- **Routing** is centralized in a single `AppRouter` using `onGenerateRoute`, with route names declared as constants in `AppRoutes` — avoiding magic strings scattered across the codebase.
- **Component reuse** — the `LoginTextField` and `LoginButton` widgets are reused across the login and forgot-password screens; `SecondaryAppBar` is reused across every secondary screen (bills, ports, contact, about, self-service).

> **Note on partial implementation:** the `feature/splash/presentation/widgets/` directory contains a `button/`, `textfield/`, and `validators/` subfolder that duplicate the ones under `feature/auth/`. These files exist in the source tree but are **not imported or referenced anywhere** in the app — they appear to be leftover/unused duplicates from an earlier iteration of the splash or auth flow.

---

## 📂 Folder Structure

```
lib/
├── main.dart                                  # App entry point
├── app.dart                                   # MaterialApp setup, theme & initial route
│
├── core/
│   ├── routing/
│   │   └── app_routes.dart                    # AppRoutes constants + AppRouter (onGenerateRoute)
│   ├── theme/
│   │   ├── colors/
│   │   │   └── app_colors.dart                # Centralized color palette
│   │   └── styles/
│   │       └── app_text_style.dart            # Centralized typography scale
│   └── widgets/
│       └── secondappbar/
│           └── second_app_bar.dart             # Reusable gradient app bar for inner screens
│
└── feature/
    ├── auth/
    │   └── presentation/
    │       ├── helpers/validators/
    │       │   └── auth_validators.dart         # LoginValidators (number/password/email)
    │       ├── screens/
    │       │   ├── login/login_screen.dart
    │       │   └── forgotpassword/forgot_password_screen.dart
    │       └── widgets/
    │           ├── button/button.dart            # LoginButton
    │           └── textfield/text_field.dart      # LoginTextField
    │
    ├── home/
    │   └── presentation/
    │       ├── screens/
    │       │   ├── home_screen.dart
    │       │   ├── main-service/
    │       │   │   ├── about_screen.dart
    │       │   │   ├── available_ports_screen.dart
    │       │   │   ├── bill_inquiry_screen.dart
    │       │   │   └── contact_us_screen.dart
    │       │   └── self-service/
    │       │       ├── buy_extra_data_screen.dart
    │       │       ├── change_password_screen.dart
    │       │       └── usage_history_screen.dart
    │       └── widgets/
    │           ├── appbar/custom_app_bar.dart
    │           ├── appbody/app_body.dart          # Subscriber info + package usage cards
    │           └── sidebar/side_bar.dart          # Drawer navigation menu
    │
    └── splash/
        └── presentation/
            ├── screens/
            │   └── splash_screen.dart
            └── widgets/                          # Unused/duplicate widgets (see Architecture note)
                ├── button/button.dart
                ├── textfield/text_field.dart
                └── validators/auth_validators.dart
```

---

## 🧠 State Management

The app relies entirely on Flutter's built-in state primitives — there is **no Bloc, Cubit, Provider, Riverpod, or GetX** in the codebase:

- Screens with local, transient state (loading spinners, form input, selection state, search queries, drawer expansion) use `StatefulWidget` + `setState`, for example:
  - `LoginScreen` and `ChangePasswordScreen` toggle `_isLoading` while awaiting a simulated async operation.
  - `AvailablePortsScreen` filters a local list reactively as the user types in a search field.
  - `BuyExtraDataScreen` tracks the selected data package index.
  - `_DrawerExpansionItem` inside `SideBar` manages its own expand/collapse animation state.
- Screens that are purely presentational and stateless (`HomeScreen`, `AppBody`, `AboutScreen`, `BillinquiryScreen`, `ContactUsScreen`, `UsageHistoryScreen`) are implemented as `StatelessWidget`s that currently receive mock/default data through constructor parameters or hardcoded local lists.
- There is no dependency injection container or service locator (e.g. `get_it`) — widgets are constructed directly by the router.

---

## 🌟 Project Highlights

- **Centralized design tokens** — every color and text style used in the UI flows through `AppColors` and `AppTextStyles`, so the entire visual language can be restyled from two files.
- **Centralized routing table** — all navigation targets are named constants in `AppRoutes`, resolved through a single `AppRouter.generateRoute` switch statement, including a graceful fallback `_NotFoundScreen` for unmatched routes.
- **Consistent RTL-first UI** — nearly every `Row`, `Column`, and `Text` widget explicitly sets `TextDirection.rtl`, reflecting a deliberate, consistent approach to Arabic-language UX rather than relying solely on `Directionality` inheritance.
- **Reusable secondary app bar** — `SecondaryAppBar` (a custom `PreferredSizeWidget`) is shared across five different screens (bills, ports, contact, about, self-service), keeping the header UI perfectly consistent without duplication.
- **Componentized cards** — the home dashboard splits complex UI into small private widgets (`_SubscriberInfoCard`, `_PackageCard`, `_StatusBadge`, `_InfoRow`) which improves readability and testability of a otherwise dense screen.
- **Defensive image loading** — `Image.asset('assets/images/logo.png', ...)` calls consistently provide an `errorBuilder` fallback icon, so a missing asset never crashes the UI.

---

## 🧩 Reusable Components

| Component | Location | Used In |
|---|---|---|
| `SecondaryAppBar` | `core/widgets/secondappbar` | About, Available Ports, Bill Inquiry, Contact Us, Buy Extra Data, Change Password, Usage History |
| `LoginTextField` | `feature/auth/presentation/widgets/textfield` | Login, Forgot Password |
| `LoginButton` | `feature/auth/presentation/widgets/button` | Login |
| `AppColors` | `core/theme/colors` | Every screen and widget in the app |
| `AppTextStyles` | `core/theme/styles` | Every screen and widget in the app |

---

## 🎨 UI/UX

- **Custom gradient app bars** with rounded bottom corners and soft drop shadows for both the home screen (`CustomAppBar`) and inner screens (`SecondaryAppBar`)
- **RTL-first layout** across all forms, lists, and cards, matching the target Arabic-speaking audience
- **Status-driven color coding** — subscriber status, bill status, and port availability all map to semantic colors (`success`, `warning`, `error`) instead of hardcoded values
- **Micro-animations** — `AnimatedRotation` for the drawer's expand/collapse chevron and `AnimatedSize` for smoothly revealing sub-items
- **Circular data-usage gauge** built with `CircularProgressIndicator`, dynamically recoloring when usage crosses an 85% threshold
- **Consistent card styling** — rounded corners (typically 12–20px radius) and soft `BoxShadow` elevation used uniformly across bill, port, package, and usage-history cards
- **Custom typeface** — the `Tajawal` font family is applied app-wide via `ThemeData(fontFamily: 'Tajawal')` for proper Arabic glyph rendering

---

## 📦 Packages Used

| Package | Purpose |
|---|---|
| _None_ | The project currently has no third-party dependencies — every screen and widget is built with the Flutter SDK's `material` library only. |

---

## 🚀 Getting Started

### Prerequisites
Make sure you have the Flutter SDK installed and configured:

```bash
flutter doctor
```

### Installation

```bash
# Clone the repository
git clone <repository-url>
cd tarassul_new

# Install dependencies
flutter pub get

# Run the app
flutter run
```

> This README documents the `lib/` source tree only. A valid `pubspec.yaml` (declaring the app name, the `Tajawal` font assets, and the `assets/images/logo.png` asset referenced throughout the UI) is required for the project to build.

---

## 📋 Requirements

- **Flutter SDK**: compatible with a recent stable channel (project uses standard, non-deprecated Material widgets)
- **Dart SDK**: bundled with the Flutter SDK
- **Assets**: `assets/images/logo.png` and the `Tajawal` font family must be registered in `pubspec.yaml` for the branding and Arabic typography to render as designed

---

## 🔭 Future Improvements

- Introduce a proper `data`/`domain` layer (repositories, models, API/local-storage services) to replace the hardcoded mock lists currently embedded in screens like `BillinquiryScreen`, `UsageHistoryScreen`, and `AvailablePortsScreen`
- Adopt a state-management solution (e.g. Bloc/Cubit or Riverpod) to move business logic out of widget classes, especially for the login, password-reset, and password-change flows currently using `Future.delayed` placeholders
- Wire up the `TODO`-marked actions: real authentication call, dialer/mail/maps launching from the Contact Us screen, and Terms/Privacy navigation from the About screen
- Remove the unused duplicate widgets under `feature/splash/presentation/widgets/` or consolidate them with the `auth` versions
- Add automated tests (widget and unit tests) — none are present in the current `lib/` tree
- Persist authentication state (e.g. secure storage) instead of the hardcoded `isLoggedIn = false` flag in `SplashScreen`

---



<div align="center">

⭐ If you found this project interesting, consider giving it a star!

</div>
