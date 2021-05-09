package com.app.controller;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;
import java.util.UUID;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.app.entity.*;
import com.app.service.*;
import com.app.utils.MainUtils;
@Controller
@RequestMapping("/park")
public class  ParkController {
@Resource ParkService parkService;
	
@RequestMapping("/park/add")
	public String parkAdd()
	{		
		return "admin/park/add";
	}
@RequestMapping(value="/park/save",method = RequestMethod.POST)
	public String parkSave(String x,
String y,
String no,
String created,
Model model)
	{		
		Park modelX = new Park();		
		modelX.setX(x);
modelX.setY(y);
modelX.setNo(no);
modelX.setCreated(created);
		
		parkService.insert(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("message", "Success!");
		return "admin/park/add";
	}
@RequestMapping("/park/delete")
	public String parkDelete(String ret,int id)
	{
		parkService.delete(id);		
		return "redirect:"+ret;
	}
@Resource
UsersService usersService;

@RequestMapping("/park/list")
	public ModelAndView parkList()
	{
		List<Park> parkList = parkService.getAllPark();
//getHours
		List<Park> parkList1 = new LinkedList<Park>();
		
		if(parkList.size()>0)
		{
			for (Park park : parkList) {
				//if(!park.getUid().equals(sess.getAttribute("userid").toString())) continue;
				park.setUid(usersService.getUsersById(Integer.parseInt(park.getUid())).getUsername());
				News n = newsService.getNewsById(Integer.parseInt(park.getY()));
				Infocate idf = cateService.getInfocateById(Integer.parseInt(n.getUid()));
				park.setN(n);
				park.setIn(idf);
				if(park.getState()==2){
					long h = this.getHours(park.getCreated(), park.getUpdated());
					System.out.println("Hours："+h);
					park.setPrice(h*5);
				}
				
				parkList1.add(park);
			}
		}
		
		
		ModelAndView mav = new ModelAndView("admin/park/list");
		mav.addObject("list",parkList1);
		return mav;
	}


@Resource NewsService newsService;
@Resource InfocateService cateService;
@RequestMapping("/park/mylist")
	public ModelAndView mylist(HttpSession sess)
	{
	
		List<Park> parkList = parkService.getAllPark();
//getHours
		List<Park> parkList1 = new LinkedList<Park>();
		
		if(parkList.size()>0)
		{
			for (Park park : parkList) {
				if(!park.getUid().equals(sess.getAttribute("userid").toString())) continue;
				News n = newsService.getNewsById(Integer.parseInt(park.getY()));
				Infocate idf = cateService.getInfocateById(Integer.parseInt(n.getUid()));
				park.setN(n);
				park.setIn(idf);if(park.getState()==2){
					long h = this.getHours(park.getCreated(), park.getUpdated());
					System.out.println("Hours："+h);
					park.setPrice(h*5);
				}
				parkList1.add(park);
			}
		}
		
		
		ModelAndView mav = new ModelAndView("admin/park/mylist");
		mav.addObject("list",parkList1);
		return mav;
	}

public long getHours(String begin,String end){
SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
try {
Date begin1 = sim.parse(begin);
Date end1 = sim.parse(end);

long between = (end1.getTime() - begin1.getTime())/1000; 
long days = between/(24*3600);
long hours = days*24+between%(24*3600)/3600;
long minutes = between%3600/60;
long seconds = between%60/60;
return hours;
} catch (Exception e) {
e.printStackTrace();
}
return 0L;
}

@RequestMapping("/park/edit")
	public String parkEdit(String ret,int state,String id,Model model)
	{		
		Park park = parkService.getParkById(Integer.parseInt(id));
		park.setState(state);
		park.setUpdated(MainUtils.getTime());
		parkService.update(park);
		
		//News n = newsService.getNewsById(id)
		
		model.addAttribute("inpost", true);
		model.addAttribute("message", "Success");
		return "redirect:"+ret;
	}
@RequestMapping(value="/park/update",method = RequestMethod.POST)
	public String parkUpdate(String x,
String y,
String no,
String created,
int id,
			Model model)
	{		
		
		Park modelX = parkService.getParkById(id);		
		modelX.setX(x);
modelX.setY(y);
modelX.setNo(no);
modelX.setCreated(created);
	
		parkService.update(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("model", modelX);
		model.addAttribute("message", "Success");
		return "admin/park/edit";
	}
}
