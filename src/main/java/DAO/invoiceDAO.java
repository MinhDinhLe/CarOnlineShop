package DAO;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import Utils.JpaUtils;
import model.Customer;
import model.Invoice;
import model.Lineitem;
import model.Product;

public class invoiceDAO {
	public static List<Invoice> allInv() {
		EntityManager em = JpaUtils.getEntityManager();
		TypedQuery<Invoice> query = em.createNamedQuery("Invoice.findAll", Invoice.class);
		return query.getResultList();
	}
	
	public void addInvoice(Invoice invoice)
	{
		EntityManager em = JpaUtils.getEntityManager();
        
        try {
            em.getTransaction().begin();
            em.persist(invoice);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
        } finally {
            em.close();
        }
	}
	
	public List<Integer> ListCusID() {
	    List<Integer> lstCusID = new ArrayList<Integer>();
	    List<Invoice> lstInv = this.allInv();
	    if (!lstInv.isEmpty()) {
	        for (Invoice invoice : lstInv) {
	            int customerID = invoice.getCustomerID();
	            if (!lstCusID.contains(customerID)) {
	                lstCusID.add(customerID);
	            }
	        }
	    }
	    return lstCusID;
	}
	
	public List<Invoice> Cus_Invoice(int cusID) 
	{
		List<Invoice> cus_invoice = new ArrayList<Invoice>();
		for (var b : this.allInv()) {
			if (b.getCustomerID() == cusID)
			{
				cus_invoice.add(b);
			}
		}
		return cus_invoice;
	}
	
	public List<Integer> Total_Highest()
	{
		int total = 0;
		int total_single = 0;
		int cusID = -1;
		List<Integer> total_CusID = new ArrayList<>();
		for (var a : this.ListCusID())
		{
			total_single = 0;
			for (var b : this.Cus_Invoice(a))
			{
				total_single += b.getTotal();
			}
			if (total < total_single)
			{
				total = total_single;
				cusID = a;
			}
		}
		
		total_CusID.add(total);
		total_CusID.add(cusID);
		
		return total_CusID;
	}
	
	public Double Total_Invoice()
	{
		double total = 0;
		for (var a: this.allInv())
		{
			total += a.getTotal();
		}
		
		return total;
	}
}

