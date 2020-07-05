<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "com.kakao.service.ProductService"
    import = "com.kakao.VO.ProductVO"
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
<%
	ProductService service = ProductService.serviceGetInstance();
	int num = Integer.parseInt(request.getParameter("num"));
	ProductVO product = null;
	ArrayList<ProductVO> list = service.getProductList();
	for(ProductVO vo : list)
	{
		if(vo.getNum()==num)
		{
			product = vo;
			break;
		}
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>필드관리</title>
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
              <p>상품수정</p>
               <form action="productUpdate.do" method="post">
                    <div id="UserTable">
                    <table>
                       <tr>
                           <th class="first">상품명</th>
                           <td><input type = "text" name = "name" value = "<%=product.getName()%>"></td>
                           <th class="first">가격</th>
                           <td><input type = "text" name = "price" value = "<%=product.getPrice()%>"></td>
                       </tr>
                        <tr>
                            <th class="first">상품이미지</th>
                            <td><input type = "text" name = "image" value = "<%=product.getImage()%>"></td>
                            <th class="first">캐릭터</th>
                            <td>
                                <select name="cha" id="sort">
                                    <option value="llion">Lion</option>
                                    <option value="apeach">Apeach</option>
                                    <option value="neo">Neo</option>
                                    <option value="muzi">Muzi/kun</option>
                                    <option value="tubo">Tube</option>
                                    <option value="jay_g">Jay-G</option>
                                    <option value="frodo">Frodo</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th class="first">상품설명</th>
                            <td><input type = "text" name = "detail" value = "<%=product.getDetail()%>"></td>
                            <th class="first">분류</th>
                            <td>
                                <select name="category" id="sort">
                                    <option value="stationery">Stationery</option>
                                    <option value="clothes">Clothes</option>
                                    <option value="doll">Doll</option>
                                    <option value="goods">Goods</option>
                                    <option value="jewelry">Jewelry</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                    <div class="button1">
                          <input type="hidden" name="num" value = "<%=product.getNum()%>">
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