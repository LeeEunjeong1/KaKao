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
</head>
<body>
<%
	FieldService service = FieldService.getInstance();
	ArrayList<FieldVO> list = service.getFieldList();
	FieldVO sField = (FieldVO) request.getAttribute("sField");
%>
    <div id="wrap">
        <header>
            <%@ include file = "headerAdmin.jsp" %>
        </header>
        <section>
            <article>
              <p>필드관리</p>
               <form action="fieldSearch.do" method="post">
                   <div id="search">
                        <input type="search" class="UserSearch" name = "name">
                        <input type="submit" value="검색" class="SearchButton">
                    </div>
                    <div id="UserTable">
                        <table>
                            <tr>
                                <th>구분</th>
                                <th>분야이름</th>
                                <th>분야내용</th>
                                <th colspan="2" class="no"></th>
                            </tr>
                            <%
                            if(sField != null)
                            {%>
                            	<tr>
                                <td><%=sField.getDivision()%></td>
                                <td><%=sField.getName()%></td>
                                <td><%=sField.getExplain()%></td>
                                <td class="update">
                                   <a href="FieldUpdateAdmin.jsp?num=<%=sField.getNum()%>">
                                    <input type="button" value="수정">
                                    </a>
                                </td>
                                <td class="delete">
                                    <form action = "fieldDelete.do?num=<%=sField.getNum()%>">
                                    <input type="submit" value="삭제">
                                    </form>
                                </td>
                            </tr>
                            <%}
                            else
                            {
                            	for(FieldVO vo : list)
                            {%>
                            	<tr>
                                <td><%=vo.getDivision() %></td>
                                <td><%=vo.getName() %></td>
                                <td><%=vo.getExplain() %></td>
                                <td class="update">
                                   <a href="FieldUpdateAdmin.jsp?num=<%=vo.getNum()%>">
                                    <input type="button" value="수정">
                                    </a>
                                </td>
                                <td class="delete">
                                    <form action = "fieldDelete.do">
                                    <input type = "hidden" name = "num" value = "<%=vo.getNum()%>">
                                    <input type="submit" value="삭제">
                                    </form>
                                </td>
                            </tr>
                            <%}
                            }
                            %>
                        </table>
                        <div class="button1">
                        <a href = "FieldUpdateAdmin.jsp">
                           <input type="button" value="추가">
                        </a>
                        </div>
                    </div>
               </form>
            </article>
        </section>
        <footer>
            <%@ include file = "footerAdmin.jsp" %>
        </footer>
    </div>
</body>
</html>