package dao;

import java.util.List;

public interface ApprovisionDAO {

	public void add(ArticlesApprovisionnement e);
	public void delete(int id);
	public ArticlesApprovisionnement edit(ArticlesApprovisionnement e);
	public List<ArticlesApprovisionnement> findAll();
	public ArticlesApprovisionnement findById(int id); 
	
}
