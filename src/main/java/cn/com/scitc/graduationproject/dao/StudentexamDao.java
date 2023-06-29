package cn.com.scitc.graduationproject.dao;

import cn.com.scitc.graduationproject.model.Studentexam;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.List;

public interface StudentexamDao extends JpaRepository<Studentexam,Integer> {

    @Query(value ="select * from studentexam where userid=? and eid=?", nativeQuery = true)
    Studentexam findByOne (Integer userid,Integer eid);

    @Query(value ="select * from studentexam where userid=? and eid=? and status = 0", nativeQuery = true)
    Studentexam findNoFinishByOne (Integer userid,Integer eid);

    @Query(value ="select * from studentexam where userid=?", nativeQuery = true)
    List<Studentexam> findByUserid (Integer userid);

    @Query(value ="select * from studentexam where  seid=?", nativeQuery = true)
    Studentexam findByseid (Integer seid);

    @Modifying
    @Transactional
    @Query(value="delete from studentexam where eid = ?",nativeQuery = true)
    void deleteByEid(Integer eid);
    //更新pname
    @Modifying
    @Transactional
    @Query(value ="update studentexam set pname =? where eid =?",nativeQuery = true)
    Integer updatePname(String pname,Integer eid);

    @Modifying
    @Transactional
    @Query(value="delete from studentexam where classid = ?",nativeQuery = true)
    void deleteByClassid(Integer classid);
    //分页查询所有学生成绩
    @Query(value = "select * from studentexam where classid = ?",nativeQuery = true)
    Page<Studentexam> findByClassid(Integer classid, Pageable pageable);

    @Modifying
    @Transactional
    @Query(value="update studentexam set zscore = zscore + ?, cpscore = cpscore + ? where seid = ?",nativeQuery = true)
    Integer updateZscore(String score, String cpscore, Integer seid);

    @Modifying
    @Transactional
    @Query(value="INSERT INTO studentexam(userid, eid, pname, classid, zscore, score, cpscore, tjtime, status) VALUES (?, ?, ?, ?, 0, 0, 0, ?, 0);",nativeQuery = true)
    Integer saveStudentExam(Integer userId, Integer eId, String pName, Integer classid, Timestamp timestamp);

    @Modifying
    @Transactional
    @Query(value="update studentexam set zscore = ?, score = ?, status = 1 where userid = ? and eid = ?",nativeQuery = true)
    void updateScore(Integer zscore, Integer score, Integer userId, Integer eId);


//    @Query(value="select * from studentexam where pname like %?%",nativeQuery = true)
//    public Iterable<Studentexam> findByIdAll(String receiveId);

}
