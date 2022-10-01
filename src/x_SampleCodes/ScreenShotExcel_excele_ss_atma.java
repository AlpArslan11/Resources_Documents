package tests.karısıkSoruCozumleri;

import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFClientAnchor;
import org.apache.poi.xssf.usermodel.XSSFDrawing;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.testng.annotations.Test;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

public class excele_ss_atma {


    @Test
    public void testName() throws IOException {

        XSSFWorkbook workbook = new XSSFWorkbook(); //xlsx formatındaki dosyaları okumak/yazmak için kullanılıyor
        XSSFSheet sheet = workbook.createSheet(); // olusan workbook XSSFSheet türünde bir sheet objesi yapti

        Path imagePath = Path.of("...path to your image...");
        byte[] imageContent = Files.readAllBytes(imagePath); // .addPicture byte[] turunde PictureData istiyor

        int pictureIndex = workbook.addPicture(imageContent, Workbook.PICTURE_TYPE_PNG);
        // Option 1: use constructor, parameters 5-8 define starting cell-row and ending cell-row for image position
        // I have no clue what first 4 parameters are doing
        XSSFClientAnchor anchor = new XSSFClientAnchor(0, 0, 0, 0, 3, 3, 6, 12);

      /*

        // Option 2: use Creation Helper and setters for defining starting and ending cell
        XSSFClientAnchor anchor = workbook.getCreationHelper().createClientAnchor();
        anchor.setCol1(3);
        anchor.setRow1(3);
        anchor.setCol2(6);
        anchor.setRow1(12);



       */
        XSSFDrawing drawingPatriarch = sheet.createDrawingPatriarch();
        drawingPatriarch.createPicture(anchor, pictureIndex);

        workbook.write(new FileOutputStream("output.xlsx"));







    }
}
