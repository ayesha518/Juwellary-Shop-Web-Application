package cn.techtutorial.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.techtutorial.model.Cart;
import cn.techtutorial.model.product;
public class ProductDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	public ProductDao(Connection con) {

		this.con = con;
	}

	// Inside ProductDao.java
	public List<Cart> getCartProducts(ArrayList<Cart> cartList) throws SQLException {
	    List<Cart> products = new ArrayList<>();
	    String query = "SELECT * FROM products WHERE id = ?";
	    PreparedStatement pst = null;
	    ResultSet rs = null;

	    for (Cart item : cartList) {
	        pst = this.con.prepareStatement(query);
	        pst.setInt(1, item.getId());
	        rs = pst.executeQuery();

	        while (rs.next()) {
	            Cart row = new Cart();
	            row.setId(rs.getInt("id"));
	            row.setName(rs.getString("name"));
	            row.setCategory(rs.getString("category"));
	            row.setPrice(rs.getDouble("price") * item.getQuantity());
	            row.setQuantity(item.getQuantity());
	            products.add(row);
	        }
	    }
	    return products;
	}


	public List<product> getAllProduct() {
	    List<product> products = new ArrayList<>();
	    try {
	        query = "SELECT * FROM products";
	        pst = this.con.prepareStatement(query);
	        rs = pst.executeQuery();

	        while (rs.next()) {
	            product p = new product();
	            p.setId(rs.getInt("id"));
	            p.setName(rs.getString("name"));
	            p.setCategory(rs.getString("category"));
	            p.setPrice(rs.getDouble("price"));
	            p.setImage(rs.getString("image"));

	            products.add(p);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return products;
	}




}
