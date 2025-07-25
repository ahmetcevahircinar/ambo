# AMBO: Adaptive Memetic Binary Optimization Algorithm for Feature Selection

This repository contains the official MATLAB implementation of the **AMBO (Adaptive Memetic Binary Optimization)** algorithm proposed in the paper:

> A. C. Çınar, *A novel adaptive memetic binary optimization algorithm for feature selection*, Artificial Intelligence Review, 2023. DOI: [10.1007/s10462-023-10482-8](https://doi.org/10.1007/s10462-023-10482-8)

## 📌 About the Project

AMBO is a pure binary metaheuristic algorithm specifically designed for feature selection tasks. It uses:
- **Adaptive crossover mechanisms** (single-point, double-point, uniform)
- **Canonical mutation**
- **Logic gate-based local search** using `AND`, `OR`, and `XOR` for balancing exploration and exploitation.

It has been tested on **21 benchmark datasets** and outperformed several state-of-the-art algorithms including BPSO, GA variants, BDA, BSSA, and BGWO.

## 📂 Files

- `main_AMBO.m`: Main script to run the algorithm.
- `datasets/`: Sample datasets used in the paper.
- `functions/`: Contains helper functions like crossover, mutation, logic-gate-based local search, etc.
- `results/`: Contains output logs and performance results.
- `figures/`: Includes sample convergence and boxplot figures from the paper.

## 🧪 Requirements

- MATLAB R2021a or later
- Statistics and Machine Learning Toolbox (for KNN)

## 📈 Citation

If you use this code or data in your research, please cite the paper as:

```
@article{cinar2023ambo,
  title={A novel adaptive memetic binary optimization algorithm for feature selection},
  author={Cinar, Ahmet Cevahir},
  journal={Artificial Intelligence Review},
  year={2023},
  doi={10.1007/s10462-023-10482-8}
}
```

## 🤝 Collaboration

Contributions, ideas, and collaborations are welcome!

Feel free to contact me for research partnerships, extensions, or comparative benchmarking:

📧 Email: [ahmetcevahircinar@gmail.com](mailto:ahmetcevahircinar@gmail.com)  
🔗 LinkedIn: [Ahmet Cevahir Çınar](https://www.linkedin.com/in/ahmet-cevahir-cinar/)
