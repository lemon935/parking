package com.app.entity;

import java.util.List;

public class Infocate {
 public int id;
 public String title;
 public List<News> subs;
 
 public List<News> getSubs() {
	return subs;
}
public void setSubs(List<News> subs) {
	this.subs = subs;
}
public void setTitle(String title){ 
 this.title=title;
 } 
 public String getTitle(){
 return title;
 } 
 public String created;
 public void setCreated(String created){ 
 this.created=created;
 } 
 public String getCreated(){
 return created;
 } 
public void setId(int id) {
this.id = id;
}

public int getId() {
return id;
}

}