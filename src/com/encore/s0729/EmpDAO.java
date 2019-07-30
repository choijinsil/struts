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
	
	public List<String> selectNames() throws SQLException{
		//조회된 행의 갯수
		return smc.queryForList("emp.selectNames");
	}
	
	public List<Emp> selectDeptInfo(int deptno) throws SQLException {
		
		return smc.queryForList("emp.selectDeptInfo",deptno);
		//return null;
	}
	
	public int selectMinDeptNo() throws SQLException {
		return (int) smc.queryForObject("emp.selectMinDeptNo");//가장작은 부서번호 가져올것
	}
	
	public boolean selectDeptNo(int deptno) throws SQLException {
		int isDeptNo=(int) smc.queryForObject("emp.selectDeptNo",deptno);
		if(isDeptNo==1) {
			return true;
		}
		return false;
	}

}
