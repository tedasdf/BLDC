# Brushless Permanent Magnet Motor (BLPMM) Modeling

This repository contains a modeling script for simulating the behavior and performance of a Brushless Permanent Magnet Motor (BLPMM), based on concepts and equations from the reference document:

> [Brushless Permanent Magnet Motor Design (v2) - Avislab](https://blog.avislab.com/uploads/2014/05/BrushlessPermanentMagnetMotorDesignVersion2.pdf)

## 📘 Reference

The PDF by Avislab provides a comprehensive overview of the design process for a BLPMM, including:

- Motor geometry (rotor/stator dimensions, air gap, etc.)
- Magnetic circuit modeling
- Slot and winding design
- Back EMF calculation
- Torque estimation
- Finite element method (FEM) approximations

## 📂 Project Structure
model_blpmm/
├── main.py # Main script to run the simulation
├── motor_parameters.py # Motor configuration and design parameters
├── magnetic_model.py # Magnetic circuit computations
├── torque_model.py # Torque computation
├── plots.py # Visualizations (EMF, torque, flux)
├── README.md # This file


## 🧠 Goals

- Implement an analytical model of a surface-mounted BLPMM
- Calculate flux density, inductance, EMF, and torque
- Allow parameter sweeping (pole pairs, winding configuration, etc.)
- Visualize results for validation



## 📖 Progress

Reading progress from the Avislab PDF:

- **Pages read:** `52 / 411`
- **Page per day** `3x0 pages`

---

## ⚙️ Tools Required

- MATLAB R2020a or later
- `.mlx` Live Script support
- (Optional) Symbolic Math Toolbox for analytical expressions

---

## 🗒️ Notes

This is a study-focused implementation. Accuracy and results should be validated through FEM tools or experimental data for practical applications.