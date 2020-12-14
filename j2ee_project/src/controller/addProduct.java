package controller;

import Dao.DaoProduct;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.nio.file.Paths;
import java.sql.SQLException;

@WebServlet("/upload")
@MultipartConfig
public class addProduct extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        String fileName;
        String relativeWebPath = "/images";
        String absoluteDiskPath = getServletContext().getRealPath(relativeWebPath);

        String libelle  = req.getParameter("libelle");
        String qte  = req.getParameter("qte");
        String prix  = req.getParameter("prix");
        Part filePart = req.getPart("photo"); // Retrieves <input type="file" name="file">
        if(filePart == null){
            fileName = "vide";
        }
        else {
            fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
            File file = new File(absoluteDiskPath, fileName);

            InputStream fileContent = filePart.getInputStream();
            copyInputStreamToFile(fileContent, file);
        }

        Product p = new Product(libelle,fileName,prix,qte);
        DaoProduct daoProduct = new DaoProduct();
        try {
            daoProduct.add(p);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        resp.sendRedirect("home?produit&sucess=1");

    }

    private static void copyInputStreamToFile(InputStream inputStream, File file)
            throws IOException {

        try (FileOutputStream outputStream = new FileOutputStream(file)) {

            int read;
            byte[] bytes = new byte[1024];

            while ((read = inputStream.read(bytes)) != -1) {
                outputStream.write(bytes, 0, read);
            }

        }

    }
}
