package Dao;

/**
 * This class created by Moumen on 1-14-2020
 * Data Access Object Interface is responsible
 * for defining the methods that access the database
 **/

import com.sun.istack.internal.Nullable;

import java.sql.SQLException;
import java.util.List;

public interface Dao<T> {

    public boolean add(T t) throws SQLException;
    public Boolean delete();
    public List<T> getAll(@Nullable String s);
    public T get(int id);
}
