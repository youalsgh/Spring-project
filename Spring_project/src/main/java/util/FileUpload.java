package util;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import command.ProductCommand;
 
public class FileUpload {

	public static ProductCommand upload(HttpServletRequest request) throws IOException {
		String filename = "";
		String realPath = request.getSession().getServletContext().getRealPath("resources/img/");
		Integer maxSize = 5 * 1024 * 1024;
		String encType = "utf8";
		
		request.setCharacterEncoding("utf-8");

		MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, encType,
				new DefaultFileRenamePolicy());
		
		Enumeration files = multi.getFileNames();
		String fname = (String) files.nextElement();
		filename = multi.getFilesystemName(fname);
		
		ProductCommand productCommand = new ProductCommand();
		productCommand.setBrand(multi.getParameter("brand"));
		productCommand.setName(multi.getParameter("name"));
		productCommand.setPrice(Integer.parseInt(multi.getParameter("price")));
		productCommand.setGender(multi.getParameter("gender"));
		productCommand.setDescription(multi.getParameter("description"));
		productCommand.setFileName(filename);
		
		return productCommand;
	}

}
