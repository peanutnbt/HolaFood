/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import Context.DBContext;
import entity.Comment;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class CommentDAO {

    public List<Comment> select(int shopidInput) throws Exception {
        List<Comment> comment = new ArrayList<>();
        String query = "select * from [Comment] where shopid=?";
        Connection con = new DBContext().getConnection();
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, shopidInput);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int commentid = rs.getInt("commentid");
            int shopid = rs.getInt("shopid");
            int userid = rs.getInt("userid");
            String content = rs.getString("content").trim();
            comment.add(new Comment(commentid, shopid, userid, content));
        }
        rs.close();
        con.close();
        return comment;
    }

    public int insert(Comment comment) {
        try (Connection con = new DBContext().getConnection()) {
            String sql = "INSERT INTO [Comment](shopId,userId,content ) values(?,?,?)";
            PreparedStatement psmt = con.prepareStatement(sql);
//            psmt.setInt(1, c.getId());
            psmt.setInt(1, comment.getShopId());
            psmt.setInt(2, comment.getUserId());
            psmt.setString(3, comment.getContent());
            psmt.executeUpdate();
            return 1;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return -1;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }
}
