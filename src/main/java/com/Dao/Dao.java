package com.Dao;


import com.Model.Model;


import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Base64;

public class Dao {
    static Connection con = null;
    static
    {
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            //database_name --> evoting
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/evoting", "root", "");
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    public static ResultSet loginValidation(String sql) throws SQLException{
        PreparedStatement ps=con.prepareStatement(sql);
        ResultSet rs  = ps.executeQuery();
        return rs;
    }
    public static ResultSet adminValid(Model m) throws SQLException{
        String sql="select adminId,username,password from admin where username=? and password=?";

        PreparedStatement ps=con.prepareStatement(sql);
        ps.setString(1,m.getUserName());
        ps.setString(2,m.getPass());

        ResultSet rs= ps.executeQuery();
        return rs;
    }

    public static ResultSet voterValid(Model m) throws SQLException{
        String sql="select voter_card_number,password,username from login where voter_card_number=? and password=?";
        PreparedStatement ps=con.prepareStatement(sql);
        ps.setString(1, m.getVoterId());
        ps.setString(2,m.getPass());
        ResultSet rs  = ps.executeQuery();
        return rs;
    }
    public static ResultSet valid1(String sql) throws SQLException{
        PreparedStatement ps=con.prepareStatement(sql);
        ResultSet rs  = ps.executeQuery();
        return rs;
    }

    public static int votePublish(Model m) throws SQLException{
        int result=0;
        String sql="select voter_card_number from login where voter_card_number=?";
        PreparedStatement ps= con.prepareStatement(sql);
        ps.setString(1, m.getVoterId());
        ResultSet rs=ps.executeQuery();
        while (rs.next()){
            String sql2="insert ignore into voter(voter_card_number,voter) values(?,?)";
            PreparedStatement preparedStatement=con.prepareStatement(sql2);
            preparedStatement.setString(1, m.getVoterId());
            preparedStatement.setString(2,m.getVote());
            result=preparedStatement.executeUpdate();
            return result;
        }
        return result;
    }

    public static int register(Model m) throws SQLException{
        int result =0;
        String sql="insert into login(voter_card_number,name,username,gender,dob,email,password) values(?,?,?,?,?,?,?)";
        PreparedStatement ps=con.prepareStatement(sql);
        ps.setString(1, m.getVoterId());
        ps.setString(2, m.getFullName());
        ps.setString(3, m.getUserName());
        ps.setString(4, m.getGender());
        ps.setString(5, m.getDob());
        ps.setString(6, m.getEmail());
        ps.setString(7, m.getPass());

        result = ps.executeUpdate();
        return  result;
    }


    public static int contact(Model m) throws SQLException{
        int result =0;
        String sql="insert into contact(name,company,email,message) values(?,?,?,?)";
        PreparedStatement ps=con.prepareStatement(sql);
        ps.setString(1, m.getFullName());
        ps.setString(2, m.getCompanyName());
        ps.setString(3, m.getEmail());
        ps.setString(4, m.getMessage());

        result =ps.executeUpdate();
        return result;

    }
    public static Model getPic(int  id) throws SQLException, IOException{
        Model model=null;

        String sql="Select * from partytable WHERE pid=?";

        PreparedStatement ps=con.prepareStatement(sql);
        ps.setInt(1,id);
        ResultSet rs=ps.executeQuery();

        if(rs.next()){
            model=new Model();
            String partyCode=rs.getString("partyCode");
            String partyName=rs.getString("partyName");
            Blob blob =rs.getBlob("photo");

            InputStream inputStream=blob.getBinaryStream();
            ByteArrayOutputStream outputStream=new ByteArrayOutputStream();
            byte[] buffer= new byte[4096];
            int bytesRead =-1;

            while ((bytesRead=inputStream.read(buffer))!=-1){
                outputStream.write(buffer,0,bytesRead);
            }

            byte[] imageBytes = outputStream.toByteArray();
            String base64Image = Base64.getEncoder().encodeToString(imageBytes);


            inputStream.close();
            outputStream.close();

           model.setPartyCode(partyCode);
           model.setPartyName(partyName);
           model.setBase64Image(base64Image);
        }
        return model;
    }

    public static int getId(String partyCode) throws SQLException{
        String sql="select pid from partytable Where partyCode=?";
        PreparedStatement ps=con.prepareStatement(sql);
        ps.setString(1,partyCode);
        ResultSet rs= ps.executeQuery();
        while (rs.next()){
            return rs.getInt(1);
        }
        return 0;
    }

    public static int registerAdmin(Model m) throws SQLException{
        int result =0;
        String sql="insert into admin(username,password) values(?,?)";
        PreparedStatement ps=con.prepareStatement(sql);
        ps.setString(1, m.getFullName());
        ps.setString(2, m.getPass());

        result = ps.executeUpdate();
        return  result;
    }
    public static int deleteVoter(String voterid) throws SQLException{
        String sql="delete from login where voter_card_number=?";
        PreparedStatement ps=con.prepareStatement(sql);
        ps.setString(1,voterid);
        return  ps.executeUpdate();

    }

    public static int register(String sql) throws SQLException{
        int result =0;
        PreparedStatement ps=con.prepareStatement(sql);
        result = ps.executeUpdate();
        return  result;
    }
}
