--Function olusturma
--Intelijde {} suslu parantez kullanirdik SQL(pgadmin4) ise $$ isareti kullanilir acma kapatma islemi icin 
--1. Örnek: İki parametre ile çalışıp bu parametreleri 
--toplayarak return yapan bir fonksiyon oluşturun.

CREATE FUNCTION toplamaF(x NUMERIC, y NUMERIC) -- toplamaF toplama fonksiyonu
RETURNS NUMERIC
LANGUAGE plpgsql -- prossesor language pgsql 
AS
$$
BEGIN

RETURN x+y;

END
$$

SELECT * FROM toplamaF(15,25) AS toplam;