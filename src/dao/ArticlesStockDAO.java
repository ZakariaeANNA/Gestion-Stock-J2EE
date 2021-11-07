package dao;

import java.util.List;

public interface ArticlesStockDAO {

	public int add(ArticlesStock e);
	public void delete(Integer id);
	public ArticlesStock edit(ArticlesStock e);
	public List<ArticlesStock> findAll();
	public ArticlesStock findById(Integer id); 
	
	
}
