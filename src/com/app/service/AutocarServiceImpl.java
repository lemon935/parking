package com.app.service;
import java.util.List;
import javax.annotation.Resource;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import com.app.entity.Autocar;
import com.app.mapper.AutocarDAO;
@Service
public class AutocarServiceImpl implements AutocarService{
	@Resource AutocarDAO autocarDao;
public List<Autocar> getAutocarPager(@Param("skip") int skip,@Param("size") int size){
return autocarDao.getAutocarPager(skip, size);
}
public  Autocar getAutocarById(int id){
return autocarDao.getAutocarById(id);
}
public int getAutocarCount(){
return autocarDao.getAutocarCount();
}
public int insert(Autocar entity){
return autocarDao.insert(entity);
}
public int delete(int id){
return autocarDao.delete(id);
}
public int update(Autocar entity){
return autocarDao.update(entity);
}
public List<Autocar> getAllAutocar(){
return autocarDao.getAllAutocar();
}

}
