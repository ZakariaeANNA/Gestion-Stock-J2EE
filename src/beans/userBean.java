package beans;

import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;

public class userBean {
	public String username;
	public String password;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	// m�thode de l'authentification
	public String loginUser() {
		if(username.equals("admin") && password.equals("1234")) { // v�rification de donn�es 
			FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("valid_user",this.username); // si les donn�es on va ouvrir une session et ajouter le nom d'utilisateur
			return "success"; // retourne succes pour diriger l'utilisateur vers l'accueil
		}
		return "failure"; // retourne failure car l'authentification est �chou� et diriger l'utilisateur vers login 
	}
	
	
}
