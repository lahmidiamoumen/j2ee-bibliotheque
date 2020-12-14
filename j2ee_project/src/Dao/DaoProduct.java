package Dao;

import com.sun.istack.internal.Nullable;
import model.ConnectionDb;
import model.Product;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class DaoProduct implements Dao<Product> {

    private Connection con  = ConnectionDb.getConnection();


    @Override
    public boolean add(Product product) throws SQLException {
        Boolean bool;
        Statement statement;
        statement =  con.createStatement();
        bool = statement.execute("INSERT INTO produit (libelle, photo, prix, qts) VALUES (" +
                "'"+product.getLibelle()+"', " +
                "'"+product.getPhoto()+"', " +
                product.getPrix()+", "+
                product.getQte()+")");
        statement.close();

        return bool;
    }


    @Override
    public Boolean delete() {
        return null;
    }

    @Override
    public List<Product> getAll(@Nullable String s) {
        String sql;
        List<Product> list = new ArrayList<>();
        ResultSet result;
        Statement statement;

        if(s == null){
            sql = "SELECT * FROM  j2ee.produit";
        }else {
            String str = Optional.of(s).orElse("");
            sql = "SELECT * FROM  j2ee.produit WHERE libelle like '%"+str+"%' nom,prenom limit 10";
        }

        try {
            statement = con.createStatement();
            result = statement.executeQuery(sql);
            if (!result.first()) return null;
            else {
                do{
                    list.add(new Product(
                            result.getString("libelle"),
                            result.getString("photo"),
                            result.getString("prix"),
                            result.getString("qts")
                    ));
                    System.out.println(result.getString("libelle"));
                }while (result.next());
            }
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public Product get(int id) {
        return null;
    }
}

