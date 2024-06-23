package DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import Utils.JpaUtils;
import model.Admin;


public class adDAO {
	public List<Admin> allAdmin() {
		EntityManager em = JpaUtils.getEntityManager();
		TypedQuery<Admin> query = em.createNamedQuery("Admin.findAll", Admin.class);
		return query.getResultList();
	}
}