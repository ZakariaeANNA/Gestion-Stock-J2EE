package beans;

import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;

public class logoutbean {
	
	// méthode de déconnexion 
	public String logout() {
		HttpSession session = (HttpSession)FacesContext.getCurrentInstance().getExternalContext().getSession(true); // get session
		session.invalidate(); // supprimer session 
		return "logout"; // retourner logout pour diriger vers page login  
	}
	
}
