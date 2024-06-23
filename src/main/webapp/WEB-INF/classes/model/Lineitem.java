package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the lineitem database table.
 * 
 */
@Entity
@NamedQuery(name="Lineitem.findAll", query="SELECT l FROM Lineitem l")
public class Lineitem implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int lineItemID;

	private int carID;

	private int customerID;

	private int quantity;

	private byte status;

	public Lineitem() {
	}

	public int getLineItemID() {
		return this.lineItemID;
	}

	public void setLineItemID(int lineItemID) {
		this.lineItemID = lineItemID;
	}

	public int getCarID() {
		return this.carID;
	}

	public void setCarID(int carID) {
		this.carID = carID;
	}

	public int getCustomerID() {
		return this.customerID;
	}

	public void setCustomerID(int customerID) {
		this.customerID = customerID;
	}

	public int getQuantity() {
		return this.quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public byte getStatus() {
		return this.status;
	}

	public void setStatus(byte status) {
		this.status = status;
	}

}