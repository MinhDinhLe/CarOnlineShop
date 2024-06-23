package Controller;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import Utils.JpaUtils;
import model.Lineitem;
import model.Product;

public class lineitemDAO {
	public List<Lineitem> allLineItem() {
		EntityManager em = JpaUtils.getEntityManager();
		TypedQuery<Lineitem> query = em.createNamedQuery("Lineitem.findAll", Lineitem.class);
		return query.getResultList();
	}
	
	public Lineitem item(int lineitemID) {
		for (var litem : this.allLineItem()) {
			if (litem.getLineItemID() == lineitemID) {
				return litem;
			}
		}
		return null;
	}
}
