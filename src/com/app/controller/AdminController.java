package com.app.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;
import java.util.UUID;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.app.entity.*;
import com.app.service.*;
import com.app.utils.MD5;
import com.app.utils.MainUtils;

@Controller
@RequestMapping("/backendui")
public class AdminController {
	
	@Resource
	UsersService userService;

		
	
	@RequestMapping("/index")
	public String index(HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "redirect:login";
		}

		return "backend/index";
	}@Resource InfocateService cateService;
	@Resource NewsService newsService;
	@Resource InfocateService infocateService;
	@RequestMapping("/order")
	public String order(String area,HttpSession session,Model model) {	
		
	
		
		List<Infocate> infocateList = infocateService.getAllInfocate();
		List<News> ls = newsService.getAllNews();
		List<News> ls1 = new ArrayList<News>();
		if(ls.size()>0)
		{
			for (News n:ls) {
				if(area!=null&&!n.getUid().equals(area)) continue;
				n.setCate(cateService.getInfocateById(Integer.parseInt(n.getUid())));
				ls1.add(n);
			}
		}
		
		model.addAttribute("list", infocateList);
		model.addAttribute("list1", ls1);
		return "backend/order";
	}
	@RequestMapping("/order1")
	public String order1(HttpSession session,Model model) {	
		
	
		model.addAttribute("num1", getLeftNum());
		model.addAttribute("num2", getRightNum());
		
		model.addAttribute("p1", (100-getLeftNum())/100);
		model.addAttribute("p2", (100-getRightNum())/100);
		
		List<Infocate> infocateList = infocateService.getAllInfocate();
		List<News> ls = newsService.getAllNews();
		for (Infocate infocate : infocateList) {
			List<News> sub = new ArrayList<News>();
			for (News news : ls) {
				if(news.getUid().equals(infocate.getId()+"")) sub.add(news);
			}
			infocate.setSubs(sub);
		}
		
		
		model.addAttribute("list", infocateList);
		return "backend/order";
	}
	public int getLeftNum()
	{
		List<Park> list =  parkService.getAllPark();
		int check = 0;
		if(list.size()>0)
		{
			for (Park park : list) {
				if(park.getX().equals("1")&&park.getState()==1)
				{
					check+= 1;
				}
			}
		}
		return check;
	}
	
	public int getRightNum()
	{
		List<Park> list =  parkService.getAllPark();
		int check = 0;
		if(list.size()>0)
		{
			for (Park park : list) {
				if(park.getX().equals("2")&&park.getState()==1)
				{
					check+= 1;
				}
			}
		}
		return check;
	}
	
	
	@Resource ParkService parkService;
	
	@RequestMapping("/park")
	@ResponseBody
	public String park(HttpSession sess,String x,String y,String no) {	
		Park md = new Park();
		md.setUid(sess.getAttribute("userid").toString());
		md.setX(x);
		md.setY(y);
		md.setNo(MainUtils.encode(no));
		md.setCreated(MainUtils.getTime());
		parkService.insert(md);
		return "0";
	}
	
	@RequestMapping("/check")
	@ResponseBody
	public String check(String x,String y) {	
		List<Park> list =  parkService.getAllPark();
		int check = 1;
		if(list.size()>0)
		{
			for (Park park : list) {
				if(park.getState()==1&&park.getX().equals(x)&&park.getY().equals(y))
				{
					check = 2;break;
				}
			}
		}
		return check+"";
		
	}
	
	@RequestMapping("/login")
	public String login() {
		return "backend/login";
	}
	@RequestMapping("/signup")
	public String signup() {
		return "backend/reg";
	}
	
	@RequestMapping("/logout")
	public String logout(String retUrl, HttpSession session) {
		session.invalidate();
		return "redirect:" + retUrl;
	}

	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	public String signin(@RequestParam("username") String username,
			@RequestParam("password") String password, Model model,
			HttpSession session) {
		System.out.println(username);
		System.out.println(password);
		Users user = userService.userLogin(username, MD5.MD51(password));

		model.addAttribute("inlogin", true);
		if (user != null) {

			model.addAttribute("user", user);

			session.setAttribute("user", user);
			session.setAttribute("userid", user.getId());
			session.setAttribute("username", user.getUsername());
			session.setAttribute("usertype", user.getType());

			Users us = userService.getUsersById(Integer.parseInt(session
					.getAttribute("userid") + ""));
			float oldMoney = Float.parseFloat(us.getMoney());
			us.setMoney((oldMoney + MainUtils.LOGINVAL) + "");
			userService.update(us);
		}
		return "backend/login";
	}
	
	@RequestMapping(value = "/reg", method = RequestMethod.POST)
	public String reg(@RequestParam("username") String username,
			@RequestParam("password") String password,
			String email,
			String tel,
			Model model,
			HttpSession session) {
		Users user = new Users();
		user.setEcard(MainUtils.getEcard());
		user.setMoney("100.00");
		user.setType(1 + "");
		user.setUsername(username);
		user.setPassword(MD5.MD51(password));
		user.setEmail(email);
		user.setTel(tel);
		
		user.setCreated(MainUtils.getTime());
		userService.insert(user);
		model.addAttribute("state", 1);
		return "backend/reg";
	}
}
