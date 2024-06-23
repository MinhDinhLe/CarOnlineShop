package DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import Utils.JpaUtils;
import model.Customer;
import model.Product;

public class cusDAO {
	public List<Customer> allCustomer() {
		EntityManager em = JpaUtils.getEntityManager();
		TypedQuery<Customer> query = em.createNamedQuery("Customer.findAll", Customer.class);
		return query.getResultList();
	}
	public Customer cus (int cusID)
	{
		for (var a : this.allCustomer())
		{
			if ( a.getCustomerID() == cusID)
			{
				return a;
			}
		}
		return null;
	}
	public int insert(Customer cs) {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction trans = em.getTransaction();
		try {
			trans.begin();
			em.persist(cs);
			trans.commit();
		} catch ( Exception e) {
			trans.rollback();
			return -1;
		} finally {
			em.close();
		}
		return 1;
	}
	public void editCus(Customer customer) {
	    EntityManager em = JpaUtils.getEntityManager();
	    EntityTransaction trans = em.getTransaction();

	    try {
	        trans.begin();

	        // Thực hiện thêm sản phẩm vào cơ sở dữ liệu
	       em.merge(customer);

	        trans.commit();
	    } catch (Exception e) {
	        if (trans != null) {
	            trans.rollback();
	        }
	        e.printStackTrace();
	    } finally {
	        em.close();
	    }
	}
}