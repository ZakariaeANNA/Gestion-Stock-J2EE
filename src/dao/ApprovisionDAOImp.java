package dao;

import java.util.List;

import org.hibernate.Session;

public class ApprovisionDAOImp implements ApprovisionDAO {

	Session session = HibernateUtil.getSessionFactorystock().openSession();
	@Override
	public void add(ArticlesApprovisionnement e) {
		session.beginTransaction();
		session.save(e);
		session.getTransaction().commit();
	}

	@Override
	public void delete(int id) {
		session.beginTransaction();
		ArticlesApprovisionnement Approvi = findById(id);
		session.delete(Approvi);
		session.getTransaction().commit();
	}

	@Override
	public ArticlesApprovisionnement edit(ArticlesApprovisionnement e){
		session.beginTransaction();
		ArticlesApprovisionnement Approvi = (ArticlesApprovisionnement) session.merge(e);
		session.getTransaction().commit();
		return Approvi;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ArticlesApprovisionnement> findAll() {
		return session.createQuery("select o from ArticlesApprovisionnement o").list();
	}
	
	@Override
	public ArticlesApprovisionnement findById(int id) {
		return session.get(ArticlesApprovisionnement.class, id);
	}
}
