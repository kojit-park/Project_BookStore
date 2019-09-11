package gift.controller;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import gift.model.Gift;
import gift.model.GiftDao;

@Controller
public class GiftDeleteController {
	
	private static final String gotoPage = "redirect:/list.gt";
	private static final String command = "/delete.gt";
	
	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	@Qualifier("MyGiftDao")
	private GiftDao giftDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(
			@RequestParam(value="gnum", required=true) int gnum
			) {
		Gift gift = giftDao.GetData(gnum);
		

		String deletePath = servletContext.getRealPath("/resources");
		File delFile = new File( deletePath + File.separator +gift.getGimage() );
		delFile.delete();

		giftDao.DeleteData( gnum );
		
		return gotoPage;
	}
}
