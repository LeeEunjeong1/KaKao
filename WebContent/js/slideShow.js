$(function(){
    var movedIndex;
    
    //슬라이드 패널을 움직여주는 함수
    function moveSlide(index){
        //전달받은 index 값을 moveIndex에 저장
        //prev와 next메소드에서 사용
        movedIndex = index;
        
        //슬라이드 이동
        var moveLeft = -(index * 1000);
        $('#slidePanel').animate({'left':moveLeft}, 'slow');
    }
    
    //초기 슬라이더 위치 랜덤하게 지정
    var randomNumber = Math.floor(Math.random()*5);
    moveSlide(randomNumber);
    
    //prev버튼 클릭하면 앞으로 이동
    $('#prevButton').on('click', function(){
        if(movedIndex != 0) //첫번째가 아니라면
            movedIndex = movedIndex -1;
        moveSlide(movedIndex);
    });
    
    //next버튼 클릭하면 뒤로 이동
    $('#nextButton').on('click', function(){
        if(movedIndex != 4) //마지막이 아니라면
            movedIndex = movedIndex + 1;
        moveSlide(movedIndex);
    });
    
    setInterval(function(){
        if(movedIndex != 4)
            movedIndex = movedIndex + 1; //오른쪽
        else
            movedIndex = 0; //처음
        
        moveSlide(movedIndex); //인덱스값 전달
    }, 2000);
});