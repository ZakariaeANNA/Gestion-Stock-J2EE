package services;


import dao.ArticlesPrix;
import dao.ArticlesPrixDAO;
import dao.ArticlesPrixDAOImp;


public class ArticlesPrixServicesImp implements ArticlesPrixService {

	ArticlesPrixDAO artp = new ArticlesPrixDAOImp();
	@Override
	public void add(ArticlesPrix e) {
		artp.add(e);
	}

	@Override
	public ArticlesPrix edit(ArticlesPrix e) {
		return artp.edit(e);
	}

	@Override
	public void delete(int id) {
		artp.delete(id);
		
	}

	@Override
	public ArticlesPrix findById(int id) {
		return artp.findById(id);
	}

}
