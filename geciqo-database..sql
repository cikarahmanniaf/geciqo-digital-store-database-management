CREATE DATABASE TUGAS_BESAR;
DROP DATABASE TUGAS_BESAR;
USE TUGAS_BESAR;

CREATE TABLE Produk(
    ID_Produk VARCHAR(10) PRIMARY KEY,
    Nama_Produk VARCHAR(50)
);
INSERT INTO Produk (ID_Produk, Nama_Produk) VALUES
	('ES0001', 'Handphone'),
	('ES0002', 'Laptop');
	
CREATE TABLE Supplier(
    ID_Supplier VARCHAR(15),
    Nama_Supplier VARCHAR(50),
    Nomor_Telepon VARCHAR(15),
    Email VARCHAR(50),
    PRIMARY KEY (ID_Supplier)
);
INSERT INTO Supplier (ID_Supplier, Nama_Supplier, Nomor_Telepon, Email) VALUES
  ('ES1-H-SP0001', 'Kalsa Triapsa', '081265789911', 'kalsatriapsa1@gmail.com'),
  ('ES1-H-SP0002', 'Dina Adina', '081275789912', 'dinaadina1@gmail.com'),
  ('ES1-H-SP0003', 'Dafi Sutri', '081285789913', 'dafisufi1@gmail.com'),
  ('ES2-L-SP0001', 'Danih Indah', '081298789102', 'danihindah1@gmail.com'),
  ('ES2-L-SP0002', 'Kafi Sadihi', '081178789103', 'kafisadihi1@gmail.com'),
  ('ES2-L-SP0003', 'Qonita Runi', '081278789104', 'qonitaruni1@gmail.com');
  
CREATE TABLE Gudang(
    ID_Gudang VARCHAR(5),
    Nama_Gudang VARCHAR(20),
    Alamat_Gudang VARCHAR(100),
    PRIMARY KEY (ID_Gudang)
);
INSERT INTO Gudang (ID_Gudang, Nama_Gudang, Alamat_Gudang) VALUES 
    ('G1', 'Kwhite', 'Jalan Keputih Gang Makam No. 11, Keputih, Surabaya'),
    ('G2', 'Simokerto', 'Jalan Indah Rezeki Surya No. 23, Simokerto, Surabaya'),
    ('G3', 'Tegalsari', 'Jalan Komi Dinia No. 34, Tegalsari, Surabaya'),
    ('G4', 'Genteng', 'Jalan Perintis Jaya No. 22, Genteng, Surabaya'),
    ('G5', 'Gubeng', 'Jalan Koni Indah No. 100, Gubeng, Surabaya'),
    ('G6', 'Tegalrejo', 'Jalan Mawar Melati No. 11, Tegalrejo, Surabaya');
    
CREATE TABLE Merk(
    ID_Merk VARCHAR(5) PRIMARY KEY,
    Nama_Merk VARCHAR(50)
);
INSERT INTO Merk (ID_Merk, Nama_Merk) VALUES
	('SA', 'Samsung'),
	('DE', 'Dell'),
	('AP', 'Apple'),
	('AS', 'Asus'),
	('XI', 'Xiaomi'),
	('LE', 'Lenovo');

CREATE TABLE Karyawan(
    ID_Karyawan VARCHAR(10) PRIMARY KEY,
    Nama_Karyawan VARCHAR(50),
    Posisi VARCHAR(20),
    Jam_Kerja VARCHAR(50)
);
INSERT INTO Karyawan (ID_Karyawan, Nama_Karyawan, Posisi, Jam_Kerja) VALUES
	('KR00001', 'Deni Sudirja', 'Staff Logistik A', 'Senin - Jumat, 08.00 - 17.00'),
	('KR00002', 'Shinta Putri', 'Staff Logistik B', 'Senin - Jumat, 08.00 - 17.00'),
	('KR00003', 'Dina Ardine', 'Staff Logistik A', 'Senin - Jumat, 08.00 - 17.00'),
	('KR00004', 'Bunga Jelita', 'Staff Logistik B', 'Senin - Jumat, 08.00 - 17.00'),
	('KR00005', 'Iqbal Mahdi', 'Staff Logistik A', 'Senin - Jumat, 08.00 - 17.00'),
	('KR00006', 'Roni Satya', 'Staff Logistik B', 'Senin - Jumat, 08.00 - 17.00'),
	('KR00007', 'Raisa Andriana', 'Staff Magang', 'Senin - Jumat, 08.00 - 17.00'),
	('KR00008', 'Satria Mahatir', 'Staff Magang', 'Senin - Jumat, 08.00 - 17.00'),
	('KR00009', 'Afgan Syahreza', 'Staff Logistik A', 'Senin - Jumat, 08.00 - 17.00'),
	('KR000010', 'Reza Rahadian', 'Staff Magang', 'Senin - Jumat, 08.00 - 17.00'),
	('KR000011', 'Iqbal Ramadhan', 'Kepala Logistik', 'Senin - Jumat, 08.00 - 17.00'),
	('KR000012', 'Qobil Sito', 'Staff Logistik B', 'Senin - Jumat, 08.00 - 17.00');
    
SELECT * FROM Produk;
SELECT * FROM Supplier;
SELECT * FROM Gudang;
SELECt * FROM Merk;
SELECT * FROM Karyawan;

CREATE TABLE Stok_Produk(
    ID_Produk VARCHAR(10),
    ID_Supplier VARCHAR(20),
    ID_Gudang VARCHAR(5),
    ID_Merk VARCHAR(5),
    Tipe VARCHAR(50),
    Spesifikasi VARCHAR(150),
    Warna VARCHAR(20),
    Harga_Beli INT,
    Harga_Jual INT,
    Stok INT,
    UNIQUE KEY unique_stok_produk (ID_Produk, ID_Supplier, ID_Gudang, ID_Merk, Tipe, Spesifikasi, Warna),
    FOREIGN KEY (ID_Produk) REFERENCES Produk(ID_Produk),
    FOREIGN KEY (ID_Supplier) REFERENCES Supplier(ID_Supplier),
    FOREIGN KEY (ID_Gudang) REFERENCES Gudang(ID_Gudang),
    FOREIGN KEY (ID_Merk) REFERENCES Merk(ID_Merk)
);

