package services;

import java.util.List;

import dao.ApprovisionDAOImp;
import dao.ArticlesApprovisionnement;
import dao.ApprovisionDAO;

public class ApprovisionServicesImp implements ApprovisionServices {
	
	ApprovisionDAO appro = new ApprovisionDAOImp();
	@Override
	public void add(ArticlesApprovisionnement e) {
		appro.add(e);
	}

	@Override
	public void delete(int id) {
		appro.delete(id);
		
	}
	@Override
	public ArticlesApprovisionnement edit(ArticlesApprovisionnement e) {
		return appro.edit(e);
	}

	@Override
	public List<ArticlesApprovisionnement> findAll() {
		return appro.findAll();
	}
	
	@Override
	public ArticlesApprovisionnement findById(int id) {
		return appro.findById(id);
	}

}
