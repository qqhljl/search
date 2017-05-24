package com.qqh.search;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

public class SearchServlet extends HttpServlet {

	/** 
	 * @Fields serialVersionUID :  
	 */ 
	private static final long serialVersionUID = 1L;

	static List<String> datas = new ArrayList<String >();
	static{
		//这里是模拟数据
		datas.add("ajax");
		datas.add("ajax post");
		datas.add("becky");
		datas.add("bill");
		datas.add("james");
		datas.add("jerry");
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		System.out.println(123);
		//获得客户端发来的数据库keyword
		String keyword = request.getParameter("keyword");
		//获得关键字之后进行处理，得到关联数据
		List<String> listData = getData(keyword);
		//返回json格式
		JSONArray fromObject = JSONArray.fromObject(listData);
		//System.out.println(fromObject);
		response.getWriter().write(fromObject.toString());
	}
	/**
	 * 获得关联数据的方法
	 * @Title: getData 
	 * @Description:  
	 * @param keyword
	 * @return    设定文件 
	 * @return List<String>    返回类型 
	 * @throws
	 */
	public List<String >getData(String keyword){
		List<String> list = new ArrayList<String >();
		for(String data : datas){
			if(data.contains(keyword)){
				list.add(data);
			}
		}
		return list;
	}
	
	
	
	
	
	
	
	

}