SET SQL_SAFE_UPDATES = 0;
INSERT INTO Stok_Produk(ID_Produk, ID_Supplier, ID_Gudang, ID_Merk, Tipe, Spesifikasi, Warna, Harga_Beli, Harga_Jual, Stok) VALUES
	('ES0001', 'ES1-H-SP0001', 'G1', 'SA', 'Galaxy S21 Ultra', 'Layar: 6.8 inci, RAM/ROM: 12GB/128GB, Baterai: 5000 mAh', 'Black', 17860000, 18800000, 19),
	('ES0001', 'ES1-H-SP0001', 'G1', 'SA', 'Galaxy S21 Ultra', 'Layar: 6.8 inci, RAM/ROM: 16GB/256GB, Baterai: 5000 mAh', 'White', 20425000, 21500000, 22),
	('ES0001', 'ES1-H-SP0001', 'G1', 'SA', 'Galaxy S21+', 'Layar: 6.7 inci, RAM/ROM: 8GB/128GB, Baterai: 4800mAh', 'Black', 17100000, 18000000, 25),
	('ES0001', 'ES1-H-SP0001', 'G1', 'SA', 'Galaxy S21+', 'Layar: 6.7 inci, RAM/ROM: 8GB/128GB, Baterai: 4800mAh', 'Silver', 17100000, 18000000, 7),
	('ES0001', 'ES1-H-SP0001', 'G1', 'SA', 'Galaxy S21', 'Layar: 6.2 inci, RAM/ROM: 8GB/128GB, Baterai: 4000 mAh', 'Black', 14725000, 15500000, 42),
	('ES0001', 'ES1-H-SP0001', 'G1', 'SA', 'Galaxy S21', 'Layar: 6.9 inci, RAM/ROM: 12GB/256GB, Baterai: 4500 mAh', 'Silver', 14725000, 15500000, 15), 
	('ES0001', 'ES1-H-SP0001', 'G1', 'SA', 'Galaxy Note 20', 'Layar: 6.7 inci, RAM/ROM: 8GB/256GB, Baterai: 4300 mAh', 'White', 17575000, 18500000, 47),
	('ES0001', 'ES1-H-SP0001', 'G1', 'SA', 'Galaxy Note 20', 'Layar: 6.8 inci, RAM/ROM: 12GB/256GB, Baterai: 4300 mAh', 'Silver', 17575000, 18500000, 27),
	('ES0001', 'ES1-H-SP0001', 'G1', 'SA', 'Galaxy Note 10+', 'Layar: 6.8 inci, RAM/ROM: 12GB/256GB, Baterai: 4300 mAh', 'Black', 17575000, 18500000, 46),
	('ES0001', 'ES1-H-SP0001', 'G1', 'SA', 'Galaxy Note 10+', 'Layar: 6.8 inci, RAM/ROM: 12GB/256GB, Baterai: 4300 mAh', 'Silver', 17575000, 18500000, 26),
	('ES0001', 'ES1-H-SP0001', 'G1', 'SA', 'Galaxy A52', 'Layar: 6.5 inci, RAM/ROM: 6GB/128GB, Baterai: 4500 mAh', 'White', 6650000, 7000000, 23),
	('ES0001', 'ES1-H-SP0001', 'G1', 'SA', 'Galaxy A52', 'Layar: 6.5 inci, RAM/ROM: 6GB/64GB, Baterai: 4000 mAh', 'Black', 6175000, 6500000, 1),
	('ES0001', 'ES1-H-SP0001', 'G1', 'SA', 'Galaxy A51', 'Layar: 6.4 inci, RAM/ROM: 4GB/64GB, Baterai: 5000 mAh', 'Silver', 5700000, 6000000, 50),
	('ES0001', 'ES1-H-SP0001', 'G1', 'SA', 'Galaxy A32', 'Layar: 6.4 inci, RAM/ROM: 4GB/64GB, Baterai: 5000 mAh', 'White', 3325000, 3500000, 16),
	('ES0001', 'ES1-H-SP0001', 'G1', 'SA', 'Galaxy A32', 'Layar: 6.4 inci, RAM/ROM: 6GB/128GB, Baterai: 5000 mAh', 'Black', 3800000, 4000000, 22),
	('ES0001', 'ES1-H-SP0002', 'G2', 'AP', 'iPhone 13 Pro', 'Layar: 6.1 inci, Penyimpanan: 128GB', 'Black', 14725000, 15500000, 49),
	('ES0001', 'ES1-H-SP0002', 'G2', 'AP', 'iPhone 13 Pro', 'Layar: 6.1 inci, Penyimpanan: 256GB', 'White', 18050000, 19000000, 27),
	('ES0001', 'ES1-H-SP0002', 'G2', 'AP', 'iPhone 13 Pro', 'Layar: 6.1 inci, Penyimpanan: 512GB', 'Silver', 20900000, 22000000, 35),
	('ES0001', 'ES1-H-SP0002', 'G2', 'AP', 'iPhone 13', 'Layar: 6.1 inci, Penyimpanan: 128GB', 'Black', 10450000, 11000000, 41),
	('ES0001', 'ES1-H-SP0002', 'G2', 'AP', 'iPhone 13', 'Layar: 6.1 inci, Penyimpanan: 256GB', 'Silver', 11400000, 12000000, 1),
	('ES0001', 'ES1-H-SP0002', 'G2', 'AP', 'iPhone 13 Mini', 'Layar: 5.4 inci, Penyimpanan: 128GB', 'Black', 10165000, 10700000, 41),
	('ES0001', 'ES1-H-SP0002', 'G2', 'AP', 'iPhone 12 Pro', 'Layar: 6.1 inci, Penyimpanan: 128GB', 'Black', 15200000, 16000000, 2),
	('ES0001', 'ES1-H-SP0002', 'G2', 'AP', 'iPhone 12 Pro', 'Layar: 6.1 inci, Penyimpanan: 256GB', 'Silver', 16150000, 17000000, 27),
	('ES0001', 'ES1-H-SP0002', 'G2', 'AP', 'iPhone 12', 'Layar: 6.1 inci, Penyimpanan: 128GB', 'Black', 10450000, 11000000, 28),
	('ES0001', 'ES1-H-SP0002', 'G2', 'AP', 'iPhone 12', 'Layar: 6.1 inci, Penyimpanan: 128GB', 'White', 10450000, 11000000, 15),
	('ES0001', 'ES1-H-SP0002', 'G2', 'AP', 'iPhone 12 Mini', 'Layar: 5.4 inci, Penyimpanan: 64GB', 'Silver', 9975000, 10500000, 41),
	('ES0001', 'ES1-H-SP0002', 'G2', 'AP', 'iPhone XR', 'Layar: 6.1 inci, Penyimpanan: 64GB', 'Black', 8550000, 9000000, 37),
	('ES0001', 'ES1-H-SP0003', 'G3', 'XI', 'Mi 11', 'Layar: 6.81 inci, RAM/ROM: 8GB/128GB, Baterai: 4600 mAh', 'Black', 10165000, 10700000, 30),
	('ES0001', 'ES1-H-SP0003', 'G3', 'XI', 'Mi 11', 'Layar: 6.81 inci, RAM/ROM: 12GB/256GB, Baterai: 4600 mAh', 'Silver', 11590000, 12200000, 9),
	('ES0001', 'ES1-H-SP0003', 'G3', 'XI', 'Mi 10', 'Layar: 6.67 Inci, RAM/ROM: 8GB/128GB, Baterai: 4780 mAh', 'Black', 9975000, 10500000, 49),
	('ES0001', 'ES1-H-SP0003', 'G3', 'XI', 'Mi 10', 'Layar: 6.67 Inci, RAM/ROM: 12GB/256GB, Baterai: 4780 mAh', 'Black', 11590000, 12200000, 20),
	('ES0001', 'ES1-H-SP0003', 'G3', 'XI', 'Mi 9', 'Layar: 6.39 inci, RAM/ROM: 6GB/64GB, Baterai: 3300 mAh', 'Silver', 6650000, 7000000, 44),
	('ES0001', 'ES1-H-SP0003', 'G3', 'XI', 'Mi 9', 'Layar: 6.39 inci, RAM/ROM: 8GB/128GB, Baterai: 3300 mAh', 'White', 7790000, 8200000, 14),
	('ES0001', 'ES1-H-SP0003', 'G3', 'XI', 'Redmi Note 10', 'Layar: 6.43 inci, RAM/ROM: 4GB/64GB, Baterai: 5000 mAh', 'Silver', 2945000, 3100000, 11),
	('ES0001', 'ES1-H-SP0003', 'G3', 'XI', 'Redmi Note 10', 'Layar: 6.43 inci, RAM/ROM: 6GB/128GB, Baterai: 5000 mAh', 'White', 3800000, 4000000, 46),
	('ES0001', 'ES1-H-SP0003', 'G3', 'XI', 'Redmi Note 9', 'Layar: 6.53 inci, RAM/ROM: 4GB/64GB, Baterai: 5020 mAh', 'Black', 2850000, 3000000, 8),
	('ES0001', 'ES1-H-SP0003', 'G3', 'XI', 'Redmi Note 9', 'Layar: 6.53 inci, RAM/ROM: 4GB/64GB, Baterai: 5020 mAh', 'Silver', 3610000, 3800000, 10),
	('ES0001', 'ES1-H-SP0003', 'G3', 'XI', 'Redmi Note 8', 'Layar: 6.3 inci, RAM/ROM: 3GB, Baterai: 4000 mAh', 'Black', 2185000, 2300000, 13),
	('ES0001', 'ES1-H-SP0003', 'G3', 'XI', 'Redmi Note 8', 'Layar: 6.3 inci, RAM/ROM: 4GB/64GB, Baterai: 4000 mAh', 'White', 2375000, 2500000, 41),
	('ES0001', 'ES1-H-SP0003', 'G3', 'XI', 'Redmi Note 8', 'Layar: 6.3 inci, RAM/ROM: 6GB/128GB, Baterai: 4000 mAh', 'Black', 2850000, 3000000, 43),
	('ES0001', 'ES1-H-SP0003', 'G3', 'XI', 'Poco X3', 'Layar: 6.67 inci, RAM/ROM: 6GB/64GB, Baterai: 6000 mAh', 'Black', 3610000, 3800000, 32),
	('ES0001', 'ES1-H-SP0003', 'G3', 'XI', 'Poco X3', 'Layar: 6.67 inci, RAM/ROM: 8GB/128GB, Baterai: 6000 mAh', 'Silver', 3990000, 4200000, 2),
	('ES0001', 'ES1-H-SP0003', 'G3', 'XI', 'Poco F3', 'Layar: 6.67 inci, RAM/ROM: 6GB/128GB, Baterai: 4520 mAh', 'White', 5225000, 5500000, 24),
	('ES0001', 'ES1-H-SP0003', 'G3', 'XI', 'Poco F3', 'Layar: 6.67 inci, RAM/ROM: 8GB/256GB, Baterai: 4520 mAh', 'Silver', 6650000, 7000000, 16),
	('ES0001', 'ES1-H-SP0003', 'G3', 'XI', 'Poco M3', 'Layar: 6.53 inci, RAM/ROM: 4GB/64GB, Baterai: 6000 mAh', 'White', 2185000, 2300000, 45),
	('ES0001', 'ES1-H-SP0003', 'G3', 'XI', 'Poco M3', 'Layar: 6.53 inci, RAM/ROM: 6GB/128GB, Baterai: 6000 mAh', 'Black', 2850000, 3000000, 25),
	('ES0002', 'ES2-L-SP0001', 'G4', 'DE', 'XPS 13', 'Prosesor: Intel Core i7, RAM: 16GB, Penyimpanan: SSD 1TB, Layar: 13.4 inci', 'Black', 6650000, 7000000, 32),
	('ES0002', 'ES2-L-SP0001', 'G4', 'DE', 'XPS 13', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'Black', 7600000, 8000000, 14),
	('ES0002', 'ES2-L-SP0001', 'G4', 'DE', 'XPS 15', 'Prosesor: Intel Core i7, RAM: 16GB, Penyimpanan: SSD 1TB, Layar: 13.4 inci', 'Black', 68400000, 72000000, 11),
	('ES0002', 'ES2-L-SP0001', 'G4', 'DE', 'XPS 15', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'Black', 7980000, 8400000, 42),
	('ES0002', 'ES2-L-SP0001', 'G4', 'DE', 'XPS 17', 'Prosesor: Intel Core i7, RAM: 16GB, Penyimpanan: SSD 1TB, Layar: 13.4 inci', 'Black', 8075000, 8500000, 47),
	('ES0002', 'ES2-L-SP0001', 'G4', 'DE', 'XPS 17', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'Black', 8550000, 9000000, 4),
	('ES0002', 'ES2-L-SP0001', 'G4', 'DE', 'Inspiron 3000', 'Prosesor: Intel Core i7, RAM: 16GB, Penyimpanan: SSD 1TB, Layar: 13.4 inci', 'Silver', 6650000, 7000000, 39),
	('ES0002', 'ES2-L-SP0001', 'G4', 'DE', 'Inspiron 3000', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'Silver', 7125000, 7500000, 15),
	('ES0002', 'ES2-L-SP0001', 'G4', 'DE', 'Inspiron 5000', 'Prosesor: Intel Core i7, RAM: 16GB, Penyimpanan: SSD 1TB, Layar: 13.4 inci', 'Black', 6840000, 7200000, 12),
	('ES0002', 'ES2-L-SP0001', 'G4', 'DE', 'Inspiron 5000', 'Prosesor: Intel Core i9 RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'White', 7125000, 7500000, 46),
	('ES0002', 'ES2-L-SP0001', 'G4', 'DE', 'Inspiron 7000', 'Prosesor: Intel Core i7, RAM: 16GB, Penyimpanan: SSD 1TB, Layar: 13.4 inci', 'Silver', 7410000, 7800000, 50),
	('ES0002', 'ES2-L-SP0001', 'G4', 'DE', 'Inspiron 7000', 'Prosesor: Intel Core i9, RAM: 32GBPenyimpanan: SSD 1TB, Layar: 15.6 inci', 'White', 8075000, 8500000, 3),
	('ES0002', 'ES2-L-SP0002', 'G5', 'AS', 'G3', 'Prosesor: Intel Core i7, RAM: 16GB, Penyimpanan: SSD 1TB, Layar: 13.4 inci', 'Black', 6650000, 7000000, 40),
	('ES0002', 'ES2-L-SP0002', 'G5', 'AS', 'G3', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'White', 7125000, 7500000, 50),
	('ES0002', 'ES2-L-SP0002', 'G5', 'AS', 'G5', 'Prosesor: Intel Core i7, RAM: 16GB, Penyimpanan: SSD 1TB, Layar: 13.4 inci', 'Silver', 6650000, 7000000, 6),
	('ES0002', 'ES2-L-SP0002', 'G5', 'AS', 'G5', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'White', 7410000, 7800000, 42),
	('ES0002', 'ES2-L-SP0002', 'G5', 'AS', 'G7', 'Prosesor: Intel Core i7, RAM: 16GB, Penyimpanan: SSD 1TB, Layar: 13.4 inci', 'Black', 7600000, 8000000, 7),
	('ES0002', 'ES2-L-SP0002', 'G5', 'AS', 'G7', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'Black', 7790000, 8200000, 44),
	('ES0002', 'ES2-L-SP0002', 'G5', 'AS', 'ROG Zephyrus', 'Prosesor: Intel Core i7, RAM: 16GB, Penyimpanan: SSD 1TB, Layar: 13.4 inci', 'White', 10450000, 11000000, 35),
	('ES0002', 'ES2-L-SP0002', 'G5', 'AS', 'ROG Zephyrus', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'Silver', 11115000, 11700000, 8),
	('ES0002', 'ES2-L-SP0002', 'G5', 'AS', 'ROG Strix', 'Prosesor: Intel Core i7, RAM: 16GB, Penyimpanan: SSD 1TB, Layar: 13.4 inci', 'White', 11685000, 12300000, 29),
	('ES0002', 'ES2-L-SP0002', 'G5', 'AS', 'ROG Strix', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'Black', 12065000, 12700000, 6),
	('ES0002', 'ES2-L-SP0002', 'G5', 'AS', 'ROG Flow Zephyrus', 'Prosesor: Intel Core i7, RAM: 16GB, Penyimpanan: SSD 1TB, Layar: 13.4 inci', 'Black', 11400000, 12000000, 40),
	('ES0002', 'ES2-L-SP0002', 'G5', 'AS', 'ROG Flow Zephyrus', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'Black', 11875000, 12500000, 17),
	('ES0002', 'ES2-L-SP0002', 'G5', 'AS', 'Expertbook B9', 'Prosesor: Intel Core i7, RAM: 16GB, Penyimpanan: SSD 1TB, Layar: 13.4 inci', 'Black', 12350000, 13000000, 19),
	('ES0002', 'ES2-L-SP0002', 'G5', 'AS', 'Expertbook B9', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'Black', 13110000, 13800000, 29),
	('ES0002', 'ES2-L-SP0002', 'G5', 'AS', 'Expertbook P1', 'Prosesor: Intel Core i7, RAM: 16GB, Penyimpanan: SSD 1TB, Layar: 13.4 inci', 'Black', 14250000, 15000000, 22),
	('ES0002', 'ES2-L-SP0002', 'G5', 'AS', 'Expertbook P1', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'Black', 15200000, 16000000, 8),
	('ES0002', 'ES2-L-SP0002', 'G5', 'AS', 'Expertbook B1', 'Prosesor: Intel Core i7, RAM: 16GB, Penyimpanan: SSD 1TB, Layar: 13.4 inci', 'Black', 15200000, 16000000, 33),
	('ES0002', 'ES2-L-SP0002', 'G5', 'AS', 'Expertbook B1', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'Black', 15675000, 16500000, 6),
	('ES0002', 'ES2-L-SP0003', 'G6', 'LE', 'ProArt Studiobook Pro X', 'Prosesor: Intel Core i7, RAM: 16GB, Penyimpanan: SSD 1TB, Layar: 13.4 inci', 'Black', 7600000, 8000000, 42),
	('ES0002', 'ES2-L-SP0003', 'G6', 'LE', 'ProArt Studiobook Pro X', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'Silver', 8550000, 9000000, 22),
	('ES0002', 'ES2-L-SP0003', 'G6', 'LE', 'ProArt Studiobook Pro 15', 'Prosesor: Intel Core i7, RAM: 16GB, Penyimpanan: SSD 1TB, Layar: 13.4 inci', 'Silver', 8075000, 8500000, 27),
	('ES0002', 'ES2-L-SP0003', 'G6', 'LE', 'ProArt Studiobook Pro 15', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'Silver', 9025000, 9500000, 7),
	('ES0002', 'ES2-L-SP0003', 'G6', 'LE', 'ProArt Studiobook One', 'Prosesor: Intel Core i7, RAM: 16GB, Penyimpanan: SSD 1TB, Layar: 13.4 inci', 'Silver', 9500000, 10000000, 12),
	('ES0002', 'ES2-L-SP0003', 'G6', 'LE', 'ProArt Studiobook One', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'Silver', 9975000, 10500000, 21),
	('ES0002', 'ES2-L-SP0003', 'G6', 'LE', 'Legion Y540', 'Prosesor: Intel Core i7, RAM: 16GB, Penyimpanan: SSD 1TB, Layar: 13.4 inci', 'Silver', 8075000, 8500000, 0),
	('ES0002', 'ES2-L-SP0003', 'G6', 'LE', 'Legion Y540', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'Silver', 8550000, 9000000, 24),
	('ES0002', 'ES2-L-SP0003', 'G6', 'LE', 'Legion Y545', 'Prosesor: Intel Core i7, RAM: 16GB, Penyimpanan: SSD 1TB, Layar: 13.4 inci', 'Silver', 8740000, 9200000, 34),
	('ES0002', 'ES2-L-SP0003', 'G6', 'LE', 'Legion Y545', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'Black', 9500000, 10000000, 12),
	('ES0002', 'ES2-L-SP0003', 'G6', 'LE', 'Legion 5', 'Prosesor: Intel Core i7, RAM: 16GB, Penyimpanan: SSD 1TB, Layar: 13.4 inci', 'Silver', 6650000, 7000000, 39),
	('ES0002', 'ES2-L-SP0003', 'G6', 'LE', 'Legion 5', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'White', 7600000, 8000000, 4),
	('ES0002', 'ES2-L-SP0003', 'G6', 'LE', 'Flex 3', 'Prosesor: Intel Core i7, RAM: 16GB, Penyimpanan: SSD 1TB, Layar: 13.4 inci', 'Black', 7125000, 7500000, 31),
	('ES0002', 'ES2-L-SP0003', 'G6', 'LE', 'Flex 3', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'Silver', 7600000, 8000000, 3),
	('ES0002', 'ES2-L-SP0003', 'G6', 'LE', 'Flex 5', 'Prosesor: Intel Core i7, RAM: 16GB, Penyimpanan: SSD 1TB, Layar: 13.4 inci', 'Black', 8075000, 8500000, 22),
	('ES0002', 'ES2-L-SP0003', 'G6', 'LE', 'Flex 5', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'Black', 8550000, 9000000, 5),
	('ES0002', 'ES2-L-SP0003', 'G6', 'LE', 'Flex 6', 'Prosesor: Intel Core i7, RAM: 16GB, Penyimpanan: SSD 1TB, Layar: 13.4 inci', 'White', 9025000, 9500000, 26),
	('ES0002', 'ES2-L-SP0003', 'G6', 'LE', 'Flex 6', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'Silver', 9500000, 10000000, 30);	
SELECT * FROM Stok_Produk;

CREATE TABLE transaksi_penjualan(
    ID_Transaksi_Penjualan VARCHAR(10),
    Tanggal_Keluar DATE,
    ID_Karyawan VARCHAR(10),
    Nama_Pemesan VARCHAR(50),
    Nomor_Telepon VARCHAR(20),
    Jenis_Kelamin VARCHAR(10),
    Email VARCHAR(255),
    ID_Produk VARCHAR(10),
    ID_Merk VARCHAR(255),
    Tipe VARCHAR(255),
    Spesifikasi VARCHAR(255),
    Warna VARCHAR(50),
    Harga_jual BIGINT,
    Jumlah INT,
    Harga_Total BIGINT,
    Metode_Pembayaran VARCHAR(50),
	FOREIGN KEY (ID_Produk) REFERENCES Produk(ID_Produk),
    FOREIGN KEY (ID_Merk) REFERENCES Merk(ID_Merk),
    FOREIGN KEY (ID_Karyawan) REFERENCES Karyawan(ID_Karyawan)
);

DELIMITER //
CREATE PROCEDURE transaksi_penjualan(
    IN p_ID_Transaksi_Penjualan VARCHAR(10),
    IN p_Tanggal_Keluar DATE,
    IN p_ID_Karyawan VARCHAR(10),
    IN p_Nama_Pemesan VARCHAR(50),
    IN p_Nomor_Telepon VARCHAR(20),
    IN p_Jenis_Kelamin VARCHAR(10),
    IN p_Email VARCHAR(255),
    IN p_ID_Produk VARCHAR(10),
    IN p_ID_Merk VARCHAR(255),
    IN p_Tipe VARCHAR(255),
    IN p_Spesifikasi VARCHAR(255),
    IN p_Warna VARCHAR(50),
    IN p_Harga_jual BIGINT,
    IN p_Jumlah INT,
    IN p_Harga_Total BIGINT,
    IN p_Metode_Pembayaran VARCHAR(50)
)
BEGIN
    DECLARE v_Harga_Total BIGINT;
    SET v_Harga_Total = p_Harga_Jual * p_Jumlah;
    
    INSERT INTO transaksi_penjualan(
        ID_Transaksi_Penjualan,
        Tanggal_Keluar,
        ID_Karyawan,
        Nama_Pemesan,
		Nomor_Telepon,
		Jenis_Kelamin,
		Email,
        ID_Produk,
        ID_Merk,
        Tipe,
        Spesifikasi,
        Warna,
        Harga_Jual,
        Jumlah,
        Harga_Total,
        Metode_Pembayaran
	) 
    VALUES(
		p_ID_Transaksi_Penjualan,
		p_Tanggal_Keluar,
		p_ID_Karyawan,
		p_Nama_Pemesan,
		p_Nomor_Telepon,
		p_Jenis_Kelamin,
		p_Email,
		p_ID_Produk,
		p_ID_Merk,
		p_Tipe,
		p_Spesifikasi,
		p_Warna,
		p_Harga_jual,
		p_Jumlah,
		p_Harga_Total,
		p_Metode_Pembayaran
    );
	SELECT
		p_ID_Transaksi_Penjualan AS ID_Transaksi_Penjualan,
        p_Tanggal_Keluar AS Tanggal_Keluar,
        p_ID_Karyawan AS ID_Karyawan,
        p_Nama_Pemesan AS Nama_Pemesan,
		p_Nomor_Telepon AS Nomor_Telepon,
		p_Jenis_Kelamin AS Jenis_Kelamin,
		p_Email AS Email,
        p_ID_Produk AS ID_Produk,
        p_ID_Merk AS ID_Merk,
        p_Tipe AS Tipe,
        p_Spesifikasi AS Spesifikasi,
        p_Warna AS Warna,
        p_Harga_Jual AS Harga_Jual,
        p_Jumlah AS Jumlah,
        v_Harga_Total AS Harga_Total,
        p_Metode_Pembayaran AS Metode_Pembayaran;
END //
DELIMITER ;

DELIMITER //
	CREATE TRIGGER stok_after_penjualan
	AFTER INSERT ON transaksi_penjualan
	FOR EACH ROW
	BEGIN
		UPDATE Stok_Produk
		SET Stok = Stok - NEW.Jumlah
		WHERE Stok_Produk.Tipe = NEW.Tipe
        AND Stok_Produk.Spesifikasi = NEW.Spesifikasi
        AND Stok_Produk.Warna = NEW.Warna;
END;
//
DELIMITER ;

SET SQL_SAFE_UPDATES = 0;
CALL transaksi_penjualan('PU-1', '2023-01-01', 'KR00001', 'Aaron Adams', '081234567891', 'Laki-laki', 'aaronadams1@gmail.com', 'ES0001', 'SA', 'Galaxy S21 Ultra', 'Layar: 6.8 inci, RAM/ROM: 12GB/128GB, Baterai: 5000 mAh', 'Black', 18800000, 1, 18800000, 'Tunai');
CALL transaksi_penjualan('PU-2', '2023-01-01', 'KR00001', 'Bella Brooks', '081234567892', 'Perempuan', 'bellabrooks2@gmail.com', 'ES0002', 'DE', 'XPS 17', 'Prosesor: Intel Core i7, RAM: 16GB, Penyimpanan: SSD 1TB, Layar: 13.4 inci', 'Black', 8500000, 2, 17000000, 'Debit');
CALL transaksi_penjualan('PU-3', '2023-01-02', 'KR00002', 'David Davis', '081234567894', 'Laki-laki', 'daviddavis4@gmail.com', 'ES0001', 'SA', 'Galaxy Note 20 Ultra', 'Layar: 6.9 inci, RAM/ROM: 12GB/256GB, Baterai: 4500 mAh', 'Silver', 23000000, 1, 23000000, 'Tunai');
CALL transaksi_penjualan('PU-4', '2023-01-02', 'KR00002', 'Emma Evans', '081234567895', 'Perempuan', 'emmaevans5@gmail.com', 'ES0002', 'LE', 'Legion Y540', 'Prosesor: Intel Core i7, RAM: 16GB, Penyimpanan: SSD 1TB, Layar: 13.4 inci', 'Silver', 8500000, 1, 8500000, 'Tunai');
CALL transaksi_penjualan('PU-5', '2023-01-03', 'KR00003', 'Grace Green', '081234567897', 'Perempuan', 'gracegreen7@gmail.com', 'ES0001', 'AP', 'iPhone 13 Pro', 'Layar: 6.1 inci , Penyimpanan: 512GB', 'Silver', 22000000, 2, 44000000, 'Debit');
CALL transaksi_penjualan('PU-6', '2023-01-03', 'KR00003', 'Henry Hughes', '081234567898', 'Laki-laki', 'henryhughes8@gmail.com', 'ES0002', 'LE', 'Legion Y545', 'Prosesor: Intel Core i7, RAM: 16GB, Penyimpanan: SSD 1TB, Layar: 13.4 inci', 'Silver', 9200000, 2, 18400000, 'Debit');
CALL transaksi_penjualan('PU-7', '2023-01-04', 'KR00004', 'Jack Johnson', '081234567900', 'Laki-laki', 'jackjohnson10@gmail.com', 'ES0001', 'AP', 'iPhone 13 Mini', 'Layar: 5.4 inci , Penyimpanan: 128GB', 'Black', 10700000, 1, 10700000, 'Debit');
CALL transaksi_penjualan('PU-8', '2023-01-04', 'KR00004', 'Kate King', '081234567901', 'Perempuan', 'kateking11@gmail.com', 'ES0002', 'LE', 'Flex 6', 'Prosesor: Intel Core i7, RAM: 16GB, Penyimpanan: SSD 1TB, Layar: 13.4 inci', 'White', 9500000, 1, 9500000, 'Tunai');
CALL transaksi_penjualan('PU-9', '2023-01-05', 'KR00005', 'Mia Mitchell', '081234567903', 'Perempuan', 'miamitchell13@gmail.com', 'ES0001', 'XI', 'Mi 11', 'Layar: 6.81 inci, RAM/ROM: 12GB/256GB, Baterai: 4600 mAh', 'Silver', 12200000, 2, 24400000, 'Tunai');
CALL transaksi_penjualan('PU-10', '2023-01-05', 'KR00005', 'Noah Nelson', '081234567904', 'Laki-laki', 'noahnelson14@gmail.com', 'ES0002', 'AS', 'Expertbook B1', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'Black', 16500000, 1, 16500000, 'Tunai');
CALL transaksi_penjualan('PU-11', '2023-01-08', 'KR00006', 'Peter Parker', '081234567906', 'Laki-laki', 'peterparker16@gmail.com', 'ES0001', 'XI', 'Mi 10', 'Layar: 6.67 Inci, RAM/ROM: 8GB/128GB, Baterai: 4780 mAh', 'Black', 10500000, 2, 21000000, 'Tunai');
CALL transaksi_penjualan('PU-12', '2023-01-08', 'KR00006', 'Quinn Qoinn', '081234567907', 'Perempuan', 'quinnqoinn17@gmail.com', 'ES0002', 'AS', 'Expertbook P1', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'Black', 16000000, 2, 32000000, 'Tunai');
CALL transaksi_penjualan('PU-13', '2023-01-09', 'KR00007', 'Sophia Stewart', '081234567909', 'Perempuan', 'sophiastewart19@gmail.com', 'ES0001', 'SA', 'Galaxy Note 20 Ultra', 'Layar: 6.9 inci, RAM/ROM: 12GB/256GB, Baterai: 4500 mAh', 'Silver', 23000000, 2, 46000000, 'Debit');
CALL transaksi_penjualan('PU-14', '2023-01-09', 'KR00007', 'Tyler Taylor', '081234567910', 'Laki-laki', 'tylertaylor20@gmail.com', 'ES0002', 'DE', 'XPS 17', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'Black', 9000000, 1, 9000000, 'Debit');
CALL transaksi_penjualan('PU-15', '2023-01-10', 'KR00008', 'Victor Vincent', '081234567912', 'Laki-laki', 'victorvincent22@gmail.com', 'ES0001', 'SA', 'Galaxy Note 20 Ultra', 'Layar: 6.9 inci, RAM/ROM: 12GB/256GB, Baterai: 4500 mAh', 'Black', 23000000, 2, 46000000, 'Tunai');
CALL transaksi_penjualan('PU-16', '2023-01-10', 'KR00008', 'Willow Walker', '081234567913', 'Laki-laki', 'willowwalker23@gmail.com', 'ES0002', 'DE', 'XPS 15', 'Prosesor: Intel Core i7, RAM: 16GB, Penyimpanan: SSD 1TB, Layar: 13.4 inci', 'Black', 72000000, 1, 72000000, 'Debit');
CALL transaksi_penjualan('PU-17', '2023-01-11', 'KR00009', 'Yasmine Young', '081234567915', 'Perempuan', 'yasmineyoung25@gmail.com', 'ES0001', 'AP', 'iPhone 13', 'Layar: 6.1 inci , Penyimpanan: 128GB', 'Black', 11000000, 2, 22000000, 'Debit');
CALL transaksi_penjualan('PU-18', '2023-01-11', 'KR000010', 'Zachary Zimmerman', '081234567916', 'Laki-laki', 'zacharyzimmerman26@gmail.com', 'ES0002', 'DE', 'XPS 13', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'Black', 8000000, 1, 8000000, 'Tunai');
CALL transaksi_penjualan('PU-19', '2023-01-12', 'KR000012', 'Benjamin Brooks', '081234567918', 'Laki-laki', 'benjaminbrooks28@gmail.com', 'ES0001', 'AP', 'iPhone 13', 'Layar: 6.1 inci , Penyimpanan: 256GB', 'Silver', 12000000, 1, 12000000, 'Debit');
CALL transaksi_penjualan('PU-20', '2023-01-12', 'KR00001', 'Chloe Clark', '081234567919', 'Perempuan', 'chloeclark29@gmail.com', 'ES0002', 'AS', 'ROG Zephyrus', 'Prosesor: Intel Core i7, RAM: 16GB, Penyimpanan: SSD 1TB, Layar: 13.4 inci', 'White', 11000000, 1, 11000000, 'Tunai');
CALL transaksi_penjualan('PU-21', '2023-01-15', 'KR00001', 'Emily Edwards', '081234567921', 'Perempuan', 'emilyedwards31@gmail.com', 'ES0001', 'XI', 'Mi 9', 'Layar: 6.39 inci, RAM/ROM: 8GB/128GB, Baterai: 3300 mAh', 'White', 8200000, 1, 8200000, 'Tunai');
CALL transaksi_penjualan('PU-22', '2023-01-15', 'KR00002', 'Frederick Fisher', '081234567922', 'Laki-laki', 'frederickfisher32@gmail.com', 'ES0002', 'DE', 'Inspiron 7000', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'White', 8500000, 2, 17000000, 'Tunai');
CALL transaksi_penjualan('PU-23', '2023-01-16', 'KR00002', 'Harrison Hill', '081234567924', 'Laki-laki', 'harrisonhill34@gmail.com', 'ES0001', 'XI', 'Mi 9', 'Layar: 6.39 inci, RAM/ROM: 6GB/64GB, Baterai: 3300 mAh', 'Silver', 7000000, 1, 7000000, 'Debit');
CALL transaksi_penjualan('PU-24', '2023-01-16', 'KR00003', 'Isla Irwin', '081234567925', 'Perempuan', 'islairwin35@gmail.com', 'ES0002', 'LE', 'ProArt Studiobook One', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'Silver', 10500000, 2, 21000000, 'Debit');
CALL transaksi_penjualan('PU-25', '2023-01-17', 'KR00003', 'Kayla Kelly', '081234567927', 'Perempuan', 'kaylakelly37@gmail.com', 'ES0001', 'SA', 'Galaxy Note 10+', 'Layar: 6.8 inci, RAM/ROM: 12GB/256GB, Baterai: 4300 mAh', 'Silver', 18500000, 1, 18500000, 'Tunai');
CALL transaksi_penjualan('PU-26', '2023-01-17', 'KR00004', 'Leo Lewis', '081234567928', 'Laki-laki', 'leolewis38@gmail.com', 'ES0002', 'DE', 'Inspiron 5000', 'Prosesor: Intel Core i9 RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'White', 7500000, 1, 7500000, 'Debit');
CALL transaksi_penjualan('PU-27', '2023-01-18', 'KR00004', 'Natalie Newman', '081234567930', 'Perempuan', 'natalienewman40@gmail.com', 'ES0001', 'SA', 'Galaxy Note 10+', 'Layar: 6.8 inci, RAM/ROM: 12GB/256GB, Baterai: 4300 mAh', 'Black', 18500000, 1, 18500000, 'Debit');
CALL transaksi_penjualan('PU-28', '2023-01-18', 'KR00005', 'Oscar Oliver', '081234567931', 'Laki-laki', 'oscaroliver41@gmail.com', 'ES0002', 'LE', 'ProArt Studiobook One', 'Prosesor: Intel Core i7, RAM: 16GB, Penyimpanan: SSD 1TB, Layar: 13.4 inci', 'Silver', 10000000, 1, 10000000, 'Tunai');
CALL transaksi_penjualan('PU-29', '2023-01-19', 'KR00005', 'Quincy Quinn', '081234567933', 'Perempuan', 'quincyquinn43@gmail.com', 'ES0001', 'AP', 'iPhone 12', 'Layar: 6.1 inci , Penyimpanan: 128GB', 'White', 11000000, 1, 11000000, 'Debit');
CALL transaksi_penjualan('PU-30', '2023-01-19', 'KR00006', 'Riley Reed', '081234567934', 'Perempuan', 'rileyreed44@gmail.com', 'ES0002', 'LE', 'ProArt Studiobook Pro 15', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'Silver', 9500000, 1, 9500000, 'Tunai');
CALL transaksi_penjualan('PU-31', '2023-01-22', 'KR00006', 'Taylor Tylor', '081234567936', 'Perempuan', 'taylortylor46@gmail.com', 'ES0001', 'AP', 'iPhone 12 Mini', 'Layar: 5.4 inci , Penyimpanan: 64GB', 'Silver', 10500000, 2, 21000000, 'Tunai');
CALL transaksi_penjualan('PU-32', '2023-01-22', 'KR00007', 'Ulysses Underwood', '081234567937', 'Perempuan', 'ulyssesunderwood47@gmail.com', 'ES0002', 'AS', 'Expertbook B1', 'Prosesor: Intel Core i7, RAM: 16GB, Penyimpanan: SSD 1TB, Layar: 13.4 inci', 'Black', 16000000, 2, 32000000, 'Debit');
CALL transaksi_penjualan('PU-33', '2023-01-23', 'KR00007', 'Wyatt Walker', '081234567939', 'Laki-laki', 'wyattwalker49@gmail.com', 'ES0001', 'XI', 'Mi 11', 'Layar: 6.81 inci, RAM/ROM: 8GB/128GB, Baterai: 4600 mAh', 'Black', 10700000, 2, 21400000, 'Debit');
CALL transaksi_penjualan('PU-34', '2023-01-23', 'KR00008', 'Xander Xenon', '081234567940', 'Laki-laki', 'xanderxenon50@gmail.com', 'ES0002', 'DE', 'Inspiron 5000', 'Prosesor: Intel Core i7, RAM: 16GB, Penyimpanan: SSD 1TB, Layar: 13.4 inci', 'Black', 7200000, 1, 7200000, 'Tunai');
CALL transaksi_penjualan('PU-35', '2023-01-24', 'KR00009', 'Zachariah Zimmerman', '081234567942', 'Laki-laki', 'zachariahzimmerman52@gmail.com', 'ES0001', 'XI', 'Mi 11', 'Layar: 6.81 inci, RAM/ROM: 12GB/256GB, Baterai: 4600 mAh', 'Silver', 12200000, 1, 12200000, 'Tunai');
CALL transaksi_penjualan('PU-36', '2023-01-24', 'KR00009', 'Ava Adams', '081234567943', 'Perempuan', 'avaadams53@gmail.com', 'ES0002', 'AS', 'G3', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'White', 7500000, 2, 15000000, 'Debit');
CALL transaksi_penjualan('PU-37', '2023-01-25', 'KR000011', 'Clara Clark', '081234567945', 'Perempuan', 'claraclark55@gmail.com', 'ES0001', 'SA', 'Galaxy Note 20 Ultra', 'Layar: 6.9 inci, RAM/ROM: 12GB/256GB, Baterai: 4500 mAh', 'Black', 23000000, 1, 23000000, 'Debit');
CALL transaksi_penjualan('PU-38', '2023-01-26', 'KR000012', 'Daniel Davis', '081234567946', 'Laki-laki', 'danieldavis56@gmail.com', 'ES0002', 'DE', 'XPS 15', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'Black', 8400000, 2, 16800000, 'Tunai');
CALL transaksi_penjualan('PU-39', '2023-01-26', 'KR00008', 'Finn Foster', '081234567948', 'Laki-laki', 'finnfoster58@gmail.com', 'ES0001', 'SA', 'Galaxy Note 20 Ultra', 'Layar: 6.9 inci, RAM/ROM: 12GB/256GB, Baterai: 4500 mAh', 'Black', 23000000, 1, 23000000, 'Tunai');
CALL transaksi_penjualan('PU-40', '2023-01-26', 'KR00008', 'Giselle Green', '081234567949', 'Perempuan', 'gisellegreen59@gmail.com', 'ES0002', 'LE', 'ProArt Studiobook Pro X', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'Silver', 9000000, 1, 9000000, 'Debit');
CALL transaksi_penjualan('PU-41', '2023-01-29', 'KR00009', 'Isla Ingram', '081234567951', 'Perempuan', 'islaingram61@gmail.com', 'ES0001', 'AP', 'iPhone 12 Pro', 'Layar: 6.1 inci , Penyimpanan: 128GB', 'Black', 16000000, 2, 32000000, 'Tunai');
CALL transaksi_penjualan('PU-42', '2023-01-29', 'KR00009', 'Jordan Johnson', '081234567952', 'Laki-laki', 'jordanjohnson62@gmail.com', 'ES0002', 'AS', 'Expertbook B9', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'Black', 13800000, 2, 27600000, 'Debit');
CALL transaksi_penjualan('PU-43', '2023-01-30', 'KR000010', 'Logan Lee', '081234567954', 'Laki-laki', 'loganlee64@gmail.com', 'ES0001', 'AP', 'iPhone XR', 'Layar: 6.1 inci, Penyimpanan: 64GB', 'Black', 9000000, 1, 9000000, 'Debit');
CALL transaksi_penjualan('PU-44', '2023-01-30', 'KR000010', 'Madison Mitchell', '081234567955', 'Perempuan', 'madisonmitchell65@gmail.com', 'ES0002', 'AS', 'Expertbook B9', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'Black', 13800000, 1, 13800000, 'Tunai');
CALL transaksi_penjualan('PU-45', '2023-01-31', 'KR000011', 'Olivia Owins', '081234567957', 'Perempuan', 'oliviaowins67@gmail.com', 'ES0001', 'XI', 'Poco F3', 'Layar: 6.67 inci, RAM/ROM: 8GB/256GB, Baterai: 4520 mAh', 'Silver', 7000000, 1, 7000000, 'Tunai');
CALL transaksi_penjualan('PU-46', '2023-01-31', 'KR000011', 'Parker Porker', '081234567958', 'Laki-laki', 'parkerporker68@gmail.com', 'ES0002', 'DE', 'G3', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'White', 7500000, 1, 7500000, 'Debit');
CALL transaksi_penjualan('PU-47', '2023-02-01', 'KR00001', 'Rachel Reed', '081234567960', 'Perempuan', 'rachelreed70@gmail.com', 'ES0001', 'SA', 'Galaxy S-21 Ultra', 'Layar: 6.8 inci, RAM/ROM: 12GB/128GB, Baterai: 5000 mAh', 'Black', 18800000, 1, 18800000, 'Tunai');
CALL transaksi_penjualan('PU-48', '2023-02-01', 'KR00001', 'Sebastian Stewart', '081234567961', 'Laki-laki', 'sebastianstewart71@gmail.com', 'ES0002', 'DE', 'XPS 17', 'Prosesor: Intel Core i7, RAM: 16GB, Penyimpanan: SSD 1TB, Layar: 13.4 inci', 'Black', 8500000, 2, 17000000, 'Debit');
CALL transaksi_penjualan('PU-49', '2023-02-02', 'KR00002', 'Upton Underwood', '081234567963', 'Laki-laki', 'uptonunderwood73@gmail.com', 'ES0001', 'SA', 'Galaxy Note 20 Ultra', 'Layar: 6.9 inci, RAM/ROM: 12GB/256GB, Baterai: 4500 mAh', 'Silver', 23000000, 1, 23000000, 'Tunai');
CALL transaksi_penjualan('PU-50', '2023-02-03', 'KR00002', 'Victoria Vincent', '081234567964', 'Perempuan', 'victoriavincet74@gmail.com', 'ES0002', 'LE', 'Legion Y540', 'Prosesor: Intel Core i7, RAM: 16GB, Penyimpanan: SSD 1TB, Layar: 13.4 inci', 'Silver', 8500000, 1, 8500000, 'Tunai');
CALL transaksi_penjualan('PU-51', '2023-02-07', 'KR00003', 'Ximena Xenon', '081234567966', 'Perempuan', 'ximenaxenon76@gmail.com', 'ES0001', 'AP', 'iPhone 13 Pro', 'Layar: 6.1 inci , Penyimpanan: 512GB', 'Silver', 22000000, 2, 44000000, 'Debit');
CALL transaksi_penjualan('PU-52', '2023-02-07', 'KR00003', 'Yvonne Young', '081234567967', 'Perempuan', 'yvonneyoung77@gmailcom', 'ES0002', 'LE', 'Legion Y545', 'Prosesor: Intel Core i7, RAM: 16GB, Penyimpanan: SSD 1TB, Layar: 13.4 inci', 'Silver', 9200000, 2, 18400000, 'Debit');
CALL transaksi_penjualan('PU-53', '2023-02-08', 'KR00004', 'Amelia Adams', '081234567969', 'Perempuan', 'ameliaadams79@gmail.com', 'ES0001', 'AP', 'iPhone 13 Mini', 'Layar: 5.4 inci , Penyimpanan: 128GB', 'Black', 10700000, 1, 10700000, 'Debit');
CALL transaksi_penjualan('PU-54', '2023-02-09', 'KR00004', 'Binar Binda', '081234567970', 'Perempuan', 'binarbinda80@gmail.com', 'ES0002', 'XI', 'Flex 6', 'Prosesor: Intel Core i7, RAM: 16GB, Penyimpanan: SSD 1TB, Layar: 13.4 inci', 'White', 9500000, 1, 9500000, 'Tunai');
CALL transaksi_penjualan('PU-55', '2023-02-10', 'KR00005', 'Dina Didi', '081234567972', 'Perempuan', 'dinadidi82@gmail.com', 'ES0001', 'XI', 'Mi 11', 'Layar: 6.81 inci, RAM/ROM: 12GB/256GB, Baterai: 4600 mAh', 'Silver', 12200000, 2, 24400000, 'Tunai');
CALL transaksi_penjualan('PU-56', '2023-02-10', 'KR00005', 'Evi Etina', '081234567973', 'Perempuan', 'evietina83@gmail.com', 'ES0002', 'AS', 'Expertbook B1', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'Black', 16500000, 1, 16500000, 'Tunai');
CALL transaksi_penjualan('PU-57', '2023-02-13', 'KR00006', 'Ida Inara', '081234567975', 'Perempuan', 'idainara85@gmail.com', 'ES0001', 'XI', 'Mi 10', 'Layar: 6.67 Inci, RAM/ROM: 8GB/128GB, Baterai: 4780 mAh', 'Black', 10500000, 2, 21000000, 'Tunai');
CALL transaksi_penjualan('PU-58', '2023-02-14', 'KR00006', 'Joko Johnson', '081234567976', 'Laki-laki', 'jokojohnson86@gmail.com', 'ES0002', 'AS', 'Expertbook P1', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'Black', 16000000, 2, 32000000, 'Tunai');
CALL transaksi_penjualan('PU-59', '2023-02-15', 'KR00007', 'Lima Lani', '081234567978', 'Laki-laki', 'limalani88@gmail.com', 'ES0001', 'SA', 'Galaxy Note 20 Ultra', 'Layar: 6.9 inci, RAM/ROM: 12GB/256GB, Baterai: 4500 mAh', 'Silver', 23000000, 2, 46000000, 'Debit');
CALL transaksi_penjualan('PU-60', '2023-02-15', 'KR00007', 'Madine Mici', '081234567979', 'Perempuan', 'madinemici1@gmail.com', 'ES0002', 'DE', 'XPS 17', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'Black', 9000000, 1, 9000000, 'Debit');
CALL transaksi_penjualan('PU-61', '2023-02-16', 'KR00008', 'Opick Oxa', '081234567981', 'Laki-laki', 'opickoxa1@gmail.com', 'ES0001', 'SA', 'Galaxy Note 20 Ultra', 'Layar: 6.9 inci, RAM/ROM: 12GB/256GB, Baterai: 4500 mAh', 'Black', 23000000, 2, 46000000, 'Tunai');
CALL transaksi_penjualan('PU-62', '2023-02-17', 'KR00008', 'Pixi Pina', '081234567982', 'Perempuan', 'pixipina1@gmail.com', 'ES0002', 'DE', 'XPS 15', 'Prosesor: Intel Core i7, RAM: 16GB, Penyimpanan: SSD 1TB, Layar: 13.4 inci', 'Black', 72000000, 1, 72000000, 'Debit');
CALL transaksi_penjualan('PU-63', '2023-02-20', 'KR00009', 'Restu Restia', '081234567984', 'Perempuan', 'resturestia1@gmail.com', 'ES0001', 'AP', 'iPhone 13', 'Layar: 6.1 inci , Penyimpanan: 128GB', 'Black', 11000000, 2, 22000000, 'Debit');
CALL transaksi_penjualan('PU-64', '2023-02-20', 'KR000010', 'Satria Sati', '081234567985', 'Laki-laki', 'satriasati1@gmail.com', 'ES0002', 'DE', 'XPS 13', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'Black', 8000000, 1, 8000000, 'Tunai');
CALL transaksi_penjualan('PU-65', '2023-02-21', 'KR000012', 'Udina Udi', '081234567987', 'Laki-laki', 'udinaudi1@gmail.com', 'ES0001', 'AP', 'iPhone 13', 'Layar: 6.1 inci , Penyimpanan: 256GB', 'Silver', 12000000, 1, 12000000, 'Debit');
CALL transaksi_penjualan('PU-66', '2023-02-22', 'KR00001', 'Vina Vinia', '081234567988', 'Perempuan', 'vinavinia1@gmail.com', 'ES0002', 'AS', 'ROG Zephyrus', 'Prosesor: Intel Core i7, RAM: 16GB, Penyimpanan: SSD 1TB, Layar: 13.4 inci', 'White', 11000000, 1, 11000000, 'Tunai');
CALL transaksi_penjualan('PU-67', '2023-02-23', 'KR00001', 'Xinaci Xana', '081234567990', 'Perempuan', 'xinacixana1@gmail.com', 'ES0001', 'XI', 'Mi 9', 'Layar: 6.39 inci, RAM/ROM: 8GB/128GB, Baterai: 3300 mAh', 'White', 8200000, 1, 8200000, 'Tunai');
CALL transaksi_penjualan('PU-68', '2023-02-24', 'KR00002', 'Yuni Yanita', '081234567991', 'Perempuan', 'yuniyanita1@gmail.com', 'ES0002', 'DE', 'Inspiron 7000', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'White', 8500000, 2, 17000000, 'Tunai');
CALL transaksi_penjualan('PU-69', '2023-02-24', 'KR00002', 'Amin Amina', '081234567993', 'Laki-laki', 'aminamina1@gmail.com', 'ES0001', 'XI', 'Mi 9', 'Layar: 6.39 inci, RAM/ROM: 6GB/64GB, Baterai: 3300 mAh', 'Silver', 7000000, 1, 7000000, 'Debit');
CALL transaksi_penjualan('PU-70', '2023-02-26', 'KR00003', 'Belia Bendra', '081234567994', 'Perempuan', 'beliabendra1@gmail.com', 'ES0002', 'LE', 'ProArt Studiobook One', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'Silver', 10500000, 2, 21000000, 'Debit');
CALL transaksi_penjualan('PU-71', '2023-02-27', 'KR00003', 'Deni Denida', '081234567996', 'Laki-laki', 'denidenida1@gmail.com', 'ES0001', 'SA', 'Galaxy Note 10+', 'Layar: 6.8 inci, RAM/ROM: 12GB/256GB, Baterai: 4300 mAh', 'Silver', 18500000, 1, 18500000, 'Tunai');
CALL transaksi_penjualan('PU-72', '2023-02-27', 'KR00004', 'Erina Ecin', '081234567997', 'Perempuan', 'erinaecin1@gmail.com', 'ES0002', 'DE', 'Inspiron 5000', 'Prosesor: Intel Core i9 RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'White', 7500000, 1, 7500000, 'Debit');
CALL transaksi_penjualan('PU-73', '2023-02-28', 'KR00004', 'Gandy Gana', '081234567999', 'Laki-laki', 'gandygana1@gmail.com', 'ES0001', 'SA', 'Galaxy Note 10+', 'Layar: 6.8 inci, RAM/ROM: 12GB/256GB, Baterai: 4300 mAh', 'Black', 18500000, 1, 18500000, 'Debit');

-- CEK PRODUK AFTER TRANSAKSI
SELECT * FROM Transaksi_Penjualan;
SELECT * FROM Stok_Produk; 

CREATE TABLE Transaksi_Pembelian(
    ID_Transaksi_Pembelian VARCHAR(10),
    Tanggal_Masuk DATE,
    ID_Karyawan VARCHAR(10),
    ID_Produk VARCHAR(10),
    ID_Merk VARCHAR(5),
    Tipe VARCHAR(50),
    Spesifikasi VARCHAR(255),
    Warna VARCHAR(50),
    Jumlah INT,
    Harga_Beli INT,
    Harga_Beli_Total BIGINT,
    Metode_Pembayaran VARCHAR(50),
    FOREIGN KEY (ID_Produk) REFERENCES Produk(ID_Produk),
    FOREIGN KEY (ID_Merk) REFERENCES Merk(ID_Merk),
    FOREIGN KEY (ID_Karyawan) REFERENCES Karyawan(ID_Karyawan)
);

DELIMITER // 
CREATE PROCEDURE transaksi_pembelian(
	IN p_ID_Transaksi_Pembelian VARCHAR(10),
    IN p_Tanggal_Masuk DATE,
    IN p_ID_Karyawan VARCHAR(10),
    IN p_ID_Produk VARCHAR(10),
    IN p_ID_Merk VARCHAR(255),
	IN p_Tipe VARCHAR(255),
    IN p_Spesifikasi VARCHAR(255),
    IN p_Warna VARCHAR(50),
    IN p_Jumlah INT,
    IN p_Harga_Beli BIGINT,
    IN p_Harga_Beli_Total BIGINT,
    IN p_Metode_Pembayaran VARCHAR(50)
)
BEGIN
    DECLARE v_Harga_Beli_Total BIGINT;
    SET v_Harga_Beli_Total = p_Harga_Beli * p_Jumlah;

    INSERT INTO Transaksi_Pembelian(
        ID_Transaksi_Pembelian,
		Tanggal_Masuk,
		ID_Karyawan,
		ID_Produk,
    	ID_Merk,
		Tipe,
    	Spesifikasi,
		Warna,
		Jumlah,
		Harga_Beli,
		Harga_Beli_Total,
		Metode_Pembayaran
    )
    VALUES (
		p_ID_Transaksi_Pembelian,
		p_Tanggal_Masuk,
		p_ID_Karyawan,
		p_ID_Produk,
    	p_ID_Merk,
		p_Tipe,
    	p_Spesifikasi,
		p_Warna,
		p_Jumlah,
		p_Harga_Beli,
		p_Harga_Beli_Total,
		p_Metode_Pembayaran
    );
    SELECT
		p_ID_Transaksi_Pembelian AS ID_Transaksi_Pembelian,
		p_Tanggal_Masuk AS Tanggal_Masuk,
		p_ID_Karyawan AS ID_Karyawan,
		p_ID_Produk AS ID_Produk,
    	p_ID_Merk AS ID_Merk,
		p_Tipe AS Tipe,
    	p_Spesifikasi AS Spesifikasi,
		p_Warna AS Warna,
		p_Jumlah AS Jumlah,
		p_Harga_Beli AS Harga_Beli,
		v_Harga_Beli_Total AS Harga_Beli_Total,
		p_Metode_Pembayaran AS Metode_Pembayaran;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER stok_after_pembelian
AFTER INSERT ON transaksi_pembelian
FOR EACH ROW
BEGIN
    UPDATE Stok_Produk
    SET Stok = Stok + NEW.Jumlah
    WHERE 
	Stok_Produk.Tipe = NEW.Tipe
	AND Stok_Produk.Spesifikasi = NEW.Spesifikasi
	AND Stok_Produk.Warna = NEW.Warna;
END;
//
DELIMITER ;

SET SQL_SAFE_UPDATES = 0;
CALL transaksi_pembelian('PE-1', '2023-01-01', 'KR00001', 'ES0001', 'SA', 'Galaxy S21 Ultra', 'Layar: 6.8 inci, RAM/ROM: 12GB/128GB, Baterai: 5000 mAh', 'Black', 13, 17860000, 232180000, 'Tunai');
CALL transaksi_pembelian('PE-2', '2023-01-02', 'KR00001', 'ES0001', 'SA', 'Galaxy S21+', 'Layar: 6.7 inci, RAM/ROM: 8GB/128GB, Baterai: 4800mAh', 'Black', 18, 17100000, 307800000, 'Tunai');
CALL transaksi_pembelian('PE-3', '2023-01-03', 'KR00001', 'ES0001', 'SA', 'Galaxy S21', 'Layar: 6.2 inci, RAM/ROM: 8GB/128GB, Baterai: 4000 mAh', 'Black', 41, 14724000, 603684000, 'Debit');
CALL transaksi_pembelian('PE-4', '2023-01-04', 'KR00002', 'ES0002', 'DE', 'XPS 13', 'Prosesor: Intel Core i7, RAM: 16GB, Penyimpanan: SSD 1TB, Layar: 13.4 inci', 'Black', 23, 6650000, 152950000, 'Debit');
CALL transaksi_pembelian('PE-5', '2023-01-05', 'KR00002', 'ES0002', 'DE', 'XPS 15', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'Black', 47, 7980000, 375060000, 'Tunai');
CALL transaksi_pembelian('PE-6', '2023-01-06', 'KR00002', 'ES0002', 'DE', 'XPS 17', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'Black', 43, 8550000, 367650000, 'Transfer');
CALL transaksi_pembelian('PE-7', '2023-01-10', 'KR00004', 'ES0001', 'AP', 'Iphone 13 Pro', 'Layar: 6.1 inci, Penyimpanan: 256GB', 'White', 32, 18050000, 577600000, 'Debit');
CALL transaksi_pembelian('PE-8', '2023-01-11', 'KR00004', 'ES0001', 'AP', 'Iphone 13', 'Layar: 6.1 inci, Penyimpanan: 256GB', 'Silver', 42, 11400000, 478800000, 'Debit');
CALL transaksi_pembelian('PE-9', '2023-01-12', 'KR00004', 'ES0001', 'AP', 'Iphone 13 Mini', 'Layar: 5.4 inci, Penyimpanan: 128GB', 'Black', 47, 10165000, 477755000, 'Transfer');
CALL transaksi_pembelian('PE-10', '2023-01-13', 'KR00005', 'ES0002', 'AS', 'Expertbook B9', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'Black', 28, 13110000, 367080000, 'Debit');
CALL transaksi_pembelian('PE-11', '2023-01-14', 'KR00005', 'ES0002', 'AS', 'Expertbook P1', 'Prosesor: Intel Core i7, RAM: 16GB, Penyimpanan: SSD 1TB, Layar: 13.4 inci', 'Black', 48, 14250000, 684000000, 'Transfer');
CALL transaksi_pembelian('PE-12', '2023-01-15', 'KR00005', 'ES0002', 'AS', 'Expertbook B1', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'Black', 42, 15675000, 658350000, 'Transfer');
CALL transaksi_pembelian('PE-13', '2023-01-19', 'KR00007', 'ES0001', 'XI', 'Redmi Note 10', 'Layar: 6.43 inci, RAM/ROM: 4GB/64GB, Baterai: 5000 mAh', 'Silver', 20, 2945000, 58900000, 'Tunai');
CALL transaksi_pembelian('PE-14', '2023-01-20', 'KR00007', 'ES0001', 'XI', 'Redmi Note 10', 'Layar: 6.43 inci, RAM/ROM: 6GB/128GB, Baterai: 5000 mAh', 'White', 25, 3800000, 95000000, 'Transfer');
CALL transaksi_pembelian('PE-15', '2023-01-21', 'KR00007', 'ES0001', 'XI', 'Redmi Note 9', 'Layar: 6.53 inci, RAM/ROM: 4GB/64GB, Baterai: 5020 mAh', 'Silver', 16, 3610000, 57760000, 'Tunai');
CALL transaksi_pembelian('PE-16', '2023-01-22', 'KR00008', 'ES0002', 'LE', 'Flex 3', 'Prosesor: Intel Core i9, RAM: 32GB, Penyimpanan: SSD 1TB, Layar: 15.6 inci', 'Silver', 42, 7600000, 319200000, 'Debit');
CALL transaksi_pembelian('PE-17', '2023-01-23', 'KR00008', 'ES0002', 'LE', 'Flex 5', 'Prosesor: Intel Core i7, RAM: 16GB, Penyimpanan: SSD 1TB, Layar: 13.4 inci', 'Black', 44, 8075000, 355300000, 'Debit');

-- CEK PRODUK AFTER TRANSAKSI
SELECT * FROM Transaksi_Pembelian;
SELECT * FROM Stok_Produk;

-- CETAK NOTA UNTUK CUSTOMER
DELIMITER //
CREATE PROCEDURE Cetak_Nota(IN ID_Transaksi_Penjualan VARCHAR(10))
BEGIN
    SELECT
		ID_Transaksi_Penjualan,
        ID_Karyawan,
        Tanggal_Keluar,
        CONCAT(ID_Merk, "_", Tipe, "_", Spesifikasi, "_", Warna) AS Deskripsi,
        Jumlah,
        Harga_Jual,
        (Jumlah * Harga_Jual) AS total_harga,
        Metode_Pembayaran
    FROM Transaksi_Penjualan
    WHERE Transaksi_Penjualan.ID_Transaksi_Penjualan = ID_Transaksi_Penjualan;
END //
DELIMITER ;

SELECT * FROM Stok_Produk;
CALL Cetak_Nota('PU-1');
SELECT * FROM Transaksi_Penjualan;
SELECT * FROM Transaksi_Penjualan WHERE ID_Transaksi_Penjualan = "PU-1";
