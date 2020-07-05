<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "com.kakao.VO.MemberVO"
    import = "com.kakao.service.MemberService"
    import = "java.util.ArrayList"
    import = "com.kakao.controller.HttpUtil"
    %>
<% 
	if(session.getAttribute("admin") == null)
	{
		HttpUtil.forward(request, response,"index.jsp");
		return;
	}
%>   
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>회원관리</title>
    <link rel="icon" href="images/lion.png" type="image/x-icon">
    <link rel="stylesheet" href="css/indexAdmin.css" type="text/css">
    <link rel="stylesheet" href="css/UserAdmin.css" type="text/css">
</head>
<body>
<%
	MemberService service = MemberService.serviceGetInstance();
	ArrayList<MemberVO> list = service.getMemberList();
	MemberVO member = null;
	if(request.getAttribute("sUser") != null)
	{
		member = (MemberVO) request.getAttribute("sUser");
	}
%>
    <div id="wrap">
        <header>
            <%@ include file = "headerAdmin.jsp" %>
        </header>
        <section>
            <article>
              <p>회원관리</p>
               <form action="memberSearch.do" method="post">
                   <div id="search">
                        <input type="search" class="UserSearch" name = "searchBox">
                        <input type="submit" value="검색" class="SearchButton">
                    </div>
                    </form>
                    <div id="UserTable">
                        <table>
                            <tr>
                                <th>회원번호</th>
                                <th>아이디</th>                            
                                <th>이름</th>
                                <th>주소</th>
                                <th>보유초코</th>
                                <th></th>
                                <th></th>
                            <%
                            if(member != null)
                            {%>
                            	<tr>
                                <td><%=member.getNum()%></td>
                                <td><%=member.getId()%></td>
                                <td><%=member.getName()%></td>
                                <td><%=member.getAddress()%></td>
                                <td><%=member.getCho()%></td>
                                <td class="update">
                                   <a href="userUpdateAdmin.jsp?userNum=<%=member.getNum()%>">
                                    <input type="button" value="수정">
                                    </a>
                                    
                                </td>
                                <td class="delete">
                                    <a href="memberDelete.do?num=<%=member.getNum()%>">
                                    <input type="button" value="삭제">
                                    </a>
                                </td>                               
                            	</tr>
                            <%}
                            else
                            {
                            	for(MemberVO vo : list)
                            	{%>                            	
                            	<tr>
                                <td><%=vo.getNum()%></td>
                                <td><%=vo.getId()%></td>
                                <td><%=vo.getName()%></td>
                                <td><%=vo.getAddress()%></td>
                                <td><%=vo.getCho()%></td>    
                                <td class="update">
                                   <a href="userUpdateAdmin.jsp?userNum=<%=vo.getNum()%>">
                                    <input type="button" value="수정">
                                    </a>
                                </td>
                                <td class="delete">
                                    <a href="memberDelete.do?num=<%=vo.getNum()%>">
                                    <input type="button" value="삭제">
                                    </a>
                                </td>                          
                            	</tr>	
                            	<%}                           	
                            }
                            %>   
                            </tr>
                        </table>
                    </div>
            </article>
        </section>
        <footer>
            <%@ include file = "footerAdmin.jsp" %>
        </footer>
    </div>
</body>
</html>