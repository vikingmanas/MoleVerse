<div align="center">

# 🧪 MOLEVERSE
### Explore Chemistry in 3D

🏆 **Winner — Apple Swift Student Challenge 2026**
### Top 350 Worldwide

**Interactive 3D Chemistry & Nuclear Physics Learning App**

</div>

---

## 🌍 About

**MoleVerse** is a native iOS/iPadOS educational app that transforms abstract
chemistry and physics concepts into interactive experiences.

It was built to make concepts like **molecular geometry, bonding, and nuclear
reactions easier to visualize and explore** rather than simply memorize.

---

## ✨ Features

### 🧪 Molecular Lab
- Interactive **3D molecules** using RealityKit
- **50+ molecules** across major chemical categories
- **118-element** periodic table
- Molecular geometry, bonding, hybridization, molar mass & synthesis information
- Device-motion based 3D parallax using CoreMotion

### ☢️ Nuclear Lab
Six interactive simulations covering:
- Nuclear Fission
- Nuclear Fusion
- Alpha Decay
- Beta Decay
- Antimatter Annihilation
- Reactor Management

### 🧠 Molecular Analysis
- On-device educational analysis of molecular **stability, polarity and reactivity**
- Implemented using a dedicated `QuantumModelService`
- Designed so the analysis engine can be extended with more advanced models

### 📳 Immersive Experience
- CoreHaptics for tactile feedback
- AVFoundation for interactive audio
- Canvas-based particle effects
- VoiceOver and Reduce Motion support

---

## 🛠️ Tech Stack

| Area | Technology |
|---|---|
| Language | Swift 6 |
| UI | SwiftUI |
| 3D | RealityKit |
| Concurrency | async/await, Actors, @MainActor |
| Motion | CoreMotion |
| Haptics | CoreHaptics |
| Audio | AVFoundation |
| Graphics | SwiftUI Canvas |

---

## 🏗️ Architecture

```text
MoleVerse/
├── Models/       → Molecules, atoms, bonds & element data
├── Views/        → SwiftUI UI organized by feature
├── Services/     → Audio, Haptic, Motion & Analysis services
├── Utils/        → Design system & reusable components
└── MyApp.swift   → Application entry point
