<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@
	page import = "com.kakao.VO.ResumeVO"
		 import = "com.kakao.VO.FieldVO"
		 import = "com.kakao.service.ResumeService"
		 import = "com.kakao.service.MemberService"
		 import = "com.kakao.service.FieldService"
		 import = "com.kakao.controller.HttpUtil"
%>
<%@ page import = "java.util.ArrayList" %>
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
    <title>지원서관리</title>
    <link rel="icon" href="images/lion.png" type="image/x-icon">
    <link rel="stylesheet" href="css/indexAdmin.css" type="text/css">
    <link rel="stylesheet" href="css/UserAdmin.css" type="text/css">
</head>
<body>
<%
	ResumeService service = ResumeService.getInstance();
	MemberService service_2 = MemberService.serviceGetInstance();
	FieldService service_3 = FieldService.getInstance();
	ResumeVO resume = (ResumeVO) request.getAttribute("sResume"); //search resume
	ArrayList<ResumeVO> list = service.getResumeList(); // resume list
	ArrayList<FieldVO> flist = service_3.getFieldList(); //field list
	ArrayList<ResumeVO> slist = null; // select resume list
	if(request.getAttribute("searchList") != null)
	{
		slist = (ArrayList<ResumeVO>) request.getAttribute("searchList");
	}
%>
    <div id="wrap">
        <header>
            <%@ include file = "headerAdmin.jsp" %>
        </header>
        <section>
         <ul id="group">
         <%
         	for(FieldVO vo : flist)
         	{
         		System.out.println("name : " + vo.getName());
         		%>
         		<li><a href="resumeSearchWN.do?name=<%=vo.getName()%>"><%=vo.getName()%></a></li>
         	<%}
         %>
           </ul>
            <article>
              <p>지원서관리</p>
               <form action="resumeSearch.do" method="post">
                   <div id="search">
                        <input type="search" class="UserSearch" name = "id">
                        <input type="submit" value="검색" class="SearchButton">
                    </div>
                    <div id="UserTable">
                        <table>
                            <tr>
                                <th>아이디</th>
                                <th>제목</th>
                                <th>분야</th>
                            </tr>
                             <%
                            if(resume != null)
                            {
                            	String uId = service_2.getMemberId(resume.getUserNum()); 
                            %>
                            <tr>
                                <td><%=uId%></td>
                                <%-- <td><%=resume.getTitle()%></td> --%>
                                <td><a href = "MyApplyAdmin.jsp?userNum=<%=resume.getUserNum()%>"><%=resume.getTitle()%></a></td>
                                <td><%=resume.getField()%></td>                               
                            </tr>
                            <%}
                            else if(slist != null)
                            {
                            	for(ResumeVO cResume : slist)
                            	{
                            		String uId = service_2.getMemberId(cResume.getUserNum()); 
                            	%>
                            		<tr>
	                                    <td><%=uId%></td>
	                                    <td><a href = "MyApplyAdmin.jsp?userNum=<%=cResume.getUserNum()%>"><%=cResume.getTitle()%></a></td>
	                                    <td><%=cResume.getField()%></td>                               
                                	</tr>
                            	<%}
                            }
                            else
                            {
                            	for(ResumeVO cResume : list)
                            	{
                            		String uId = service_2.getMemberId(cResume.getUserNum()); 
                            	%>
                            		<tr>
	                                    <td><%=uId%></td>
	                                   <td><a href = "MyApplyAdmin.jsp?userNum=<%=cResume.getUserNum()%>"><%=cResume.getTitle()%></a></td>
	                                    <td><%=cResume.getField()%></td>                               
                                	</tr>
                            	<%}
                            }
                            %>                                                                             
                        </table>
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