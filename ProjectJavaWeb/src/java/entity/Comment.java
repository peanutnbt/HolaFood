/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import dao.UsersDAO;

/**
 *
 * @author ASUS
 */
public class Comment {
    private int commentId;
    private int shopId;
    private int userId;
    private String content;

    public Comment() {
    }

    public Comment(int commentId, int shopId, int userId, String content) {
        this.commentId = commentId;
        this.shopId = shopId;
        this.userId = userId;
        this.content = content;
    }

    public Comment(int shopId, int userId, String content) {
        this.shopId = shopId;
        this.userId = userId;
        this.content = content;
    }

    public int getCommentId() {
        return commentId;
    }

    public int getShopId() {
        return shopId;
    }

    public void setShopId(int shopId) {
        this.shopId = shopId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
    public Users getUser() throws Exception{
        UsersDAO userdao=new UsersDAO();
        Users user =userdao.selectById(userId);
        return user;
    }
    
}
