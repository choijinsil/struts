<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String []keywords={"자바","자전거","자동차","자소서","자메이카",
		   "자라","자석","자기소개서","자연휴양림","자바라",
		   "abc마트","ajax","apple","aoa","apartment","axa다이렉트",
		   "aia","a4용지"};

	public List<String> search(String keyword){
		 List<String> resultList = new ArrayList<>();
			
			if("".equals(keyword)){
				return resultList;
			}
			for(int i=0; i<keywords.length; i++){
				if(keywords[i].startsWith(keyword)){
					resultList.add(keywords[i]);
				}
			}
			return resultList;
		}
	
%>

<%
	String keyword=request.getParameter("keyword");
	List<String> list= search(keyword);
	
	out.print(list.size()+"|");
	for(int i=0; i<list.size(); i++){
  	  out.print(list.get(i));
  	  if(i < list.size()-1)out.print(",");
    }
	
%>