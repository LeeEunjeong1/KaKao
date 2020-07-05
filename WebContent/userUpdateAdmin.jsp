<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "com.kakao.VO.MemberVO"
    import = "com.kakao.service.MemberService"
    import = "java.util.ArrayList"
    import = "com.kakao.controller.HttpUtil"%>
<% 
	if(session.getAttribute("admin") == null)
	{
		HttpUtil.forward(request, response,"index.jsp");
		return;
	}
%>
<%
	MemberService service = MemberService.serviceGetInstance();
	ArrayList<MemberVO> list = service.getMemberList();
	String mode;
	int userNum = 0;
	if(request.getParameter("userNum")!=null)
		userNum = Integer.parseInt(request.getParameter("userNum"));
	MemberVO member = null;
	if(userNum != 0)
	{
		mode = "admin";
		for(MemberVO vo : list)
		{
			if(vo.getNum()==userNum)
			{
				member = vo;
				break;
			}
		}
	}
	else
	{
		mode = "user";
		member = (MemberVO) session.getAttribute("cUser");
	}
	System.out.println("mode in jsp : " + mode);
%>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>회원관리</title>
    <link rel="icon" href="images/lion.png" type="image/x-icon">
    <link rel="stylesheet" href="css/indexAdmin.css" type="text/css">
    <link rel="stylesheet" href="css/UserAdmin.css" type="text/css">
</head>
<body>
    <div id="wrap">
        <header>
        <%@ include file = "headerAdmin.jsp"%>
        </header>
        <section>
            <article>
              <p>회원정보수정</p>
               <form action="memberUpdate.do" method="post">
                    <div id="UserTable">
                <table>
                   <tr>
                       <th class="first">회원번호</th>
                       <td><input type = "text" name = "num" value = "<%=member.getNum()%>"readonly></td>
                       <th class="first">아이디</th>
                        <td><input type = "text" name = "id" value = "<%=member.getId()%>"></td>
                   </tr>
                    <tr>
                        <th class="first">패스워드</th>
                        <td><input type = "text" name = "pw" value = "<%=member.getPw()%>"></td>
                        <th class="first">이메일</th>
                        <td><input type = "text" name = "email" value = "<%=member.getEmail()%>"></td>
                    </tr>
                    <tr>
                        <th class="first">이름</th>
                        <td><input type = "text" name = "name" value = "<%=member.getName()%>"></td>
                        <th class="first">주소</th>
                        <td><input type = "text" name = "address" value = "<%=member.getAddress()%>"></td>
                    </tr>
                    <tr>
                        <th class="first">보유초코</th>
                        <td><input type = "text" name = "cho" value = "<%=member.getCho()%>" readonly></td>
                        <th class="first">성별</th>
                        <td><input type = "text" name = "gender" value = "<%=member.getGender()%>"></td>
                    </tr>
                    <tr>
                        <th class="first">핸드폰번호</th>
                        <td><input type = "text" name = "phone" value = "<%=member.getPhone()%>"></td>
                        <th class="first">생일</th>
                        <td><input type = "text" name = "birthDate" value = "<%=member.getBirthDate()%>"></td>
                    </tr>
                </table>
                        <div class="button1">
                        	<input type = "hidden" value = "<%=member.getNum()%>" name = "num">
                        	<input type = "hidden" value = <%=mode %> name = "mode">
                            <input type="submit" value="저장">
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