package Dao;

import com.sun.istack.internal.Nullable;
import model.Admin;
import model.ConnectionDb;
import model.Product;

import javax.servlet.http.HttpSession;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class DaoAdmin implements Dao<Admin> {
    private Connection con ;

    private static DaoAdmin daoAdmin;

    private DaoAdmin() {
        this.con = ConnectionDb.getConnection();
    }



    public static DaoAdmin getInstance(){
        if(daoAdmin == null){
            daoAdmin = new DaoAdmin() ;
        }
        return daoAdmin;
    }


    @Override
    public boolean add(Admin product) throws SQLException {
        Boolean bool;
        Statement statement;
        statement =  con.createStatement();
        bool = statement.execute("INSERT INTO admins (username,password) VALUES (" +
                "'"+product.getUsername()+"" +
                "', '" + product.getPassword()+"')");
        statement.close();

        return bool;
    }


    @Override
    public Boolean delete() {
        return null;
    }

    @Override
    public List<Admin> getAll(@Nullable String s) {
       return null;
    }

    @Override
    public Admin get(int id) {
        return null;
    }

    public int getAuthentication(String username,String password)  {
        ResultSet result;
        Statement statement;
        int id = 0;
        String sql = "SELECT id FROM j2ee.admins WHERE username='"+username+"' and password ='"+sha256(username.trim()+password.trim())+"' LIMIT 1";
        try {
            statement = con.createStatement();
            result = statement.executeQuery(sql);
            if (!result.first()) id =  0;
            else {
                id = result.getInt("id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return id;
    }

    private static String sha256(String base) {
        try{
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(base.getBytes(StandardCharsets.UTF_8));
            StringBuilder hexString = new StringBuilder();

            for (byte hash1 : hash) {
                String hex = Integer.toHexString(0xff & hash1);
                if (hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }

            return hexString.toString();
        } catch(Exception ex){
            throw new RuntimeException(ex);
        }
    }
}

