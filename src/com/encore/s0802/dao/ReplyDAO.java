package com.encore.s0802.dao;

import java.sql.SQLException;
import java.util.List;

import com.encore.s0802.vo.Reply;
import com.ibatis.sqlmap.client.SqlMapClient;

import iba.MySqlMapClient;

public class ReplyDAO {

	SqlMapClient smc;

	public ReplyDAO() {
		smc = MySqlMapClient.getSqlMapInstance();// config에 있는 xml을 전부 검사한다.
	}

	public boolean create(Reply vo) {
		try {
			smc.insert("reply.create", vo);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public List<Reply> findAll() throws SQLException {
		return smc.queryForList("reply.findAll");
	}

	public boolean modify(Reply vo) throws SQLException {

		if (smc.update("reply.modify", vo) == 1) {
			return true;
		}
		return false;
	}
	
	public boolean delete(int no) throws SQLException {

		if (smc.delete("reply.delete", no) == 1) {
			return true;
		}
		return false;
	}
}
