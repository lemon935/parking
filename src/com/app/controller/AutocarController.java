package com.app.controller;
import java.io.File;
import java.util.LinkedList;
import java.util.List;
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
@RequestMapping("/autocar")
public class  AutocarController {
@Resource AutocarService autocarService;
	
@RequestMapping("/autocar/add")
	public String autocarAdd()
	{		
		return "admin/autocar/add";
	}
@RequestMapping(value="/autocar/save",method = RequestMethod.POST)
	public String autocarSave(String userid,
String carno,
String color,
String seats,
String thumb,
String description,
String price,
String created,
String title,
Model model,HttpSession session)
	{		
	userid = session.getAttribute("userid")+"";
		Autocar modelX = new Autocar();		
		modelX.setUserid(userid);
modelX.setCarno(carno);
modelX.setColor(color);
modelX.setSeats(seats);

modelX.setDescription(description);
modelX.setPrice(price);
modelX.setCreated(MainUtils.getTime());
modelX.setTitle(title);
		
		autocarService.insert(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("message", "提交成功!");
		return "admin/autocar/add";
	}
@RequestMapping("/autocar/delete")
	public String autocarDelete(int id,String ret)
	{
		autocarService.delete(id);		
		return "redirect:"+ret;
	}
	
@Resource UsersService uService;

@RequestMapping("/autocar/list")
	public ModelAndView autocarList()
	{
	
	List<Autocar> autocarList = autocarService.getAllAutocar();
	List<Autocar> autocarList1 = new LinkedList<Autocar>();
	if(autocarList.size()>0)
	{
		for (Autocar a:autocarList) {
			a.setU(uService.getUsersById(Integer.parseInt(a.getUserid())));
			autocarList1.add(a);
		}
	}
	
	System.out.println(autocarList.size());
	ModelAndView mav = new ModelAndView("admin/autocar/list");
	mav.addObject("list",autocarList1);
	return mav;
	}

@RequestMapping("/autocar/mylist")
public ModelAndView mylist(HttpSession session)
{
	String uid = session.getAttribute("userid")+"";
	List<Autocar> autocarList = autocarService.getAllAutocar();
	List<Autocar> autocarList1 = new LinkedList<Autocar>();
	if(autocarList.size()>0)
	{
		for (Autocar a:autocarList) {
			if(uid.equals(a.getUserid()))
			{
				autocarList1.add(a);
			}
		}
	}
	
	System.out.println(autocarList.size());
	ModelAndView mav = new ModelAndView("admin/autocar/mylist");
	mav.addObject("list",autocarList1);
	return mav;
}

@RequestMapping("/autocar/edit")
	public String autocarEdit(String id,Model model)
	{		
		Autocar autocar = autocarService.getAutocarById(Integer.parseInt(id));
		model.addAttribute("model",autocar);
		return "admin/autocar/edit";
	}
@RequestMapping(value="/autocar/update",method = RequestMethod.POST)
	public String autocarUpdate(String userid,
String carno,
String color,
String seats,
String thumb,
String description,
String price,
String created,
String title,
int id,
			Model model)
	{		
		
		Autocar modelX = autocarService.getAutocarById(id);		
		
modelX.setCarno(carno);
modelX.setColor(color);
modelX.setSeats(seats);

modelX.setDescription(description);
modelX.setPrice(price);

modelX.setTitle(title);
	
		autocarService.update(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("model", modelX);
		model.addAttribute("message", "更新成功");
		return "admin/autocar/edit";
	}
}
