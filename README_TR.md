# AMBO: Özellik Seçimi için Uyarlanabilir Memetik İkili Optimizasyon Algoritması

Bu depo, aşağıdaki makalede önerilen **AMBO (Adaptive Memetic Binary Optimization)** algoritmasının MATLAB implementasyonunu içermektedir:

> A. C. Çınar, *A novel adaptive memetic binary optimization algorithm for feature selection*, Artificial Intelligence Review, 2023. DOI: [10.1007/s10462-023-10482-8](https://doi.org/10.1007/s10462-023-10482-8)

## 📌 Proje Hakkında

AMBO, **özellik seçimi (feature selection)** için tasarlanmış özgün bir ikili meta-sezgisel algoritmadır. Şu yapı taşlarını içerir:
- **Uyarlanabilir çaprazlama mekanizmaları** (tek nokta, çift nokta, uniform)
- **Kanonik mutasyon**
- **Mantık kapılarına dayalı yerel arama** (`AND`, `OR`, `XOR`) ile keşif/sömürü dengesi

AMBO algoritması, **21 farklı veri kümesinde** test edilmiş ve BPSO, GA varyantları, BDA, BSSA, BGWO gibi literatürdeki pek çok algoritmadan üstün sonuçlar üretmiştir.

## 📂 Dosyalar

- `Main.m`: Ana çalışma dosyası
- `datasets/`: Makalede kullanılan örnek veri kümeleri
- `results/`: Sonuç dosyaları ve çıktı logları

## 🧪 Gereksinimler

- MATLAB R2021a veya üzeri
- KNN sınıflandırıcısı için Statistics and Machine Learning Toolbox

## 📈 Atıf

Bu kodu veya verileri çalışmanızda kullanırsanız, lütfen aşağıdaki yayına atıfta bulunun:

```
@article{cinar2023ambo,
  title={A novel adaptive memetic binary optimization algorithm for feature selection},
  author={Cinar, Ahmet Cevahir},
  journal={Artificial Intelligence Review},
  year={2023},
  doi={10.1007/s10462-023-10482-8}
}
```

## 🤝 İş Birliği

Katkılar, fikirler ve iş birliklerine açığım!

Proje geliştirmeleri, akademik iş birlikleri veya karşılaştırmalı çalışmalar için benimle iletişime geçebilirsiniz:

📧 E-posta: [ahmetcevahircinar@gmail.com](mailto:ahmetcevahircinar@gmail.com)  
🔗 LinkedIn: [Ahmet Cevahir Çınar](https://www.linkedin.com/in/ahmet-cevahir-cinar/)
