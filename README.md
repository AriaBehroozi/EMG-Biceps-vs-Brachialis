# 💪 EMG Comparison of Biceps Brachii vs Brachialis During Curl Variations

## 📌 Overview
This repository provides MATLAB code for analyzing surface EMG signals of the **biceps brachii** and **brachialis** during two common strength exercises:
- **Biceps Curl**
- **Hammer Curl**

The workflow includes **band-pass filtering, rectification, RMS calculation, MVC normalization, and plotting** to compare relative activation between muscles. This approach is widely used in biomechanics and exercise science to study neuromuscular strategies during resistance training.

---

## ⚙️ Features
- Import EMG data from Excel files
- Apply **band-pass filtering** (20–500 Hz, Butterworth)
- Compute **RMS EMG** with moving window
- Normalize signals to **Maximum Voluntary Contraction (MVC)**
- Plot activation curves for:
  - Biceps curl (biceps vs brachialis)
  - Hammer curl (biceps vs brachialis)

---

## 📊 Example Outputs
- **Normalized EMG during biceps curl** (%MVC for each muscle)  
- **Normalized EMG during hammer curl** (%MVC for each muscle)  

Plots clearly show the relative contributions of biceps vs brachialis depending on exercise style.

---

## 📂 Repository Structure
├── muscle_activation_comparison.m # Main MATLAB script
├── biceps_mvc.exc.xlsx # Example MVC data (biceps)
├── br_mvc_exc.xlsx # Example MVC data (brachialis)
├── bicep_curl.exc.xlsx # Example exercise trial (curl)
├── br_curl.exc.xlsx # Example exercise trial (hammer curl)
└── README.md # Documentation
---

## 🔧 Usage
1. Place your EMG `.xlsx` files in the repo folder.  
2. Open MATLAB and run:
   ```matlab
   muscle_activation_comparison

   ---

## 🔧 Usage
1. Place your EMG `.xlsx` files in the repo folder.  
2. Open MATLAB and run:
   ```matlab
   muscle_activation_comparison
The script will output:

RMS-normalized activation curves

Comparative plots (%MVC) for each muscle and exercise

📚 References
De Luca CJ. (1997). The use of surface electromyography in biomechanics. J Appl Biomech, 13(2), 135–163.

Enoka RM. (2008). Neuromechanics of Human Movement (4th ed.). Human Kinetics.

Vigotsky AD et al. (2018). Interpreting signal amplitudes in surface EMG. Eur J Appl Physiol, 118, 511–518.


