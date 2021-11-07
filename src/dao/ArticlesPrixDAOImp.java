package dao;


import org.hibernate.Session;

public class ArticlesPrixDAOImp implements ArticlesPrixDAO {

	Session session = HibernateUtil.getSessionFactoryvente().openSession();
	@Override
	public void add(ArticlesPrix e) {
		session.beginTransaction();
		session.save(e);
		session.getTransaction().commit();
	}
	
	@Override
	public ArticlesPrix edit(ArticlesPrix e){
		session.beginTransaction();
		ArticlesPrix ArticleP = (ArticlesPrix) session.merge(e);
		session.getTransaction().commit();
		return ArticleP;
	}

	@Override
	public void delete(int id) {
		session.beginTransaction();
		ArticlesPrix ArticleP = findById(id);
		session.delete(ArticleP);
		session.getTransaction().commit();
	}
	
	@Override
	public ArticlesPrix findById(int id) {
		return session.get(ArticlesPrix.class, id);
	}

}
