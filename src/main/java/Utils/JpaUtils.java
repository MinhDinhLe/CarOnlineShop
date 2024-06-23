package Utils;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JpaUtils {
public static EntityManager getEntityManager() {
    EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("car91");
    return entityManagerFactory.createEntityManager();
}
}