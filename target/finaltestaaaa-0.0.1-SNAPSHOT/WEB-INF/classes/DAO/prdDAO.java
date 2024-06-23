package DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import Utils.JpaUtils;
import model.Customer;
import model.Product;

public class prdDAO {
	public List<Product> allPrd() {
		EntityManager em = JpaUtils.getEntityManager();
		TypedQuery<Product> query = em.createNamedQuery("Product.findAll", Product.class);
		return query.getResultList();
	}
	public void deleteProduct(Product product) {
		EntityManager em = JpaUtils.getEntityManager();
	    EntityTransaction trans = em.getTransaction();
        
        try {
           
            trans.begin();
            
            // Kiểm tra xem sản phẩm có được quản lý bởi EntityManager hay không
            if (!em.contains(product)) {
                // Nếu không, sử dụng merge để đưa sản phẩm vào quản lý EntityManager
                product = em.merge(product);
            }
            
            // Xóa sản phẩm
            em.remove(product);
            
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
	public void addProduct(Product product) {
	    EntityManager em = JpaUtils.getEntityManager();
	    EntityTransaction trans = em.getTransaction();

	    try {
	        trans.begin();

	        // Thực hiện thêm sản phẩm vào cơ sở dữ liệu
	        em.persist(product);

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
	public void editProduct(Product product) {
	    EntityManager em = JpaUtils.getEntityManager();
	    EntityTransaction trans = em.getTransaction();

	    try {
	        trans.begin();

	        // Thực hiện thêm sản phẩm vào cơ sở dữ liệu
	       em.merge(product);

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
	
	public Product getPrd(int carID) {
		for (var prd : this.allPrd()) {
			if (prd.getCarID() == carID) {
				return prd;
			}
		}
		return null;
	}
}
