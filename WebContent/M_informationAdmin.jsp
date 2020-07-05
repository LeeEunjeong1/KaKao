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
	int num = Integer.parseInt(request.getParameter("num"));
	ProductService service = ProductService.serviceGetInstance();
	ArrayList<ProductVO> list = service.getProductList();
	ProductVO product = null;
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
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>인형/피규어</title>
    <link rel="icon" href="images/peach.jpg" type="image/x-icon">
    <link rel="stylesheet" href="css/category.css" type="text/css">
    <link rel="stylesheet" href="css/mInformation.css" type="text/css">
</head>
<body>
    <div id="wrap">
        <header>
            <%@ include file = "headerAdmin.jsp" %>
        </header>
        <section>
            <article>
               <div id="table_div">
                  <h4>* 카테고리(캐릭터이름) > 분류(ex.문구) > 상품명</h4>
                   <table>
                    <tr>
                        <td rowspan="3" class="imgitem"><img src=<%=product.getImage()%>></td>
                        <th class="name">상품명</th>
                        <td class="name"><%=product.getName()%></td>
                    </tr>        
                    <tr class="won">
                        <th>판매가</th>
                        <td><%=product.getPrice()%>원</td>
                    </tr>
                    <tr>
                        <th>가격</th>
                        <td id="amount"><%=product.getPrice()%>원</td>
                    </tr>                    
                </table> 
                </form>
               </div>
               <div id="product_content">
                   <p><%=product.getDetail()%></p>
               </div>
            </article>
        </section>
        <footer>
           <%@ include file = "footerAdmin.jsp" %>
    </div>
</body>
</html>