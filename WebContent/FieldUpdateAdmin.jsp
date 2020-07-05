<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import = "com.kakao.VO.FieldVO"
	import = "com.kakao.service.FieldService"
	import = "java.util.ArrayList"
	import = "com.kakao.controller.HttpUtil"%>
<% 
	if(session.getAttribute("admin") == null)
	{
		HttpUtil.forward(request, response,"index.jsp");
		return;
	}
%>	
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>필드관리</title>
    <link rel="icon" href="images/lion.png" type="image/x-icon">
    <link rel="stylesheet" href="css/indexAdmin.css" type="text/css">
    <link rel="stylesheet" href="css/UserAdmin.css" type="text/css">
    <link rel="stylesheet" href="css/Technique1.css" type="text/css">
</head>
<body>
<%
	FieldService service = FieldService.getInstance();
	ArrayList<FieldVO> list = service.getFieldList();
	FieldVO field = null;
	String mode;
	int num = 0;
	if(request.getParameter("num") != null)
		num = Integer.parseInt(request.getParameter("num"));
	if(num==0)
		mode = "Insert";
	else
		mode = "Update";
	for(FieldVO vo : list)
	{
		if(vo.getNum() == num)
			field = vo;
	}
	String action = "field" + mode + ".do";
%>
    <div id="wrap">
        <header>
            <%@ include file = "headerAdmin.jsp"%>
        </header>
        <section>
            <article>
              <p>필드수정</p>
               <form action= "<%=action%>" method="post">
                    <div id="UserTable">
                     <table>
                   <%
                   if(mode.equals("Update"))
                   {%>
                	<tr>
                       <th class="first">구분</th>
                       <td><input type = "text" value = "<%=field.getDivision()%>" name = "division"></td>
                       <th class="first">직원 유형</th>
                        <td><input type = "text" value = "<%=field.getEmployeeType() %>" name = "employeeType"></td>
                   </tr>
                    <tr>
                        <th class="first">근무지</th>
                        <td><input type = "text" value = "<%=field.getWorkPlace() %>" name = "workPlace"></td>
                        <th class="first">모집인원</th>
                        <td><input type = "text" value = "<%=field.getRecruitNum() %>" name = "recruitNum"></td>
                    </tr>
                    <tr>
                        <th class="first">분야이름</th>
                        <td colspan="3"><input type = "text" value = "<%=field.getName() %>" name = "name"></td>
                    </tr>
                    <tr>
                        <th class="second">분야설명</th>
                        <td colspan="3"><textarea value = "<%=field.getExplain() %>" name = "explain"><%=field.getExplain() %></textarea><%-- <input type = "text" value = "<%=field.getExplain() %>" name = "explain"> --%></td>
                    </tr>   
                   <%}
                   if(mode.equals("Insert"))
                   {%>
                	 <tr>
                       <th class="first">구분</th>
                       <td><input type = "text"  name = "division"></td>
                       <th class="first">직원 유형</th>
                        <td><input type = "text"  name = "employeeType"></td>
                   </tr>
                    <tr>
                        <th class="first">근무지</th>
                        <td><input type = "text"  name = "workPlace"></td>
                        <th class="first">모집인원</th>
                        <td><input type = "text"  name = "recruitNum"></td>
                    </tr>
                    <tr>
                        <th class="first">분야이름</th>
                        <td colspan="3"><input type = "text"  name = "name"></td>
                    </tr>
                    <tr>
                        <th class="second">분야설명</th>
                        <td colspan="3"><textarea  name = "explain"></textarea></td>
                    </tr>     
                   <%}
                   %>
                </table>
                <div class="button1">
                	 <input type="hidden" name = "num">
                     <input type="submit" value="<%=mode%>">
                </div>
               </form>
            </article>
        </section>
        <footer>
            <%@ include file = "footerAdmin.jsp"%>
        </footer>
    </div>
</body>
</html>