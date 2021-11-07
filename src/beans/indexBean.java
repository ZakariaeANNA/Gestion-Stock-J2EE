package beans;
import services.ArticlesStockServices;
import services.ArticlesStockServicesImp;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.context.FacesContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.FontSelector;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import dao.ArticlesStock;

public class indexBean {

	private List<ArticlesStock> article;
	private String PageID;
	
	
	
	
	@PostConstruct
	public void init() { // méthode init execute avant la page jsp à l'aide de PostConstruct
		ArticlesStockServices Art = new ArticlesStockServicesImp(); // services articlestock de g_stock
		this.article = Art.findAll(); // selectionner tous les articles trouvé dans la base de données 
	}

	public List<ArticlesStock> getArticle() {
		return article;
	}

	public void setArticle(List<ArticlesStock> article) {
		this.article = article;
	}
	
	public String getPageID() {
		return PageID;
	}

	public void setPageID(String pageID) {
		PageID = pageID;
	}

	// fonction pour générer Pdf à l'aide de ITEXT
	public void PDFGenerate() throws DocumentException, IOException {
		FacesContext context = FacesContext.getCurrentInstance();
        HttpServletResponse response =(HttpServletResponse)context.getExternalContext().getResponse();
        response.setContentType("application/pdf");
        response.setHeader("Content-disposition","inline=filename=file.pdf");  
        Document document = new Document();
        try {
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", " inline; filename=Rapport de Stock.pdf"); // nom pdf
 
            /* generate PDF document */
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();

	        
            Font blue = new Font(FontFamily.HELVETICA, 25, Font.BOLD); 
            Chunk Text = new Chunk("Rapport de la situation de stock",blue);
            Paragraph p = new Paragraph();
            p.add(Text);
            p.setAlignment(Element.ALIGN_CENTER);
            // ajouter paragraphe au document
            document.add(p);
            
            String pattern = "MM-dd-yyyy";
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
			String date = simpleDateFormat.format(new Date());
			
            blue = new Font(FontFamily.HELVETICA, 15, Font.BOLD);
            Text = new Chunk(date,blue);
            p = new Paragraph();
            p.add(Text);
            p.setAlignment(Element.ALIGN_CENTER);
            p.setSpacingBefore(20);
            // ajouter paragraph qui contient la date au document
            document.add(p);
            
            Font fs = new Font(FontFamily.HELVETICA, 13, Font.BOLD);
            PdfPTable table = new PdfPTable(5);
            table.setSpacingBefore(20);
            // colonne de tableau
    		PdfPCell c1 = new PdfPCell(new Paragraph("Code Article",fs));
    		PdfPCell c2 = new PdfPCell(new Paragraph("Nom Article",fs));
    		PdfPCell c3 = new PdfPCell(new Paragraph("Desc Article",fs));
    		PdfPCell c4 = new PdfPCell(new Paragraph("Prix Article",fs));
    		PdfPCell c5 = new PdfPCell(new Paragraph("Quantité Article",fs));
    		table.addCell(c1); table.addCell(c2); table.addCell(c3); table.addCell(c4); table.addCell(c5);
    		table.setHeaderRows(1);
    		PdfPCell c;
    		for(int i=0;i<article.size();i++) {
    			c = new PdfPCell(new Phrase(""+article.get(i).getCodeArt()));
    			table.addCell(c);
    			c = new PdfPCell(new Phrase(article.get(i).getNomArt()));
    			table.addCell(c);
    			c = new PdfPCell(new Phrase(article.get(i).getDescArt()));
    			table.addCell(c);
    			c = new PdfPCell(new Phrase(""+article.get(i).getPrixArt()));
    			table.addCell(c);
    			c = new PdfPCell(new Phrase(""+article.get(i).getQteArt()));
    			table.addCell(c);
    		}
    		
    		// ajouter le tableau au document
            document.add(table);
        } catch (DocumentException de) {
            // Wrap inside a ServletException
        	System.out.println(de);
        }
 
        document.close();
    }
}
