/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import entity.Users;

/**
 *
 * @author PHINC
 */
public class UploadImages {
    public static String getNewNameAndStore(HttpServletRequest req,String location,String fileNameSave,String inputName) throws ServletException, IOException {
        Part part = req.getPart(inputName);
        String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
        if (!fileName.isEmpty()) {
            String extension = fileName.replaceFirst("^[^.]+", "");
            BufferedInputStream bis = new BufferedInputStream(part.getInputStream());
            String fullPath = location +"/"+ fileNameSave+"."+extractFileName(part);
            BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(fullPath));
            int ch = 0;
            while ((ch = bis.read()) != -1) {
                bos.write(ch);
            }
            bos.close();
            bis.close();
            return fileNameSave+"."+extractFileName(part);
        } else {
            return null;
        }
    }
    private static String extractFileName(Part part) {
       // form-data; name="file"; filename="C:\file1.zip"
       // form-data; name="file"; filename="C:\Note\file2.zip"
       String contentDisp = part.getHeader("content-disposition");
       String[] items = contentDisp.split(";");
       for (String s : items) {
           if (s.trim().startsWith("filename")) {
               // C:\file1.zip
               // C:\Note\file2.zip
               String clientFileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
//               clientFileName = clientFileName.replace("\\", "/");
               int i = clientFileName.lastIndexOf('.');
               // file1.zip
               // file2.zip
               System.out.println("Return = " + clientFileName.substring(i + 1));
               return clientFileName.substring(i + 1);
           }
       }
       return null;
   }
}
