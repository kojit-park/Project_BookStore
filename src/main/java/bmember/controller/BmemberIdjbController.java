package bmember.controller;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;


import bmember.model.BmemberDao;

@Controller
public class BmemberIdjbController {
	
	@Autowired
	private BmemberDao bmemberDao;
	
	 @RequestMapping("/idjb.bm")
	    @ResponseBody
	    public String doAction(@RequestBody String id) {
			int count = 0;
		 	System.out.println(id);
	        count = bmemberDao.IDJB(id);
	        
	        Map<String, Object> map = new HashMap<String, Object>();
	        map.put("cnt", count);
	        
	        System.out.println( "map : " + map.get("cnt") );
	        System.out.println(count);
	        
	        return count+"";
	    } 
	
}
