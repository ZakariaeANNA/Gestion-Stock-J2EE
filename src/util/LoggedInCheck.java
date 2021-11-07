package util;


import javax.faces.context.FacesContext;
import javax.faces.event.PhaseEvent;
import javax.faces.event.PhaseId;
import javax.faces.event.PhaseListener;
import javax.servlet.http.HttpSession;


//class utilisé si l'utilisateur n'est pas authentifié et il demande une page comme l'index ou l'ajout d'une article 
public class LoggedInCheck implements PhaseListener {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public PhaseId getPhaseId() {
        return PhaseId.RESTORE_VIEW;
    }

    public void beforePhase(PhaseEvent event) {
    }

    public void afterPhase(PhaseEvent event) {
        FacesContext fc = event.getFacesContext();
        boolean loginPage = fc.getViewRoot().getViewId().lastIndexOf("login") > -1 ? true : false; // get true si l'utilisateur la page login et false sinon
        HttpSession session = (HttpSession)FacesContext.getCurrentInstance().getExternalContext().getSession(true);
        String isLog = (String)session.getAttribute("valid_user"); // get session
        if (loginPage && isLog != null) { // si utilisateur demande login et il est authentifié 
        	fc.getViewRoot().setViewId("/index.jsp"); // diriger vers la page d'acceuil
        	return;
        }
        else if (!loginPage && isLog == null) { // si l'utilisateur demande page sans login et il n'est pas authentifié
        	fc.getViewRoot().setViewId("/login.jsp"); // diriger vers login
        	return;
        }
    }
}