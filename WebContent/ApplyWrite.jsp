<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.kakao.service.FieldService" %>
<%@ page import = "com.kakao.VO.FieldVO" %>
<%@ page import = "com.kakao.service.ResumeService" %>
<%@ page import = "com.kakao.VO.ResumeVO" %>
<%@ page import = "com.kakao.controller.HttpUtil" %>
<%@ page import = "java.util.ArrayList" %>
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
    <title>입사지원</title>
    <link rel="icon" href="images/lion.png" type="image/x-icon">
    <link rel="stylesheet" href="css/index.css" type="text/css">
    <link rel="stylesheet" href="css/applyWrite.css" type="text/css">
    <script src="js/jquery-3.2.1.min.js"></script>
</head>
<body>
<%
	MemberVO member = (MemberVO) session.getAttribute("cUser");
	ResumeService s = ResumeService.getInstance();
	ArrayList<ResumeVO> rlist = s.getResumeList();
	for(ResumeVO vo : rlist)
	{
		if(vo.getUserNum() == member.getNum())
		{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('이미 작성한 지원서가 존재합니다.');");
			out.println("location='Apply.jsp';");
			out.println("</script>");
			/* HttpUtil.forward(request, response, "Apply.jsp");
			return; */
		}
	}
	FieldService service = FieldService.getInstance();
	ArrayList<FieldVO> list = service.getFieldList();
%>
    <div id="wrap">
        <header>
            <%@ include file="header.jsp" %>
        </header>
        <section>
            <article>
               <h3>지원서작성</h3>
               <form action = "resumeInsert.do" method = "post">
                <table>
                    <tr>
                        <th>Title</th>
                        <input type = "hidden" value = "<%=member.getNum() %>" name = "userNum">  
                        <td><input type="text" name = "title"></td>
                    </tr>
                    <tr>
                        <th>Field</th>
                        <td>
                            <select name="field" id="field">
							    <%
							    String selectField = request.getParameter("field");
							    System.out.println("applywrite  selectfieldname : " + selectField);
							    if(selectField != null)
							    {
							    	/* out.print("<option value = " + selectField + " > " + selectField + "</option>" + "<br>"); */
							    	%>
							    	<option value = "<%=selectField%>"><%=selectField%></option>
							    <%}
							    else
							    {
							    	for(FieldVO field : list)
									{%>
										
										<option value = "<%=field.getName()%>"><%=field.getName()%></option>
									<%}
							    }
								%>
                            </select> 
                        </td>
                    </tr>
                    <tr>
                        <th>Content</th>
                        <td>
                            <textarea name="content" id="content" cols="93" rows="50"></textarea>
                            <input type="submit" value="제출" id="submit">
                        </td>
                        
                    </tr>
                </table>
                </form>
            </article>
        </section>
        <footer>
             <%@ include file="footer.jsp" %>
        </footer>
    </div>
</body>
</html>