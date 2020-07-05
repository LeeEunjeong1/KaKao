<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
        <title>회원가입</title>
        <link rel="icon" href="images/lion.png" type="image/x-icon">
        <link rel="stylesheet" href="css/index.css" type="text/css">
        <link rel="stylesheet" type="text/css" href="css/Form.css">
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/FormCheck.js"></script>
        <script>
        function mysubmit(num)
        {
        	if(num == 1)
			{
        		document.newMemberForm.action = 'idCheck.do';
			}
        	if(num == 2)
        	{
        		document.newMemberForm.action = 'memberInsert.do';
        	}
        	document.newMemberForm.submit();
        }
        </script>  
</head>
<body>
         <div id="wrap">
         <header>
           <%@ include file="header.jsp" %>
        </header>
            <form id="newMemberForm" name="newMemberForm" method="post" action="memberInsert.do">
          <h3 class="join">회원가입</h3>
          <p class="necessary">*은 필수 입력 사항입니다.</p>
           <h3 class="text">개인정보 수집 및 이용에 대한 안내</h3>
            <div class="agreeArea">
                <div class="agree">
                    <p>1. 목적 : 지원자 개인 식별, 지원의사 확인, 입사전형의 진행, 고지사항 전달, 입사 지원자와의 원활한 의사소통, 지원이력 확인 및 면접 불합격자 재지원 제한
2. 항목 : 아이디(이메일주소), 비밀번호, 이름, 생년월일, 휴대폰번호
3. 보유기간 : 회원 탈퇴 시까지 보유 (단, 지원이력 정보는 일방향 암호화하여 탈퇴일로부터 1년간 보관 후 파기합니다.) </p>
                </div>
                <p class="check">
                    <span>이용약관에 동의하십니까?</span>
                    <input type="checkbox" id="agree" name="agree">동의함
                </p>
            </div>
          <table>
            <tr>
                <th>아이디 *</th>
                <td class="put">
                    <input type="text" id="id" name="id" value =${id }  >${msg} (6~12자 이내)
                    <input type="button" value="중복확인" onClick = "mysubmit(1)">
                </td>
            </tr>
            <tr>
                <th>비밀번호 *</th>
                <td class="put"><input type="password" id="pwd" name="pwd"></td>
            </tr>
            <tr>
                <th>비밀번호 확인 *</th>
                <td class="put"><input type="password" id="pwdcheked" name="pwdchecked"></td>
            </tr>
            <tr>
                 <th>비밀번호 확인 질문 *</th>
                  <td class="put">
                    <select id="department" name="department">
                        <option value="">선택하세요</option>
                        <option value="site">기억에 남는 추억의 장소는?</option>
                        <option value="motto">자신의 인생의 좌우명은?</option>
                        <option value="character">내가 좋아하는 캐릭터는?</option>
                        <option value="reborn">다시 태어나면 되고 싶은 것은?</option>
                    </select>
                </td>
            </tr>
            <tr>
                 <th>비밀번호 확인 답변 *</th>
                 <td class="put"><input type="text"  id="answer" name="answer"></td>
            </tr> 
              <tr>
                  <th>이름 *</th>
                  <td class="put"><input type="text" id="name" name="name"></td>
              </tr>
               <tr>
                  <th>성별</th>
                  <td class="put">
                      <input type="radio" id="gender" name="gender" value="man" >남
                      <input type="radio" id="gender" name="gender" value="woman">여
                  </td>
               </tr>
               <tr>
                   <th>주소</th>
                   <td class="put">
                       <input type="text" name="address">
                   </td>
               </tr>
               <tr>
                   <th>생년월일</th>
                   <td class="put"><input type="date" id="birth" name="birthDate"></td>
               </tr>
                 <tr>
                  <th>휴대폰 번호 *</th>
                  <td class="put">
                   <select id="hp1" name="hp1">
                       <option value="010">010</option> 
                       <option value="010">011</option> 
                       <option value="010">016</option> 
                       <option value="010">017</option> 
                       <option value="010">018</option>
                   </select> 
                    - <input type="text" id="hp4" size="4">
                    - <input type="text" id="hp5" size="4">
                    </td>
                </tr>      
                <tr>
                    <th>이메일 *</th>
                    <td class="put"><input type="email" id="email" name="email"></td>
                </tr>             
            </table>
            <div class="btnArea">
                <a href="#"><input type="submit" value="회원가입" class="btn1">
                </a>
                <a href=""><input type="reset" value="회원가입취소" class="btn2"></a>
            </div>
           </form> 
        <footer>
            <%@ include file="footer.jsp" %>
        </footer>      
        </div>	          
    </body>
</html>