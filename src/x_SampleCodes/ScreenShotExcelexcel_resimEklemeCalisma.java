package tests.karısıkSoruCozumleri;

import org.apache.commons.compress.utils.IOUtils;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.testng.annotations.Test;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

public class excel_resimEklemeCalisma {


    @Test
    public void testName() throws IOException {

        try {

            Workbook workbook = new XSSFWorkbook();
            Sheet sheet = workbook.createSheet("MYSheet");


            InputStream inputStream = new FileInputStream("path_to_image.jpg");

            byte[] imageBytes = IOUtils.toByteArray(inputStream);

            int pictureureIdx = workbook.addPicture(imageBytes, Workbook.PICTURE_TYPE_PNG);

            inputStream.close();

            CreationHelper helper = workbook.getCreationHelper();

            Drawing drawing = sheet.createDrawingPatriarch();

            ClientAnchor anchor = helper.createClientAnchor();

            anchor.setCol1(1);
            anchor.setRow1(2);

            drawing.createPicture(anchor, pictureureIdx);


            FileOutputStream fileOut = null;
            fileOut = new FileOutputStream("output.xlsx");
            workbook.write(fileOut);
            fileOut.close();
        }catch (Exception e) {
            System.out.println(e);
        }





    }
}