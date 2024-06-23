package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the admin database table.
 * 
 */
@Entity
@NamedQuery(name="Admin.findAll", query="SELECT a FROM Admin a")
public class Admin implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int adminID;

	private String passwd;

	private String userName;

	//bi-directional many-to-one association to Product
	@OneToMany(mappedBy="admin")
	private List<Product> products;

	public Admin() {
	}

	public int getAdminID() {
		return this.adminID;
	}

	public void setAdminID(int adminID) {
		this.adminID = adminID;
	}

	public String getPasswd() {
		return this.passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public List<Product> getProducts() {
		return this.products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public Product addProduct(Product product) {
		getProducts().add(product);
		product.setAdmin(this);

		return product;
	}

	public Product removeProduct(Product product) {
		getProducts().remove(product);
		product.setAdmin(null);

		return product;
	}

}