//JavaScript
//formCheck.js

$(function(){
    //엔터키 눌렀을 때 무조건 submit 안되도록
    //문서 전체에 이벤트 처리
    //[Enter]키의 아스키 코드값: 13
    $(document).on('keydown', function(e){
        if(e.keyCode==13)
        return false;
    });
    
    $('#id').focus(); //시작시 id에 포커스
    
    //엔터키 눌렀을 때 포커스 이동
    //ID 입력 후 엔터키를 눌렀을 때 비밀번호로 포커스
    $('#id').on('keydown', function(e){
        if($('#id').val()!=""&&e.keyCode ==13) //ID를 입력해야만 이동
            //if(e.keyCode==13)//입력하지 않아도 이동할 경우
            $('#pwd').focus();
    });
    
    //input에 포커스가 있을 때
    $('input').on('focus', function(){
        $(this).css('background-color', 'rgb(232,232,232)');
    });
    
    
    //포커스 잃을 때
    $('input').on('blur', function(){
        $(this).css('background-color', '#white');
        $(':submit').css('background-color', '#ffcd00');
        $(':reset').css('background-color', '#332805');
    });
    
    //newMemberForm의 submit(전송) 버튼을 누를 때
    $('#newMemberForm').on('submit', function(){
        if($('#id').val()==""){ //ID를 입력하지 않은 경우
            alert("아이디를 입력하세요.");
            $('#id').focus();
            return false; //서버로 전송되지 않도록 전송 기능 막음
        }
        if($('#id').val().length<6 || $('#id').val().length>12){
            alert("아이디는 6~12자 이내로 입력하세요.");
            $('#id').focus();
            return false;
        }
        if($('#pwd').val()==""){ //비밀번호 입력하지 않은 경우
            alert("비밀번호를 입력하세요.");
            $('#pwd').focus();
            return false;
        }
        if($('#pwdcheked').val()==""){ //비밀번호 확인을 입력하지 않은 경우
            alert("비밀번호 확인을 입력하세요.");
            $('#pwdcheked').focus();
            return false;
        }
        if($('#pwd').val()!=$('#pwdcheked').val()){
            alert("비밀번호 확인이 일치하지 않습니다.");
            $('#pwdcheked').focus();
            return false;
        }
        if($('select').val()==""){ //select 선택하지 않은 경우
            alert("비밀번호 확인 질문을 선택하세요.");
            $('select').focus();
            return false;
        }
        if($('#answer').val()==""){ //비밀번호 확인 답변을 입력하지 않은경우
            alert("비밀번호 확인 답변을 입력하세요.");
            $('#answer').focus();
            return false;
        }
        if($('#name').val()==""){ //이름을 입력하지 않은 경우
            alert("이름을 입력하세요.");
            $('#name').focus();
            return false;
        }
        if($('#hp4').val()==""){
            alert("휴대폰번호를 입력하세요.");
            $('#hp4').focus();
            return false;
        }
        if($('#email').val()==""){
            alert("이메일을 입력하세요.");
            $('#email').focus();
            return false;
        }
         if(!$('input[type="checkbox"]').is(':checked')){
            alert("개인정보 수집에 동의하세요.");
             $('#agree').focus();
            return false;
        }
        
    }); //폼 submit 끝
  
    //두번째 번호 입력란에서 입력값이 4개가 되면 포커스 이동
    $('#hp2').on('keyup', function(){
        if($(this).val().length==3)
            $('#hp3').focus();
    });
    $('#hp4').on('keyup', function(){
        if($(this).val().length==4)
            $('#hp5').focus();
    })
}); //$function() 끝