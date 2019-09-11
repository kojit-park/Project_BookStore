package gift.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import gift.model.Gift;
import gift.model.GiftDao;

@Controller
public class GiftUpdateController {
	
	private static final String command = "/update.gt";
	private static final String getPage = "GiftUpdate";
	private static final String gotoPage = "redirect:/list.gt";
	
	@Autowired
	@Qualifier("MyGiftDao")
	private GiftDao giftDao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(@RequestParam(value="gnum", required=true) int gnum,
			Model model) {
		Gift gift = giftDao.GetData(gnum);
		model.addAttribute("gift", gift);
		
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView doAction(@ModelAttribute("gift") @Valid Gift gift, BindingResult result) {
		
		ModelAndView mav = new ModelAndView();
		if(result.hasErrors()) {
			mav.setViewName(getPage);
			return mav;
		}
		
		String uploadPath = servletContext.getRealPath("/resources");
		
		giftDao.UpdateData(gift);
		
		File newfile = new File(uploadPath + File.separator + gift.getGimage());
		File oldfile = new File(uploadPath + File.separator + gift.getUpload2());
		oldfile.delete();
		
		MultipartFile multi = gift.getUpload();
		
		try {
			multi.transferTo(newfile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		mav.setViewName(gotoPage);
		return mav;
	}

}
