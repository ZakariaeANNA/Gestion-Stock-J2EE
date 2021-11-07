package beans;

import java.text.SimpleDateFormat;
import java.util.List;


import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

import dao.ArticlesApprovisionnement;
import services.ApprovisionServices;
import services.ApprovisionServicesImp;

public class approvisoinnementBean {
	private List<ArticlesApprovisionnement> Approvi;
	private String qteCommande;
	private String dateLivraison;
	private String codeArt;
	
	
	public List<ArticlesApprovisionnement> getApprovi() {
		return Approvi;
	}

	public void setApprovi(List<ArticlesApprovisionnement> approvi) {
		Approvi = approvi;
	}
	
	public String getQteCommande() {
		return qteCommande;
	}
	public void setQteCommande(String qteCommande) {
		this.qteCommande = qteCommande;
	}
	public String getDateLivraison() {
		return dateLivraison;
	}
	public void setDateLivraison(String dateLivraison) {
		this.dateLivraison = dateLivraison;
	}
	
	public String getCodeArt() {
		return codeArt;
	}

	public void setCodeArt(String codeArt) {
		this.codeArt = codeArt;
	}

	// m�thode pour ajouter un approvisoinnement 
	public void AjouterApprovision(){
	    ArticlesApprovisionnement appro = new ArticlesApprovisionnement();
		ApprovisionServices a =new ApprovisionServicesImp();
		// par l'exception NullPointerException on va d�tecter si l'article est existe dans la base de donn�es c_�_d l'objet est non nulle.
		try {
			a.findById(Integer.valueOf(codeArt));
			if(a.findById(Integer.valueOf(codeArt)) == null)
			{
				// ajouter les donn�es � l'objet appro
				appro.setQteCommande(Integer.valueOf(qteCommande));
				appro.setDatePrevueLivraison(new SimpleDateFormat("dd/MM/yyyy").parse(dateLivraison));
				appro.setCodeArt(Integer.valueOf(codeArt));
				// ajouter approvisoinnement au base de donn�es 
				a.add(appro);
				this.Approvi = a.findAll();// selectionner tous les approvisoinnement trouv� dans la base de donn�es 
			}else {
				FacesContext.getCurrentInstance().addMessage("message", new FacesMessage("la code d'article existe deja")); // message erreur indiquant que l'article est existe d�j� dans la table d'approvisoinnement
			}
		}catch(Exception e)
		{
			// message d'erreur indiquant que l'article n'existe pas dans la table article stock
			FacesContext.getCurrentInstance().addMessage("message", new FacesMessage("la code d'article n'existe pas dans la base de donn�es"));
		}
	}
	@PostConstruct
	public void init() {// m�thode init execute avant la page jsp � l'aide de PostConstruct
		ApprovisionServices a = new ApprovisionServicesImp();// services articleservices de g_stock
		this.Approvi = a.findAll();// selectionner tous les approvisoinnement trouv� dans la base de donn�es 
	}
	
	// m�thode pour supprimer approvisoinnement
	public void delete() {
		String codeArt = FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().get("action");
		ApprovisionServices a = new ApprovisionServicesImp(); // service approvi
		ArticlesApprovisionnement deleted = a.findById(Integer.valueOf(codeArt));// cherche si l'article est existe dans la base de donn�es 
		a.delete(Integer.valueOf(codeArt));  // supprimer approvisoinnement par code
		this.Approvi = a.findAll();// selectionner tous les approvisoinnement trouv� dans la base de donn�es 
	}
}
