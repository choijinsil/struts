package com.encore.s0729;


public class Emp {
//	select e.empno, e.ename, d.dname, s.grade
//    from emp e, dept d, salgrade s
//    where e.deptno=d.deptno and e.sal > s.losal and e.sal < s.hisal
	
	private int empno;
	private String ename;
	private String hiredate;
	private String dname;
	
	public Emp() {
	}

	@Override
	public String toString() {
		return "Emp [empno=" + empno + ", ename=" + ename + ", hiredate=" + hiredate + ", dname=" + dname + "]";
	}

	public int getEmpno() {
		return empno;
	}

	public void setEmpno(int empno) {
		this.empno = empno;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getHiredate() {
		return hiredate;
	}

	public void setHiredate(String hiredate) {
		this.hiredate = hiredate;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public Emp(int empno, String ename, String hiredate, String dname) {
		super();
		this.empno = empno;
		this.ename = ename;
		this.hiredate = hiredate;
		this.dname = dname;
	}

	
	
}
