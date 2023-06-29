package cn.com.scitc.graduationproject.dao;

import cn.com.scitc.graduationproject.model.Studentsubject;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

public interface StudentsubjectDao extends CrudRepository<Studentsubject,Integer> {
    @Query(value ="select * from studentsubject where userid=? and seid=?", nativeQuery = true)
    List<Studentsubject> findBySeid (Integer userid, Integer seid);

    @Modifying
    @Transactional
    @Query(value="delete from studentsubject where eid=?",nativeQuery = true)
    void deleteByEid(@Param("eid") Integer eid);

    @Query(value =" select ssid, seid, score, studentkey AS 'content'" +
            "        from studentsubject" +
            "        where status is not null and status = ? limit 1", nativeQuery = true)
    Map<String, Object> selectComposition(String examineStatus);

    @Modifying
    @Transactional
    @Query(value ="update studentsubject set status = 1, score = ? where ssid = ?",nativeQuery = true)
    Integer saveCompositionScore(String score, Integer ssid);
}
