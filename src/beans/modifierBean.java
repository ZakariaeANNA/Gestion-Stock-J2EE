package beans;



import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

import dao.ArticlesPrix;
import dao.ArticlesStock;
import services.ArticlesPrixService;
import services.ArticlesPrixServicesImp;
import services.ArticlesStockServices;
import services.ArticlesStockServicesImp;


public class modifierBean {
	
	private String codeArt;
	private String nomArt;
	private String descArt;
	private String prixArt;
	private String qntArt;
	public String FormulaireModification="true";

	
	ArticlesStockServices a =new ArticlesStockServicesImp();
	ArticlesStock b=null,d=null;
	
	public String getCodeArt() {
		return codeArt;
	}
	public void setCodeArt(String codeArt) {
		this.codeArt = codeArt;
	}
	public String getNomArt() {
		return nomArt;
	}
	public void setNomArt(String nomArt) {
		this.nomArt = nomArt;
	}
	public String getDescArt() {
		return descArt;
	}
	public void setDescArt(String descArt) {
		this.descArt = descArt;
	}
	public String getPrixArt() {
		return prixArt;
	}
	public void setPrixArt(String prixArt) {
		this.prixArt = prixArt;
	}
	public String getQntArt() {
		return qntArt;
	}
	public void setQntArt(String qntArt) {
		this.qntArt = qntArt;
	}
	public String getFormulaireModification() {
		return FormulaireModification;
	}
	public void setFormulaireModification(String formulaireModification) {
		FormulaireModification = formulaireModification;
	}
	
	// méthode de recherche article
	public void chercherElement()
	{
		int code = Integer.valueOf(codeArt);
		this.FormulaireModification="false";
		if(code!=0) {
			b = a.findById(code); // chercher dans la base de données l'article par code.
			// par l'exception NullPointerException on va détecter si l'article est existe dans la base de données c_à_d l'objet est non nulle.
			try {
				nomArt = b.getNomArt();
				descArt = b.getDescArt();
				prixArt = String.valueOf(b.getPrixArt());
				qntArt = String.valueOf(b.getQteArt());
				FormulaireModification="true"; // pour afficher la formulaire de modification
			}catch(Exception e){
				FacesContext.getCurrentInstance().addMessage("message", new FacesMessage("Le code article que vous avez saisié n'existe pas")); // message d'erreur si l'article n'existe pas dans la base de données.
			}
		}
	}
	
	// méthode de modifier article
	public void modifierElement() 
	{
		ArticlesStock c = new ArticlesStock(); // initialisation de article stock
		ArticlesPrixService serv = new ArticlesPrixServicesImp(); 
		int code = Integer.valueOf(codeArt);
		int prix = Integer.valueOf(prixArt);
		int qte = Integer.valueOf(qntArt);
		// ajout des données à l'article stock
		c.setCodeArt(code);
		c.setNomArt(nomArt);
		c.setDescArt(descArt);
		c.setQteArt(qte);
		c.setPrixArt(prix);
		// initialisation d'article prix et l'ajout des données.
		ArticlesPrix article = new ArticlesPrix(nomArt,descArt,prix);
		if(c.equals(null)==false) {
			d=a.edit(c); // modification de l'articlestock dans la base de données g_stock 
			article.setCodeArt(code);
			serv.edit(article); // modification de l'articleprix dans la base de données g_vente
			if(d.equals(null)==false) {
				FacesContext.getCurrentInstance().addMessage("message", new FacesMessage("L'article est modifier avec succès"));
				FormulaireModification = "false"; // pour ne pas afficher la formulaire de modification 
				this.codeArt = null; this.nomArt = null; this.prixArt = null; this.qntArt = null; this.descArt = null;
			}else {
				FacesContext.getCurrentInstance().addMessage("message", new FacesMessage("Un problem affect la modification d'article"));// message d'erreur indiquant qu'un probleme affect la modification 
			}
		}
	}
	
	
	
	
	
}
