package com.app.service;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.app.entity.Park;
public interface ParkService {
    public List<Park> getParkPager(@Param("skip") int skip,@Param("size") int size);
    public  Park getParkById(int id);   
    public int getParkCount();   
    public int insert(Park entity);   
    public int delete(int id);   
    public int update(Park entity);
	public List<Park> getAllPark();
}
