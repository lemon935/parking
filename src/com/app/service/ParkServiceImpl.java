package com.app.service;
import java.util.List;
import javax.annotation.Resource;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import com.app.entity.Park;
import com.app.mapper.ParkDAO;
@Service
public class ParkServiceImpl implements ParkService{
	@Resource ParkDAO parkDao;
public List<Park> getParkPager(@Param("skip") int skip,@Param("size") int size){
return parkDao.getParkPager(skip, size);
}
public  Park getParkById(int id){
return parkDao.getParkById(id);
}
public int getParkCount(){
return parkDao.getParkCount();
}
public int insert(Park entity){
return parkDao.insert(entity);
}
public int delete(int id){
return parkDao.delete(id);
}
public int update(Park entity){
return parkDao.update(entity);
}
public List<Park> getAllPark(){
return parkDao.getAllPark();
}

}
