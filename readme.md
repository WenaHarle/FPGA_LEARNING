### **1. Flip-Flop SR (Set-Reset)**
   - **Komponen utama**: NAND atau NOR gates
   - **Fungsi**: Menyimpan satu bit data (1 atau 0)
   - **Prinsip kerja**: Menggunakan umpan balik untuk mempertahankan status sebelumnya

   **Contoh:**
   - Jika **S = 1, R = 0**, output **Q = 1** (set).
   - Jika **S = 0, R = 1**, output **Q = 0** (reset).
   - Jika **S = 0, R = 0**, kondisi tidak stabil (tidak digunakan).

---

### **2. Flip-Flop D (Data)**
   - **Komponen utama**: Flip-Flop SR dengan tambahan inverter pada input R
   - **Fungsi**: Menyimpan satu bit data, tetapi hanya berubah pada sinyal clock
   - **Prinsip kerja**: Ketika clock aktif, output **Q** mengikuti input **D**.

   **Contoh:**
   - Jika **D = 1** pada tepi naik clock, maka **Q = 1**.
   - Jika **D = 0** pada tepi naik clock, maka **Q = 0**.

---

### **3. Flip-Flop JK**
   - **Komponen utama**: Flip-Flop SR dengan mekanisme toggling
   - **Fungsi**: Mengatasi kondisi tidak stabil pada SR
   - **Prinsip kerja**:
     - **J = 0, K = 0** → Q tetap.
     - **J = 0, K = 1** → Reset (Q = 0).
     - **J = 1, K = 0** → Set (Q = 1).
     - **J = 1, K = 1** → Toggle (Q berubah dari 0 ke 1 atau sebaliknya).

---

### **4. Flip-Flop T (Toggle)**
   - **Komponen utama**: Flip-Flop JK dengan J = K = 1
   - **Fungsi**: Berfungsi sebagai pembagi frekuensi atau penghitung biner
   - **Prinsip kerja**: Setiap kali clock aktif, output Q berubah (toggle).

---

### **5. Pencacah (Counter)**
   - **Komponen utama**: Rangkaian Flip-Flop T atau JK
   - **Fungsi**: Menghitung jumlah pulsa clock dalam biner
   - **Jenis**:
     - **Counter Sinkron** → Semua flip-flop dipicu oleh clock yang sama.
     - **Counter Asinkron** → Flip-flop dipicu secara berantai.

---

### **6. Register Geser (Shift Register)**
   - **Komponen utama**: Flip-Flop D berantai
   - **Fungsi**: Memindahkan data secara serial atau paralel
   - **Jenis**:
     - **SISO (Serial In Serial Out)**.
     - **SIPO (Serial In Parallel Out)**.
     - **PISO (Parallel In Serial Out)**.
     - **PIPO (Parallel In Parallel Out)**.

---

### **7. Mesin Status (Finite State Machine - FSM)**
   - **Komponen utama**: Register, Flip-Flop, Gerbang Logika
   - **Fungsi**: Mengontrol sistem berdasarkan input saat ini dan status sebelumnya
   - **Jenis**:
     - **Moore Machine** → Output hanya bergantung pada state saat ini.
     - **Mealy Machine** → Output bergantung pada state dan input.

---

Semakin kompleks, rangkaian ini dapat digunakan dalam prosesor, sistem kendali robot, dan komunikasi digital. Mau coba implementasi salah satunya? 🚀
