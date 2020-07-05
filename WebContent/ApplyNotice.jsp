<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.kakao.service.FieldService" %>
<%@ page import = "com.kakao.VO.FieldVO" %>
<%@ page import = "java.util.ArrayList"
import = "com.kakao.controller.HttpUtil" %>
<%
if(session.getAttribute("cUser") == null)
{
	HttpUtil.forward(request, response,"index.jsp");
	return;
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>채용공고</title>
    <link rel="icon" href="images/lion.png" type="image/x-icon">
    <link rel="stylesheet" href="css/index.css" type="text/css">
    <link rel="stylesheet" href="css/ApplyNotice.css" type="text/css">
</head>
<body>
<%
	FieldService service = FieldService.getInstance();
	ArrayList<FieldVO> list = null;
	ArrayList<FieldVO> slist = null;
	if(service.getFieldList() != null)
	{
		list = service.getFieldList();
	}
	if(request.getAttribute("searchList") != null)
	{
		slist = (ArrayList<FieldVO>) request.getAttribute("searchList");
	}
%>
    <div id="wrap">
        <header>
            <%@ include file = "header.jsp" %>
        </header>
        <section>
            <article>
                <img src="images/applyNoticeKey.gif" id="Applykeyimage">
            </article>
            <article>
                <ul id="group">
                <%
                for(FieldVO vo : list)
                {
                %>
                <li><a href="fieldSearchDivision.do?division=<%=vo.getDivision()%>"><%=vo.getDivision()%></a></li>            
                <%
                } 
                %>
                    <!-- <li><a href="#">기술</a></li>
                    <li><a href="#">디자인</a></li>
                    <li><a href="#">서비스사업</a></li>
                    <li><a href="#">스탭</a></li>
                    <li><a href="#">브랜드마케팅</a></li> -->
                </ul>
                <table>
                    <tr>
                        <th>이름</th>
                        <th>내용</th>
                        <th>구분</th>
                    </tr>
                    
                   <%
                    if(slist == null)
                    {
                    	for(FieldVO vo : list)
                    	{
                    		System.out.println("applyNotice vo fieldname : " + vo.getName());
                    		%>
                    		<tr>
                    		<td><a href = "Technique.jsp?name=<%=vo.getName()%>"><%=vo.getName()%></a></td>
                        	<td>
                            <form action = "ApplyWrite.jsp">
                            <p><%=vo.getEmployeeType()%></p>
                            <p><%=vo.getWorkPlace()%></p>
                            <p><%=vo.getRecruitNum()%>명</p>
                            <input type = "hidden" value = "<%=vo.getName()%>" name = "field">
                            <p><input type="submit" value="지원하기" class="apply"></p>
                            </form>
                        </td>
                        <td>
                        <%=vo.getDivision()%>
                        </td>
                        </tr>
                    	<%}
                    }
                    else
                    {
                    	for(FieldVO vo : slist)
                    	{
                    		System.out.println("applyNotice vo fieldname : " + vo.getName());
                    	%>
                    		<tr>
                    		<td><a href = "Technique.jsp?name=<%=vo.getName()%>"><%=vo.getName()%></a></td>
                        	<td>
                            <form action = "ApplyWrite.jsp">
                            <p><%=vo.getEmployeeType()%></p>
                            <p><%=vo.getWorkPlace()%></p>
                            <p><%=vo.getRecruitNum()%>명</p>
                            <input type = "hidden" value = "<%=vo.getName()%>" name = "field">
                            <p><input type="submit" value="지원하기" class="apply"></p>
                            </form>
	                        </td>
	                        <td>
	                        <%=vo.getDivision()%>
	                        </td>
	                        </tr>
	                        
                   	<%}
                    }
                    %>
                </table>
            </article>
        </section>
        <footer>
            <%@ include file = "footer.jsp" %>
        </footer>
    </div>
</body>
</html>