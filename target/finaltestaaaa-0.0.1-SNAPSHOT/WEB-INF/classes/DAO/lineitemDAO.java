package DAO;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
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
	
	public List<Lineitem> allLineItem1() {
		List<Lineitem> items = new ArrayList<Lineitem>();
		for (var a : this.allLineItem())
		{
			if (a.getStatus() == 1) {
				items.add(a);
			}
		}
		return items;
	}
	
	public List<Lineitem> allLineItem0() {
		List<Lineitem> items = new ArrayList<Lineitem>();
		for (var a : this.allLineItem())
		{
			if (a.getStatus() == 0) {
				items.add(a);
			}
		}
		return items;
	}
	
	public List<Lineitem> Cart_Cus_0(int cusID) {
		List<Lineitem> items = new ArrayList<Lineitem>();
		for (var a : this.allLineItem0() )
		{
			if (a.getCustomerID() == cusID)
			{
				items.add(a);
			}
		}
		return items;
	}
	
	public void addCartItem(Lineitem cartItem) {
        EntityManager em = JpaUtils.getEntityManager();
        
        try {
            em.getTransaction().begin();
            em.persist(cartItem);
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
	
	public void updateCartItem(int carID, int cusID) {
		Lineitem cartItem = new Lineitem();
		for (var a : this.Cart_Cus_0(cusID)) {
			if (a.getCarID() == carID) {
				cartItem = a;
				cartItem.setQuantity(cartItem.getQuantity()+1);
				break;
			}
		}
	    EntityManager em = JpaUtils.getEntityManager();
	    
	    try {
	        em.getTransaction().begin();
	        em.merge(cartItem);
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
	
	public void updateCartItem(int carID, int quantity, int cusID) {
		Lineitem cartItem = new Lineitem();
		for (var a : this.Cart_Cus_0(cusID)) {
			if (a.getCarID() == carID) {
				cartItem = a;
				cartItem.setQuantity(quantity);
				break;
			}
		}
	    EntityManager em = JpaUtils.getEntityManager();
	    
	    try {
	        em.getTransaction().begin();
	        em.merge(cartItem);
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
	
	public void removeCartItem(int carID, int cusID) {
		Lineitem cartItem = new Lineitem();
		for (var a : this.Cart_Cus_0(cusID)) {
			if (a.getCarID() == carID ) {
				cartItem = a;
				break;
			}
		}
	    EntityManager em = JpaUtils.getEntityManager();
	    EntityTransaction trans = em.getTransaction();
	    try {
	           
            trans.begin();
            
            // Kiểm tra xem sản phẩm có được quản lý bởi EntityManager hay không
            if (!em.contains(cartItem)) {
                // Nếu không, sử dụng merge để đưa sản phẩm vào quản lý EntityManager
            	cartItem = em.merge(cartItem);
            }
            
            // Xóa sản phẩm
            em.remove(cartItem);
            
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
	
	public boolean checkExist (int carID, int cusID) {
		for (var a : this.Cart_Cus_0(cusID))
		{
			if (a.getCarID() == carID)
				return true;
		}
		return false;
	}
	
	public int quantity (int carID, int cusID)
	{
		for (var a : this.Cart_Cus_0(cusID))
		{
			if (a.getCarID() == carID)
				return a.getQuantity();
		}
		return 0;
	}
	public int Statistic_quantity (int carID)
	{
		int temp = 0;
		for (var a : this.allLineItem1())
		{
			if (a.getCarID() == carID)
			{
				temp++;
			}
		}
		return temp;
	}
	
	public List<Integer> lstCarID()
	{
		List<Integer> lstCarID = new ArrayList<Integer>();
	    List<Lineitem> lstLit = this.allLineItem1();
	    if (!lstLit.isEmpty()) {
	        for (Lineitem item : lstLit) {
	            int carID = item.getCarID();
	            if (!lstCarID.contains(carID)) {
	            	lstCarID.add(carID);
	            }
	        }
	    }
	    return lstCarID;
	}
	
	public List<Lineitem> carId_line(int carID)
	{
		List<Lineitem> lsts = new ArrayList<>();
		for (var b : this.allLineItem1()) {
			if (b.getCarID() == carID)
			{
				lsts.add(b);
			}
		}
		return lsts;
	}
	 
	public List<Integer> prd_quantity()
	{
		List<Integer> prd_qtt = new ArrayList<>();
		int carID = -1;
		int quantity_single = 0;
		int quantity = 0;
		for (var b : this.lstCarID()) {
			quantity_single = 0;
			for (var a: this.carId_line(b))
			{
				quantity_single += a.getQuantity();
			}
			if (quantity < quantity_single)
			{
				quantity = quantity_single;
				carID = b;
			}
		}
		
		prd_qtt.add(carID);
		prd_qtt.add(quantity);
		return prd_qtt;
	}
}

