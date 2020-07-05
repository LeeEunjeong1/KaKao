<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.kakao.VO.FieldVO"
	     import = "com.kakao.service.FieldService" %>
<%@ page import = "java.util.ArrayList" 
import = "com.kakao.controller.HttpUtil"%>
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
    <title>Technique</title>
    <link rel="icon" href="images/lion.png" type="image/x-icon">
    <link rel="stylesheet" href="css/index.css" type="text/css">
    <link rel="stylesheet" href="css/Technique1.css" type="text/css">
</head>
<body>
<%
	String name = request.getParameter("name");
	FieldService service = FieldService.getInstance();
	ArrayList<FieldVO> list = service.getFieldList();
	FieldVO field = null;
	for(FieldVO vo : list)
	{
		if((vo.getName()).equals(name))
		{
			field = vo;
		}
	}
%>
    <div id="wrap">
        <header>
             <%@ include file="header.jsp" %>
        </header>
        <section>
            <article>
               <h3>진행중인 공고</h3>
                <table>
                   <tr>
                       <th class="first">구분</th>
                       <td><%=field.getDivision()%></td>
                       <th class="first">직원 유형</th>
                        <td><%=field.getEmployeeType() %></td>
                   </tr>
                    <tr>
                        <th class="first">근무지</th>
                        <td><%=field.getWorkPlace() %></td>
                        <th class="first">모집인원</th>
                        <td><%=field.getRecruitNum() %></td>
                    </tr>
                    <tr>
                        <th class="first">분야이름</th>
                        <td colspan="3"><%=field.getName() %></td>
                    </tr>
                    <tr>
                        <th class="second">분야설명</th>
                        <td colspan="3"><%=field.getExplain() %></td>
                    </tr>
                </table>
                 <a href="ApplyNotice.jsp" class="return">목록</a>
            </article>
        </section>
        <footer>
             <%@ include file="footer.jsp" %>
        </footer>
    </div>
</body>
</html>