# Speak-Ace Application Blueprint

## 1. Overview

Speak-Ace is a personalized, AI-powered daily routine and life management application. It aims to go beyond a simple to-do list by understanding the user's goals, energy levels, and personal context to create adaptive routines, smart reminders, and provide motivational feedback. The app will be tailored to different user personas, such as students, professionals, and wellness enthusiasts, providing a unique and relevant experience for each.

## 2. Current State & Features

The application now features a complete, basic user onboarding flow, a dynamic, persona-based dashboard with a theme toggle, and an animated timeline with micro-animations.

- **UI/UX:**
  - A welcoming home screen that leads to persona selection.
  - A `PersonaSelectionScreen` where users can choose from one of four personas.
  - A `DashboardScreen` that dynamically displays content based on the user's persona.
  - A theme toggle in the `AppBar` allows users to switch between light and dark modes.
  - An animated timeline on the `DashboardScreen` with a fade-out animation for completed tasks.
  - `google_fonts` (`Lato`) are used for a consistent and clean typography.
- **Data Model & Backend:**
  - The `User` model in `lib/models/models.dart` includes a `persona` field.
  - The `DatabaseService` connects to MongoDB and has methods to save and retrieve user data.
- **Dynamic Dashboard:**
  - The `DashboardScreen` fetches the current user's persona.
  - Persona-specific widgets have been created in the `lib/widgets` directory.
  - The dashboard displays the appropriate widget based on the selected persona.

## 3. Implementation Roadmap

This roadmap breaks down the requested features into manageable phases.

### Phase 1: Core User Personas & UI/UX Foundation

- **Task 3: Role-based Dashboards (Dynamic Personas)**
  - **DONE:** All sub-tasks are complete.
- **Task 7: UI/UX Innovation**
  - **DONE:** Introduce `google_fonts` for better typography.
  - **DONE:** Implement a basic dynamic theme (Light/Dark mode).
  - **DONE:** Set up a basic animated timeline for the main dashboard.
  - **DONE:** Add micro-animations for task completion.

### Phase 2: Smart Routines & Scheduling

This phase will focus on integrating AI to generate personalized routines and managing life events.

- **Task 1: Smart Routine Intelligence**
  - **IN PROGRESS:** Integrate Gemini to generate personalized daily routines based on user persona.
  - Create a service to interact with the Gemini API.
  - Display the generated routine in the timeline.
- **Task 4: Integrated Life Events Hub**

### Phase 3: Gamification & AI Coaching

- **Task 5: Gamification & Motivation System**
- **Task 6: AI Assistant & Smart Insights**

### Phase 4: Advanced Reminders & Future Features

- **Task 2: Smart Alarm & Reminder System**
- **Task 8: Advanced Features (Future Vision)**

## 4. Current Step: Implement Smart Routine Intelligence

**Current Action:**
1.  **Next:** Begin integrating Gemini to generate personalized daily routines.
    - Add the necessary Firebase and Gemini packages to the project.
    - Initialize Firebase in the application.
    - Create an `AIService` to handle the logic for generating routines using the Gemini API.
    - The generated routine will then be displayed in the timeline on the `DashboardScreen`.
