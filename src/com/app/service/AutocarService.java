package com.app.service;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.app.entity.Autocar;
public interface AutocarService {
    public List<Autocar> getAutocarPager(@Param("skip") int skip,@Param("size") int size);
    public  Autocar getAutocarById(int id);   
    public int getAutocarCount();   
    public int insert(Autocar entity);   
    public int delete(int id);   
    public int update(Autocar entity);
	public List<Autocar> getAllAutocar();
}
