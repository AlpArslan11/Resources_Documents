create table musteri(
musteri_adi VARCHAR(50),
musteri_unvani VARCHAR(20),
musteri_tc CHAR(11),
musteri_adres VARCHAR(100)	
);

create table personel(
personel_adi CHAR(50), personel_unvani CHAR(20),
calistigi_sube CHAR(25), personelin_yasi INT
);

--SELECT * FROM musteri;
--SELECT * FROM personel;

create table musteri_deneme AS SELECT musteri_adi, musteri_unvani FROM musteri;