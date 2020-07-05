<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "com.kakao.service.ProductService"
    import = "com.kakao.VO.ProductVO"
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
	ProductService service = ProductService.serviceGetInstance();
	ArrayList<ProductVO> list = service.getProductList();
	ProductVO product = null;
	if(request.getAttribute("sProduct") != null)
	{
		System.out.println("product is not null");
		product = (ProductVO) request.getAttribute("sProduct");
	}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>상품관리</title>
    <link rel="icon" href="images/lion.png" type="image/x-icon">
    <link rel="stylesheet" href="css/indexAdmin.css" type="text/css">
    <link rel="stylesheet" href="css/UserAdmin.css" type="text/css">
</head>
<body>
    <div id="wrap">
        <header>
            <%@ include file = "headerAdmin.jsp" %>
        </header>
        <section>
            <article>
              <p>상품관리</p>
               <form action="productSearch.do">
                   <div id="search">
                        <input type="search" class="UserSearch" name = "name">
                        <input type="submit" value="검색" class="SearchButton">
                    </div>
               </form>
                    <div id="UserTable">
                        <table>
                            <tr>
                                <th>상품명</th>
                                <th>가격</th>
                                <th>설명</th>
                                <th>상품이미지</th>
                                <th>
                                <th>
                            </tr>
                            <%
                            	if(product != null)
                            	{
                            		ProductVO vo = product;	
                            	%>                            	
                            		<tr>
		                                <td><a href = "M_informationAdmin.jsp?num=<%=vo.getNum()%>"><%=vo.getName()%></a></td>
		                                <td><%=vo.getPrice()%></td>
		                                <td><%=vo.getDetail()%></td>
		                                <td><%=vo.getImage()%></td>
		                                <td class="update">
                                    	<a href="ProductUpdateAdmin.jsp?num=<%=vo.getNum()%>">
                                        <input type="button" value="수정">
                                    	</a>
                                		</td>
		                                <td class="delete">
			                                <a href="productDelete.do?num=<%=vo.getNum()%>">
	                                        <input type="button" value="삭제">
                                    	</a>
		                                </td>
                            		</tr>
                            	<%
                            	}
                            	else
                            	{
                            	for(ProductVO vo : list)
                            	{%>
	                            	<tr>
		                                <td><a href = "M_informationAdmin.jsp?num=<%=vo.getNum()%>"><%=vo.getName()%></a></td>
		                                <td><%=vo.getPrice()%></td>
		                                <td><%=vo.getDetail()%></td>
		                                <td><%=vo.getImage()%></td>
		                                <td class="update">
                                    	<a href="ProductUpdateAdmin.jsp?num=<%=vo.getNum()%>">
                                        <input type="button" value="수정">
                                    	</a>
                                		</td>
		                                <td class="delete">
		                                    <a href="productDelete.do?num=<%=vo.getNum()%>">
                                        	<input type="button" value="삭제">
                                    	</a>
		                                </td>
                            		</tr>			                       
                            	<%}
                            	}
                            %>
                        </table>
                        <div class="button1">
                        	<a href = "ProductInsert.jsp">
			            	<input type="submit" value="추가">
			            	</a>
			            </div>
                    </div>
            </article>
        </section>
        <footer>
           <%@ include file = "footerAdmin.jsp" %>
        </footer>
    </div>
</body>
</html>