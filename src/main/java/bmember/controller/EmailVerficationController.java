package bmember.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bmember.model.BmemberEmailVerification;

@Controller
public class EmailVerficationController {
	
		String randomNum ="";

	@RequestMapping(value="emailVerify.bm",method=RequestMethod.POST)
	@ResponseBody
	public String doActionGet(@RequestBody String email) {
		
		BmemberEmailVerification ever = new BmemberEmailVerification();
		randomNum =	ever.gmailSend(email);
		System.out.println("GET::"+randomNum +"  email::"+email);
		
		return randomNum;
	}
	
	 @RequestMapping(value="CodeVerify.bm",method=RequestMethod.POST)
	    @ResponseBody
	    public String doAction(@RequestBody String code) {
		 	System.out.println("POST::"+randomNum+"  Code::" + code);
		 	
		 	if(randomNum.equals(code)) {
		 		return "1";
		 	}else {
		 		return "0";
		 	}
		 	
	    } 
	
	
}
