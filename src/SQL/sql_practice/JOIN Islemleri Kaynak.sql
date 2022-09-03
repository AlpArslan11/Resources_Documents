/*============================== JOIN İSLEMLERİ ===============================
    foreıgn key id si ortakları yanyana yazıyordu bu bikaç tablodan istenilen
    sütunları alır birleştirir. set istenilen sütunları tek sütunda birleştirir
    Set Operatorleri (Union,Intersect,Minus) farklı tablolardaki sutunlari
    birlestirmek için de kullanilir.
    Join islemleri ise farklı Tablolari birlestirmek icin kullanilir. Diger
    bir ifade ile farkli tablolardaki secilen sutunlar ile yeni bir tablo
    olusturmak icin kullanilabilir.
    JOIN islemleri Iliskisel Veritabanlari icin cok onemli bir ozelliktir. Çunku
    Foreign Key'ler ile iliskili olan tablolardan istenilen sutunlari cekmek
    icin JOIN islemleri kullanilabilir.
    ORACLE SQL'de 4 Cesit Join islemi kullanilabilmektedir.
    1) FULL JOIN:  Tablodaki tum sonuclari gosterir
    2) INNER JOIN:  Tablolardaki ortak olan sonuc kumesini gosterir
    3) LEFT JOIN:  Ilk tabloda (Sol) olup digerinde olmayan sonuclari gosterir
    4) RIGHT JOIN: Sadece Ikinci tabloda olan tum sonuclari gosterir*/
    
    
    CREATE TABLE sirketler1 (
        sirket_id NUMBER(9),
        sirket_isim VARCHAR2(20)
    );
    
    INSERT INTO sirketler1 VALUES(100, 'Toyota');
    INSERT INTO sirketler1 VALUES(101, 'Honda');
    INSERT INTO sirketler1 VALUES(102, 'Ford');
    INSERT INTO sirketler1 VALUES(103, 'Hyundai');
    CREATE TABLE siparisler2
    (
        siparis_id NUMBER(9),
        sirket_id NUMBER(9),
        siparis_tarihi DATE
    );
    INSERT INTO siparisler2 VALUES(11, 101, '17-04-2020');
    INSERT INTO siparisler2 VALUES(22, 102, '18-04-2020');
    INSERT INTO siparisler2 VALUES(33, 103, '19-04-2020');
    INSERT INTO siparisler2 VALUES(44, 104, '20-04-2020');
    INSERT INTO siparisler2 VALUES(55, 105, '21-04-2020');
    SELECT * FROM siparisler2;
    SELECT * FROM sirketler1;
/*=============================== FULL JOIN  ==================================
    FULL JOIN, Her iki tablo icin secilen sutunlara ait olan tum satirlari
    getirmek icin kullanilir. ortaklar aynı satırda yazılır, extra fazla satır varsa o da yazılır.
    Syntax
    -----------
    SELECT sutun1,sutun2....sutunN
    FROM tablo1
    FULL JOIN tablo2
    ON tablo1.sutun = tablo2.sutun;
==============================================================================*/
/* -----------------------------------------------------------------------------
  ORNEK1: sirketler ve siparisler adındaki tablolarda yer alan sirket_isim,
  siparis_id ve siparis_tarihleri listeleyen bir sorgu yaziniz.
------------------------------------------------------------------------------*/
SELECT sirket_isim, siparis_id, siparis_tarihi, sp.sırket_ıd
FROM sirketler1 s
FULL JOIN siparisler2 sp
ON sp.sirket_id=s.sirket_id;
/*=============================== INNER JOIN  ==================================
    Iki tablonun kesisim kumesi ile yeni bir tablo olusturmak icin kullanilir.
    Syntax
    -----------
    SELECT sutun1,sutun2....sutunN
    FROM tablo1
    INNER JOIN tablo2
    ON tablo1.sutun = tablo2.sutun;
================================================================================*/
 -----------------------------------------------------------------------------
