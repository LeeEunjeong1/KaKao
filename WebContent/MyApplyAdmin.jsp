<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.kakao.service.ResumeService" %>
<%@ page import = "java.util.ArrayList"
		 import = "com.kakao.controller.HttpUtil"
		 import = "com.kakao.VO.ResumeVO"
		 import = "com.kakao.VO.MemberVO" 
		 import = "com.kakao.VO.FieldVO"%>
<% 
	if(session.getAttribute("admin") == null)
	{
		HttpUtil.forward(request, response,"index.jsp");
		return;
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>지원서관리</title>
    <link rel="icon" href="images/lion.png" type="image/x-icon">
    <link rel="stylesheet" href="css/indexAdmin.css" type="text/css">
    <link rel="stylesheet" href="css/applyWrite.css" type="text/css">
    <script>
    	function submitAction(num)
    	{
    		if(num == 1)
    			{
    				document.updateForm.action = "resumeUpdate.do";
    			}
    		if(num == 2)
    			{
    				document.updateForm.action = "resumeDelete.do";
    			}
    		document.updateForm.submit();
    	}
    </script>
</head>
<body>
<%
	String mode;
	MemberVO member = (MemberVO) session.getAttribute("cUser");
	ResumeService service = ResumeService.getInstance();
	ResumeVO resume = null;
	if(member == null)
	{
		mode = "readOnly";
		System.out.println("userNum : " + request.getParameter("userNum"));
		int userNum = Integer.parseInt(request.getParameter("userNum"));
		resume = service.showResume(userNum);
	}
	else
	{
		mode = "modify";
		resume = service.showResume(member.getNum());
	}
	/* ResumeVO resume = service.showResume(member.getNum()); */
	if(resume == null)
	{
		/* out.println("<script type=\"text/javascript\">");
		out.println("alert('이미 작성한 지원서가 존재합니다.');");
		out.println("location='Apply.jsp';");
		out.println("</script>"); */ //스크립트 안먹힘
		HttpUtil.forward(request, response,"Apply.jsp");
		return;
	}
	
	ArrayList<FieldVO> list = service.getFieldList();	
%>
    <div id="wrap">
        <header>
        <%@ include file="headerAdmin.jsp"%>
        </header>
        <section>
            <article>
               <h3>지원서 관리</h3>
               <form action="" method="post" name = "updateForm">
                <table>
                    <tr>
                        <th>Title</th>
                        <%
                        if(mode.equals("readOnly"))
                        {%>
                        	<td><input type="text" name = "title" value = "<%=resume.getTitle()%>" readonly></td>
                        <%}
                        else{
                        %>
                        <td><input type="text" name = "title" value = "<%=resume.getTitle()%>"></td>
                        <%
                        }
                        %>
                    </tr>
                    <tr>
                        <th>Field</th>
                        <td>
                            <select name="field" id="field">
                                <%
                                if(mode.equals("readOnly"))
                                {%>
                                	<option value = "<%=resume.getField()%>" selected><%=resume.getField()%></option>
                                <%}
                                else
                                {
								for(FieldVO field : list)
								{
									System.out.println("resume field name : " + resume.getField());
									System.out.println("field name : " + field.getName());
									if((resume.getField()).equals(field.getName()))
									{
										
										%>
										
										<option value = "<%=field.getName() %>" selected><%=field.getName() %></option>
										<%
										/* out.print("<option selected = \"selected\" value = " + field.getName() + " > " + field.getName() + "</option>" + "<br>"); */
									}
									else
									{
									%>
									<option value = "<%=field.getName() %>"><%=field.getName() %></option>
									<%}/* out.print("<option value = " + field.getName() + " > " + field.getName() + "</option>" + "<br>"); */
								}
                                }
								%>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>Content</th>
                        <td>
                        <%
                        if(mode.equals("modify"))
                        {%>
                        	 <textarea name="content" id="content" cols="93" rows="50"><%=resume.getContent()%></textarea>
                             <input type = "hidden" value = "<%=member.getNum()%>" name = "userNum">
                             <input type="submit" value="수정" id="submit" onclick = "submitAction(1)">
                             <input type="submit" value="삭제" id="delete" onclick = "submitAction(2)">
                        <%}
                        else
                        {%>
                         <textarea name="content" id="content" cols="93" rows="50" readOnly><%=resume.getContent()%></textarea>
                         	
                        <%}
                        %>
       
                        </td>
                    </tr>
                </table>
                </form>
            </article>
        </section>
        <footer>
            <%@ include file="footerAdmin.jsp" %>
        </footer>
    </div>
</body>
</html>