package com.encore.s0729;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import iba.MySqlMapClient;

public class EmpDAO {

	SqlMapClient smc;

	public EmpDAO() {
		smc = MySqlMapClient.getSqlMapInstance();
	}

	public List<String> selectKeyword(String ename) throws SQLException {
		//실행된 행의 갯수
		return  smc.queryForList("emp.selectKeyword", ename);

	}
	
	public Emp selectEmpInfo(String ename) throws SQLException {
		
		return (Emp) smc.queryForObject("emp.selectEmpInfo",ename);
	}

}
