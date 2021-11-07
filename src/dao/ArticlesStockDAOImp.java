package dao;

import java.util.List;

import org.hibernate.Session;

public class ArticlesStockDAOImp implements ArticlesStockDAO{
	Session session =HibernateUtil.getSessionFactorystock().openSession();
	@Override
	public int add(ArticlesStock e) {
		// TODO Auto-generated method stub
		session.beginTransaction();
		int ID = (Integer)session.save(e);
		session.getTransaction().commit();
		return ID;
	}

	@Override
	public void delete(Integer id) {
		// TODO Auto-generated method stub
		session.beginTransaction();
		ArticlesStock ArtS = findById(id);
		session.delete(ArtS);
		session.getTransaction().commit();
	}

	@Override
	public ArticlesStock edit(ArticlesStock e) {
		// TODO Auto-generated method stub
		session.beginTransaction();
		ArticlesStock ArtS = (ArticlesStock) session.merge(e);
		session.getTransaction().commit();
		return ArtS;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ArticlesStock> findAll() {
		// TODO Auto-generated method stub
		return session.createQuery("select o from ArticlesStock o").list();
	}

	@Override
	public ArticlesStock findById(Integer id) {
		// TODO Auto-generated method stub
		return session.get(ArticlesStock.class, id);
	}

}
