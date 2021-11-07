package services;


import dao.ArticlesPrix;

public interface ArticlesPrixService {
	
	public void add(ArticlesPrix e);
	public ArticlesPrix edit(ArticlesPrix e);
	public void delete(int id);
	public ArticlesPrix findById(int id);

	
}
