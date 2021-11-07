package beans;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

import services.ArticlesPrixService;
import services.ArticlesPrixServicesImp;
import services.ArticlesStockServices;
import services.ArticlesStockServicesImp;

public class supprimerBean {
  
	private String codearticle;


	public String getCodearticle() {
		return codearticle;
	}

	public void setCodearticle(String codearticle) {
		this.codearticle = codearticle;
	}

	//méthode pour supprimer article 
	public void suppArticle() {
		ArticlesStockServices a =new ArticlesStockServicesImp(); // service de l'article articleStock de la base de données g_stock
		ArticlesPrixService b = new ArticlesPrixServicesImp(); // service de l'article articleprix de la base de données g_vente
		int code = Integer.parseInt(codearticle);
		// par l'exception NullPointerException on va détecter si l'article est existe dans la base de données c_à_d l'objet est non nulle.
		try {
			a.findById(code); // cherche l'article dans la base de données 
			a.delete(code); // supprimer l'article par code dans BDB g_stock
			b.delete(code); // supprimer l'article par code dan BDD g_vente
			FacesContext.getCurrentInstance().addMessage("message", new FacesMessage("La suppression de l'article a été effectué avec succes")); // message de succes de suppression
		}catch(Exception e) {
			FacesContext.getCurrentInstance().addMessage("message", new FacesMessage("L'article cherché n'existe pas")); // message d'erreur indiquant que l'article n'existe pas 
		}
		
	}
	
}