--ORNEK2: Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
--siparis_tarihleri listeleyen bir sorgu yaziniz. null olanlar çıkmıcak çünkü 
--NULL ortak değil(bir tabloda null iken diğerinde id null yok, 100, 101 vs var)
SELECT sirket_isim, siparis_id, siparis_tarihi, sp.sırket_ıd
FROM sirketler1 s
INNER JOIN siparisler2 sp
ON sp.sirket_id=s.sirket_id;
-- INNER JOIN ile sadece iki tablodaki ortak olan satirlar secilir.
-- Diger ifadeyle iki tablodaki ortak olan sirket_id degerleri icin ilgili
-- sutunlar listenir.
 /*=============================== LEFT JOIN  ==================================
    LEFT JOIN, 1. tablodan (sol tablo) SELECT ile ifade edilen sutunlara ait tum
    satirlari getirir.
    Ancak, diger tablodan sadece ON ile belirtilen 2.tablodan kosula uyan satirlari getirir.
    -- ancak ortak olmayan kisimlar bos kalir. 2. tablodan 104,105 yok mesela.
    Syntax
    -----------
    SELECT sutun1,sutun2....sutunN
    FROM tablo1
    LEFT JOIN tablo2
    ON tablo1.sutun = tablo2.sutun;
==============================================================================*/
/* -----------------------------------------------------------------------------
  ORNEK3: sirketler tablosundaki tum sirketleri ve bu sirketlere ait olan
  siparis_id ve siparis_tarihleri listeleyen bir sorgu yaziniz.
------------------------------------------------------------------------------*/
SELECT sirket_isim,siparis_id, siparis_tarihi, sp.sırket_ıd
FROM sirketler1 s
LEFT JOIN siparisler2 sp
ON sp.sirket_id=s.sirket_id;
/*============================== RIGHT JOIN  ==================================
    RIGHT JOIN, 2. tablodan (sag tablo) SELECT ile ifade edilen sutunlara ait tum
    satirlari getirir.
     diger tablodan sadece ON ile belirtilen 1. tablodan kosula uyan (ortak) satirlari getirir.
    ancak ortak olmayan kisimlar bos kalir.1. tablodaki Toyota yazılmaz, ortak olmadığı için
    Syntax
    -----------
    SELECT sutun1,sutun2....sutunN
    FROM tablo1
    RIGHT JOIN tablo2
    ON tablo1.sutun = tablo2.sutun;
==============================================================================*/
/* -----------------------------------------------------------------------------
  ORNEK4: siparisler tablosundaki tum siparis_id ve siparis_tarihleri ile
  bunlara karşılık gelen sirket_isimlerini listeleyen bir sorgu yaziniz.
------------------------------------------------------------------------------*/
SELECT siparis_id, siparis_tarihi,sirket_isim
FROM sirketler1 s
RIGHT JOIN siparisler2 sp
ON sp.sirket_id=s.sirket_id;
CREATE TABLE bolumler (
      bolum_id   NUMBER(2) ,
      bolum_isim VARCHAR2(14),
      konum      VARCHAR2(13)
    );
    INSERT INTO bolumler VALUES (10,'MUHASABE','IST');
    INSERT INTO bolumler VALUES (20,'MUDURLUK','ANKARA');
    INSERT INTO bolumler VALUES (30,'SATIS','IZMIR');
    INSERT INTO bolumler VALUES (40,'ISLETME','BURSA');
    INSERT INTO bolumler VALUES (50,'DEPO', 'YOZGAT');
    SELECT * FROM bolumler;
    commit;
    CREATE TABLE personel7 (
      personel_id   NUMBER(4) ,
      personel_isim VARCHAR2(10),
      meslek        VARCHAR2(9),
      mudur_id      NUMBER(4),
      ise_baslama   DATE,
      maas          NUMBER(7,2),
      bolum_id      NUMBER(2)
    );
   
    INSERT INTO personel7 VALUES (7369,'AHMET','KATIP',7902,'17.12.1980',800,20);
    INSERT INTO personel7 VALUES (7499,'BAHATTIN','SATIS',7698,'20.02.1981',1600,30);
    INSERT INTO personel7 VALUES (7521,'NESE','SATIS',7698,'22.02.1981',1250,30);
    INSERT INTO personel7 VALUES (7566,'MUZAFFER','MUDUR',7839,'02.04.1981',2975,20);
    INSERT INTO personel7 VALUES (7654,'MUHAMMET','SATIS',7698,'28.09.1981',1250,30);
    INSERT INTO personel7 VALUES (7698,'EMINE','MUDUR',7839,'01.05.1981',2850,30);
    INSERT INTO personel7 VALUES (7782,'HARUN','MUDUR',7839,'09.06.1981', 2450,10);
    INSERT INTO personel7 VALUES (7788,'MESUT','ANALIST',7566,'13.07.87',3000,20);
    INSERT INTO personel7 VALUES (7839,'SEHER','BASKAN',NULL,'17.11.1981',5000,10);
    INSERT INTO personel7 VALUES (7844,'DUYGU','SATIS',7698,'08.09.1981',1500,30);
    INSERT INTO personel7 VALUES (7876,'ALI','KATIP',7788,'13.07.1987',1100,20);
    INSERT INTO personel7 VALUES (7900,'MERVE','KATIP',7698,'03.12.1981',950,30);
    INSERT INTO personel7 VALUES (7902,'NAZLI','ANALIST',7566,'03.12.1981',3000,20);
    INSERT INTO personel7 VALUES (7934,'EBRU','KATIP',7782,'23.01.1982',1300,10);
    INSERT INTO personel7 VALUES (7956,'SIBEL','MIMAR',7782,'29.01.1991',3300,60);
    INSERT INTO personel7 VALUES (7933,'ZEKI','MUHENDIS',7782,'26.01.1987',4300,60);
    SELECT * FROM personel7;
--  ORNEK1: SATIS ve MUHASABE bolumlerinde calisan personelin isimlerini ve
--bolumlerini, once bolum sonra isim sıralı olarak listeleyiniz
SELECT personel_isim,bolum_isim
FROM personel7 p
FULL JOIN bolumler b
ON b.bolum_ıd=p.bolum_ıd
WHERE bolum_isim IN('MUHASABE','SATIS')
ORDER BY bolum_isim,personel_isim; 
--ORNEK2: SATIS,ISLETME ve DEPO bolumlerinde calisan personelin isimlerini,
-- bolumlerini ve ise_baslama tarihlerini bolum_isim sıralı olarak listeleyiniz.
--  NOT: calisani olmasa bile bolum ismi gosterilmelidir
SELECT  personel_isim,bolum_isim,ise_baslama
FROM bolumler p
LEFT JOIN personel7 b
ON b.bolum_ıd=p.bolum_ıd
where bolum_isim IN('SATIS','ISLETME','DEPO')
ORDER BY bolum_ısım;
