package com.eventmanagement.dbutil;

import com.eventmanagement.*;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.eventmanagement.modals.*;

public class AccountUtil extends config {

    // public boolean Default() throws SQLException {
    // boolean result = false;

    // PreparedStatement pstmt = null;
    // ResultSet rs = null;

    // Connect();
    // try {
    // // some code here
    // } catch (Exception e) {
    // } finally {
    // DisConnect();
    // rs.close();
    // pstmt.close();
    // }
    // DisConnect();
    // return result;
    // }

    public boolean InsertUser(Users users) throws SQLException {
        boolean result = false;
        Connect();
        try {
            PreparedStatement ps = conn.prepareStatement(
                    "INSERT INTO users (name, email, password, mobile, datetime) values (?, ?, ?, ?, ?)");
            ps.setString(1, users.getName());
            ps.setString(2, users.getEmail());
            ps.setString(3, users.getPassword());
            ps.setString(4, users.getMobile());
            ps.setString(5, users.getDateTime());

            int rows = ps.executeUpdate();

            if (rows > 0) {
                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        DisConnect();
        return result;
    }

    public int UserLogin(String Email, String Password) throws SQLException {
        int ID = 0;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        Connect();
        try {
            pstmt = conn.prepareStatement("SELECT * FROM users WHERE email = ? AND password = ?");
            pstmt.setString(1, Email);
            pstmt.setString(2, Password);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                ID = rs.getInt("user_id");
            }

        } catch (Exception e) {
        } finally {
            DisConnect();
            rs.close();
            pstmt.close();
        }

        return ID;
    }

    public Users GetUserByID(int ID) throws SQLException {
        Users users = new Users();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        Connect();
        try {
            pstmt = conn.prepareStatement("SELECT * FROM users WHERE user_id = ? ");
            pstmt.setInt(1, ID);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                users = new Users(rs.getInt("user_id"), rs.getString("name"), rs.getString("email"),
                        rs.getString("password"), rs.getString("mobile"), rs.getString("datetime"));
            }
        } catch (Exception e) {
        } finally {
            DisConnect();
            rs.close();
            pstmt.close();
        }
        DisConnect();
        return users;
    }

    public ArrayList<Users> AllUsers() throws SQLException {
        ArrayList<Users> list = new ArrayList<Users>();

        PreparedStatement pstmt = null;
        ResultSet rs = null;

        Connect();
        try {
            pstmt = conn.prepareStatement("SELECT * FROM users");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Users users = new Users(rs.getInt("user_id"), rs.getString("name"), rs.getString("email"),
                        rs.getString("password"), rs.getString("mobile"), rs.getString("datetime"));
                list.add(users);
            }
        } catch (Exception e) {
        } finally {
            DisConnect();
            rs.close();
            pstmt.close();
        }
        DisConnect();
        return list;
    }

    public int AdminLogin(String Email, String Password) throws SQLException {
        int ID = 0;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        Connect();
        try {
            pstmt = conn.prepareStatement("SELECT * FROM admin WHERE email = ? AND password = ?");
            pstmt.setString(1, Email);
            pstmt.setString(2, Password);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                ID = rs.getInt("id");
            }

        } catch (Exception e) {
        } finally {
            DisConnect();
            rs.close();
            pstmt.close();
        }

        return ID;
    }

    public Users GetAdminByID(int ID) throws SQLException {
        Users users = new Users();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        Connect();
        try {
            pstmt = conn.prepareStatement("SELECT * FROM admin WHERE id = ? ");
            pstmt.setInt(1, ID);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                users = new Users(rs.getInt("id"), rs.getString("name"), rs.getString("email"),
                        rs.getString("password"));
            }
        } catch (Exception e) {
        } finally {
            DisConnect();
            rs.close();
            pstmt.close();
        }
        DisConnect();
        return users;
    }

}
