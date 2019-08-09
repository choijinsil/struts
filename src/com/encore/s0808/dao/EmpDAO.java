package com.encore.s0808.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.encore.s0808.vo.Emp;
import com.ibatis.sqlmap.client.SqlMapClient;

import iba.MySqlMapClient;

public class EmpDAO {
   SqlMapClient smc;
   
   public EmpDAO() {
      smc = MySqlMapClient.getSqlMapInstance();
   }
	
   public List<Emp> selectMission3(Map<String,Object> map) throws SQLException {
      return smc.queryForList("emp.selectMission3", map);	   
   }
}




