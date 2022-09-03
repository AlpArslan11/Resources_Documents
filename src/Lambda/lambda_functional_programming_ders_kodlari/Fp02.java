package lambda_functional_programming;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

public class Fp02 {

    /*
    1) t->t "Logic" , (t,u)-> "Logic"
        Bu yapiya "Lambda Expression"
    2) Functional Programming kapsaminda "Lambda Expression" kullanilabilir ama onerilmez.
        "Lambda Expression" yerine "Method Referance" tercih edilir.
    3) "Method Referance" kullanimi "Class Name :: "Method Name"

        Ayni zamanda kendi class'larimizi da kullanabilriz.
        Ornegin bir Animal class'imiz var ve bu calss "eat()" methoduna sahip ==> "Animal :: eat"
     */
    public static void main(String[] args) {
        List<Integer> liste = new ArrayList<>();
        liste.add(8);
        liste.add(9);
        liste.add(131);
        liste.add(10);
        liste.add(9);
        liste.add(10);
        liste.add(2);
        liste.add(8);

        System.out.println(liste);

        listElemanlariniYazdirFunctional(liste);
        System.out.println();
        ciftElemanlariYazdirFunctional(liste);
        System.out.println();
        tekeElemanlarinKareleriniYazdir(liste);
        System.out.println();
        tekarsizTekElemanlarinKupunuYazdir(liste);
        tekrarsizCiftElemanlarinKareToplam01(liste);
        tekrarsizCiftElemanlarinKareToplam03(liste);
        tekrarsizCiftElemanlarinKareToplam03(liste);
        tekrarsizCiftElemanlarinKuplerininCarpimi(liste);
        getMaxEleman(liste);
        yedidenBuyukCiftMin(liste);
        tersSiralamaylaTekrarsizElemanlarinYarisi(liste);




    }

    //1) Ardışık list elemanlarını aynı satırda aralarında boşluk bırakarak yazdıran bir method oluşturun.(Functional ve method reference)
    public static void listElemanlariniYazdirFunctional(List<Integer> list){

        list.stream().forEach(Utils::ayniSatirdaBosluklaYazdir); //  Functional Programming ile yapildi
                                                                 //  Functional Programming'de nasil yapildigina degil ne yapildigina odakalanilir
    }

    //2)Ardışık çift list elementlerini aynı satırda aralarında boşluk bırakarak yazdıran bir method oluşturun.(Functional)
    public static void ciftElemanlariYazdirFunctional(List<Integer> list){
        list.stream().filter(Utils::ciftElemaniSec).forEach(Utils::ayniSatirdaBosluklaYazdir); // Alert !!! test
    }
    //3) Ardışık tek list elemanlarının karelerini aynı satırda aralarında boşluk bırakarak yazdıran bir method oluşturun.(Functional)
    public static void tekeElemanlarinKareleriniYazdir(List<Integer> list){
        list.stream().filter(Utils::tekElemaniSec).map(Utils::karesiniAl).forEach(Utils::ayniSatirdaBosluklaYazdir);
    }

    //4) Ardışık tek list elemanlarının küplerini tekrarsız olarak aynı satırda aralarında boşluk bırakarak yazdıran bir method oluşturun.
    public static void tekarsizTekElemanlarinKupunuYazdir(List<Integer> liste){
        liste.stream().filter(Utils::tekElemaniSec).map(Utils::kupunuAl).forEach(Utils::ayniSatirdaBosluklaYazdir);
    }

    //5) Tekrarsız çift elemanların karelerinin toplamını hesaplayan bir method oluşturun.
    //5)1. yol
    public static void tekrarsizCiftElemanlarinKareToplam01(List<Integer> list){
        Integer toplam = list.stream().distinct().filter(Utils::ciftElemaniSec).map(Utils::karesiniAl).reduce(0,Math::addExact); //addExact toplama yapar, 0 baslangic degeri
        System.out.println("toplam  5) 1. yol = " + toplam);
    }
    //5)2. yol
    public static void tekrarsizCiftElemanlarinKareToplam02(List<Integer> list){
        Integer toplam = list.stream().distinct().filter(Utils::ciftElemaniSec).map(Utils::karesiniAl).reduce(Math::addExact).get(); // get() 0 yazmadan da yapiyor
        System.out.println("toplam  5) 2. yol = " + toplam);
    }

    //5)3. yol
    public static void tekrarsizCiftElemanlarinKareToplam03(List<Integer> list){
        Integer toplam = list.stream().distinct().filter(Utils::ciftElemaniSec).map(Utils::karesiniAl).reduce(0,Integer::sum); //
        System.out.println("toplam  5) 3. yol = " + toplam);
    }

    //6) Tekrarsız çift elemanların küpünün çarpımını hesaplayan bir method oluşturun.
    
    public static void tekrarsizCiftElemanlarinKuplerininCarpimi(List<Integer> list){
        Integer carpim = list.stream().distinct().filter(Utils::ciftElemaniSec).map(Utils::kupunuAl).reduce(1,Math::multiplyExact); // multiplyExact colu carpma

        System.out.println("carpim soru 6) = " + carpim);
    }
    //7) List elemanları arasından en büyük değeri bulan bir method oluşturun.
    public static void getMaxEleman(List<Integer> list){
        Integer max = list.stream().distinct().reduce(Math::max).get(); // get() daha pratik oluyor

        System.out.println("max soru 7)  = " + max);
    }
    //Ödev
    //8)List elemanları arasından en küçük değeri bulan bir method oluşturun.(Method Reference)

    //9) List elemanları arasından 7'den büyük, çift, en küçük değeri bulan bir method oluşturun.
    public static void yedidenBuyukCiftMin(List<Integer> list){
        Integer min = list.stream().distinct().filter(t->t>7).filter(Utils::ciftElemaniSec).reduce(Math::min).get();

        System.out.println("min soru 9) = " + min);
    }
    //10) Ters sıralama ile tekrarsız ve 5'ten büyük elemanların yarı değerlerini(elamanın ikiye bölüm sonucunu) bulan bir method oluşturun.
    public static void tersSiralamaylaTekrarsizElemanlarinYarisi(List<Integer> list){
        List<Double> sonuc = list.
                                stream(). // Gerekli methodlari kullanmamizi saglar
                                distinct(). // Tekrarli olanlari almaz
                                filter(t-> t>5). // Kosula gore filtreleme yapar
                                map(Utils::yarisiAl). // Her bir elemanin degerini degistirmeye yarar
                                sorted(Comparator.reverseOrder()). // Siralama yapar
                                collect(Collectors.toList()); // Elamanları collection'a çevirir.
        System.out.println("sonuc soru 10) = " + sonuc);
    }
    
}

