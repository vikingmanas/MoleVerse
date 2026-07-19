<div align="center">

# 🧪 MOLEVERSE  
### *Explore Chemistry in 3D.*

🏆 **Winner of the Apple Swift Student Challenge 2026** 🏆

![Platform](https://img.shields.io/badge/Platform-iOS_%7C_iPadOS-black?style=for-the-badge&logo=apple)
![Language](https://img.shields.io/badge/Language-Swift_6-orange?style=for-the-badge&logo=swift)
![3D Engine](https://img.shields.io/badge/3D_Engine-RealityKit-blue?style=for-the-badge)
![Simulations](https://img.shields.io/badge/Simulations-Nuclear_Physics-red?style=for-the-badge)
![Architecture](https://img.shields.io/badge/Architecture-Modular-purple?style=for-the-badge)
![Award](https://img.shields.io/badge/Award-SSC_2026_Winner-FFD700?style=for-the-badge&logo=apple)

---

> ⚛️ Turn flat chemical formulas into immersive 3D experiences  
> ☢️ Dive into interactive nuclear physics simulations  
> 🧠 Learn chemistry through interaction — not memorization  

</div>

---

## 🌍 About MoleVerse

**MoleVerse** is an award-winning interactive 3D chemistry and physics learning application. It was recognized globally as a **Winner of the Apple Swift Student Challenge 2026**.

Chemistry and physics concepts such as molecular geometry, bonding, and nuclear reactions often feel abstract and difficult to grasp because they cannot be seen. MoleVerse solves this problem by:

- Transforming flat chemical formulas into real-time, interactive 3D models using **RealityKit**.
- Visualizing atomic bonds, spatial geometry, and VSEPR theory dynamically.
- Providing 6 interactive nuclear physics simulations (Fission, Fusion, Decay, etc.).
- Integrating a simulated on-device "Quantum Analysis" for predicting molecular properties.
- Utilizing CoreMotion for parallax 3D views and CoreHaptics for multi-sensory feedback.

---

## ⚛️ Core Features

### 🧪 Interactive 3D Molecular Lab
- **RealityKit 3D Engine**: Real-time orbital rotation, zooming, and dynamic lighting.
- **50+ Preloaded Molecules**: Spanning Organic (Alkanes, Alkenes, Alkynes, Alcohols, Aromatics) and Inorganic families. 
- **118 Elements**: Contains a full database of the periodic table elements with rich data.
- **Device Motion Integration**: CoreMotion-powered parallax effects — tilt your iPad to look around the molecule.
- **Detailed Insights**: View synthesis routes, molar mass, bond energies, hybridization, and historical context.

### ☢️ Nuclear Physics Lab
6 highly interactive, gamified physics simulations with custom Canvas-based particle systems and haptic feedback:
1. **Nuclear Fission**: Visualize U-235 splitting and neutron emission.
2. **Nuclear Fusion**: Combine Deuterium and Tritium to form Helium.
3. **Alpha & Beta Decay**: Watch isotopic transmutation in real-time.
4. **Antimatter Annihilation**: Collide electrons and positrons to visualize mass-to-energy conversion.
5. **Reactor Manager Game**: A real-time mini-game where you balance control rods and coolant flow to prevent core meltdowns.

### 🧠 "Quantum Analysis"
- Simulated on-device analysis engine that calculates molecular stability, polarity, and reactivity.
- Gives the feel of an advanced AI chemistry tutor analyzing properties directly on your device.

### 📳 Multi-Sensory & Accessible
- **CoreHaptics**: Feel bond stretching, orbital rotations, and nuclear explosions directly in your hands.
- **AVFoundation**: Ambient drone soundscapes and dynamic audio effects based on interactions.
- Fully accessible with VoiceOver labels and 'Reduce Motion' compliance.

---

## 🧱 Architecture

MoleVerse follows a clean, feature-driven, and layered architecture leveraging modern Swift 6 features like Actors and strict concurrency.

```text
MoleVerse/
│
├── Models/      → Data models, Elements, and the rich 150KB+ Molecule Database
├── Views/       → SwiftUI interface organized by features (MoleculeDetail, Nuclear, Components)
├── Services/    → Thread-safe Singletons and Actors (Audio, Haptic, Motion, QuantumModel)
├── Utils/       → Centralized Design System (Colors, Typography, Animations, Glassmorphism)
```

- **Strict Concurrency**: Uses Swift 6 `@MainActor` and `actor` paradigms for thread-safe state management (e.g., `QuantumModelService`).
- **Declarative UI**: Deep integration of SwiftUI with custom ViewModifiers for a consistent "Dark Glassmorphism" aesthetic.

---

## 🛠️ Tech Stack

```yaml
Language: Swift 6
UI Framework: SwiftUI
3D Engine: RealityKit
Concurrency: async/await, Actors, @MainActor
Sensors & Feedback: CoreMotion, CoreHaptics, AVFoundation
Target Platform: iOS/iPadOS 17+
```

---

## 🚀 Getting Started

### 📌 Prerequisites

- macOS 14.0 or later
- Xcode 15.0 or later (Tested on Xcode 16 / Swift 6)
- iOS / iPadOS 17+ Simulator (Physical device highly recommended for Haptics & Motion)

### 📦 Installation

```bash
git clone https://github.com/ManasDu/MoleVerse.git
cd MoleVerse
open Package.swift # or MoleVerse.xcodeproj if generated
```

Run on an iPad simulator or physical device for optimal interaction.

---

## 💡 Why MoleVerse Matters

Students struggle with chemistry not because it is inherently difficult — but because it is invisible.

MoleVerse makes molecular structures and nuclear reactions:

- 👀 **Visible**  
- 🎮 **Interactive**  
- 📳 **Multi-Sensory**
- 🧠 **Understandable**  
- 📚 **Memorable**  

Learning shifts from passive memorization to active exploration.

---

<div align="center">

### 🧪 "If you can see it, you can understand it."

Built with passion by **Manas Dubey**

</div>
