CREATE DATABASE IF NOT EXISTS yurt_otomasyon;
USE yurt_otomasyon;

CREATE TABLE IF NOT EXISTS kullanicilar (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tc VARCHAR(11) UNIQUE NOT NULL,
    sifre VARCHAR(50) NOT NULL,
    ad VARCHAR(50),
    soyad VARCHAR(50),
    tip VARCHAR(10),
    oda_no VARCHAR(10),
    yurtta_mi BOOLEAN DEFAULT 1
);

CREATE TABLE IF NOT EXISTS urunler (
    id INT PRIMARY KEY AUTO_INCREMENT,
    isim VARCHAR(100),
    fiyat DOUBLE,
    resim_yolu VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS teknik_talepler (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ogrenci_id INT,
    kategori VARCHAR(50),
    aciklama TEXT,
    durum VARCHAR(20) DEFAULT 'Beklemede',
    FOREIGN KEY (ogrenci_id) REFERENCES kullanicilar(id)
);

CREATE TABLE IF NOT EXISTS makineler (
    id INT PRIMARY KEY AUTO_INCREMENT,
    makine_no INT UNIQUE,
    bitis_zamani DATETIME,
    dolu_mu BOOLEAN DEFAULT 0,
    ogr_ad VARCHAR(50),
    ogr_soyad VARCHAR(50),
    ogr_tel VARCHAR(15),
    ogr_oda VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS yemek_menusu (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tarih DATE UNIQUE,
    liste TEXT
);

INSERT IGNORE INTO kullanicilar (tc, sifre, ad, soyad, tip) VALUES ('12345678901', '123', 'Ahmet', 'Yılmaz', 'IDARE');
INSERT IGNORE INTO kullanicilar (tc, sifre, ad, soyad, tip, oda_no, yurtta_mi) VALUES ('10091231962', '111', 'Yeni', 'Öğrenci', 'OGRENCI', '102', 1);
INSERT IGNORE INTO yemek_menusu (tarih, liste) VALUES (CURDATE(), 'Yayla Çorbası, Tavuk Haşlama, Bulgur Pilavı, Meyve');