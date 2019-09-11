package gift.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import gift.model.Gift;
import gift.model.GiftDao;

@Controller
public class GiftInsertController {
	private static final String command = "/insert.gt";
	private static final String getPage = "GiftInsert";
	private static final String gotoPage = "redirect:/list.gt";
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	@Qualifier("MyGiftDao") 
	private GiftDao giftDao;
	
	@RequestMapping(value=command,method=RequestMethod.GET) // AlbumList.jsp의 추가하기 버튼 클릭했을 때 
	public String doAction() {
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView doAction(@ModelAttribute("gift") @Valid Gift gift,
			BindingResult result) {
		
		ModelAndView mav = new ModelAndView();

		if(result.hasErrors()) {
			mav.setViewName(getPage);
			return mav;
		}
	
		System.out.println("1:"+servletContext.getRealPath("/resources"));
		// C:\Spring_ysy\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\Project_BookStore\resources
		
		String uploadPath = servletContext.getRealPath("/resources");
		
		giftDao.InsertData(gift);
		
		File file = new File(uploadPath + File.separator + gift.getGimage());
		MultipartFile multi = gift.getUpload();
		
		try {
			multi.transferTo(file);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		mav.setViewName(gotoPage);
		return mav;
	}
	
	
	
	
}
