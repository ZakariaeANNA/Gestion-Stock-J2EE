package beans;


import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

import dao.ArticlesPrix;
import dao.ArticlesStock;
import services.ArticlesPrixService;
import services.ArticlesPrixServicesImp;
import services.ArticlesStockServices;
import services.ArticlesStockServicesImp;

public class ajouterArticleBean {
   
	private String qntarticle;
	private String nomarticle;
	private String descarticle;
	private String prixarticle;
	

	public String getQntarticle() {
		return qntarticle;
	}
	public void setQntarticle(String qntarticle) {
		this.qntarticle = qntarticle;
	}
	public String getNomarticle() {
		return nomarticle;
	}
	public void setNomarticle(String nomarticle) {
		this.nomarticle = nomarticle;
	}
	public String getDescarticle() {
		return descarticle;
	}
	public void setDescarticle(String descarticle) {
		this.descarticle = descarticle;
	}
	public String getPrixarticle() {
		return prixarticle;
	}
	public void setPrixarticle(String prixarticle) {
		this.prixarticle = prixarticle;
	}

	// méthode ajouter article
	public void ajoutArticle() {
		ArticlesStock article = new ArticlesStock(); 
		// ajouter les données à l'objet article
		article.setQteArt(Integer.parseInt(qntarticle));
		article.setNomArt(nomarticle);
		article.setDescArt(descarticle);
		article.setPrixArt(Integer.parseInt(prixarticle));
		
		ArticlesStockServices a =new ArticlesStockServicesImp(); // service article stock
		// ajouter l'article au BDD g_stock
		int id = a.add(article);
		
		// ajouter les données à l'objet articlesprix
		ArticlesPrix art = new ArticlesPrix();
		art.setCodeArt(id);
		art.setNomArt(nomarticle);
		art.setDescArt(descarticle);
		art.setPrixPdt(Integer.parseInt(prixarticle));
		
		ArticlesPrixService serv = new ArticlesPrixServicesImp(); // service articleprix de g_vente
		serv.add(art);// ajouter l'article au BDD g_vente
		FacesContext.getCurrentInstance().addMessage("message", new FacesMessage("L'article est ajouté avec succes"));// message de succes
		
	}
	
}
