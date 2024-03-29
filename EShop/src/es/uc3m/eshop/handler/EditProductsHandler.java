package es.uc3m.eshop.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import es.uc3m.eshop.model.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

public class EditProductsHandler implements es.uc3m.eshop.controlservlet.RequestHandler {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
				
		//Find the products for the specific seller
		
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			return "login.html";
		}
		if (((ApplicationUser)session.getAttribute("user")).getRole() == 0) {
			return "error.jsp";
		}
		
		ProductManager pm = new ProductManager();
		
		List<Product> products = pm.findAllForSeller(session);
		
		request.setAttribute("sellerProducts", products);
		
		
		//Handles product changes
		if(request.getParameter("productChanges") != null)
		{
			System.out.println("Product about to be updated: +" + request.getParameter("productChanges"));
			
			
			String newProductName = request.getParameter("newProductName");
			String newProductDescription = request.getParameter("newProductDescription");
			float newProductPrice = Float.parseFloat(request.getParameter("newProductPrice"));
			int newProductStock = Integer.parseInt(request.getParameter("newProductStock"));
			
			Product editedProduct = pm.findById(request.getParameter("productChanges"));

			
			Part inImage = request.getPart("newProductImage");
			byte[] imageData = new byte[(int) inImage.getSize()];
			inImage.getInputStream().read(imageData, 0, imageData.length);
			editedProduct.setProductImage(imageData);
			
			
			editedProduct.setName(newProductName);
			editedProduct.setDescription(newProductDescription);
			editedProduct.setPrice(newProductPrice);
			editedProduct.setStock(newProductStock);
			
			
			pm.update(editedProduct);
			
			return "productEditSuccess.jsp";
			
			
		}
		
		
		
		
		
		//Grabs the request parameter "editProduct" from the form in "editSellerProducts" to edit product
		if (request.getParameter("editProduct") != null)
		{
			System.out.println("EDITING PRODUCT");
			Product productToEdit = pm.findById(request.getParameter("editProduct"));
			
			request.setAttribute("productToEdit", productToEdit);
			return "editProduct.jsp";
		}
		
		//Handles product deletion
		
		if (request.getParameter("deleteProduct") != null)
		{
			System.out.println("DELETING PRODUCT");
			Product productToDelete = pm.findById(request.getParameter("deleteProduct"));
			
			pm.delete(productToDelete);
			
			return "deleteProductSuccess.jsp";
			
		}
			

		return "editSellerProducts.jsp";
	}
}
