<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../season.css">
    
    <title>메인페이지</title>
</head>
<body>
 <%@ include file="../header.jsp" %>
    <div id="container">
     
       <div class="menu">
            <ul>
                <li><a href="">지역별 여행</a></li>
                <li><a href="">계절별 여행</a></li>
                <li><a href="">MBTI별 여행</a></li>
            </ul>
       </div>
       <div class="season">
            <ul>
                <li><a href="">봄</a></li>
                <li><a href="">여름</a></li>
                <li><a href="">가을</a></li>
                <li><a href="">겨울</a></li>
            </ul>
        </div>
        <br>
        <hr class="type1">
        <br>
        <p class="type2"><a href="">조회순</a> | <a href="">인기순</a></p>
        <br>

        <div id="popup">
            <div class="popup-inner">
                <div class="slider-2">
    
                    <div class="side-btns">
                       <div><span><i class="fas fa-caret-left"></i></i></span></div>
                       <div><span><i class="fas fa-caret-right"></i></span></div>
                   </div>
                   
                   <div class="slides">
                       <div class="active" style="background-image:url(../지역별/지역별여행/1.jpg);"></div>
                       <div style="background-image:url(../지역별/지역별여행/2.jpg);"></div>
                       <div style="background-image:url(../지역별/지역별여행/3.jpg);"></div>
                       <div style="background-image:url(../지역별/지역별여행/4.jpg);"></div>
                   </div>
                   
                   <div class="page-nav">
                       <div class="active"></div>
                       <div></div>
                       <div></div>
                       <div></div>
                   </div>
               </div>
               <div class="wrap">
                <div class="tab_menu">
                  <ul class="list">
                    <li class="is_on">
                      <a href="#tab1" class="btn">여행지정보</a>
                      <div id="tab1" class="cont"><p>꿈꾸고(Dream), 만들고(Design), 누린다(Play)는 뜻을 가지고 있는 DDP(동대문 디자인 플라자)는 서울특별시 동대문에 위치한 복합문화공간이다. 
                        2014년 3월 21일 개관한 이래 굵직한 전시와 패션쇼, 신제품 발표회, 포럼과 콘퍼런스를 개최해오고 있다. 
                        알림터, 배움터, 살림터, DDP디자인뮤지엄, 디자인장터와 어울림광장, 동대문역사문화공원으로 나뉘었다. 
                        알림터에서는 서울패션위크, MAMA(Mnet Asian Music Awards), 반클리프 아펠전, BMW 신차 발표회 등을 개최했고, 
                        다목적 연회 공간인 국제회의장 시설을 갖추었다. BTS 주제전과 서울도시건축비엔날레 등이 열렸던 배움터, 
                        누구나 디자이너가 되는 곳을 주제로 2019년 개장한 시민 라운지 ‘D-숲’과 DDP 관련 기념품을 소개하는 DDP디자인스토어를 아우르는 살림터까지, 
                        규모에 걸맞은 내실로 관람객의 흥미를 북돋운다. 식당과 베이커리, 
                        카페가 들어선 디자인장터 역시 감성 충전을 기대하는 가족이나 연인을 만족시키고도 남을 산책 코스다.</p></div>
                    </li>
                    <li>
                      <a href="#tab2" class="btn">상세정보</a>
                      <div id="tab2" class="cont"><img src ="../지역별/지역별여행/5.jpg"></div>
                    </li>
                    <li>
                      <a href="#tab3" class="btn">오시는 길</a>
                      <div id="tab3" class="cont"><img src = "../지역별/지역별여행/6.jpg"></div>
                    </li>
                  </ul>
                </div>
              </div>
                    <button type ="button" class="pop1">닫기</button>
            </div>
        </div>

        <div class="content">
            <div class="img1">
                <div id="img">
                       <div><img src="../지역별/지역별여행/찜.png" width="15px"> 266 &nbsp; 
                        <img src="../지역별/지역별여행/조회수.png" width="15px"> 54 &nbsp;
                        <img src="../지역별/지역별여행/댓글.png" width="15px"> 43</div>
                    <h3>중구</h3>
                    <p>동대문 디자인 플라자</p>
                </div>
            </div>
            <div class="img2">
                <div id="img">
                    <div><img src="../지역별/지역별여행/찜.png" width="15px"> 266 &nbsp; 
                        <img src="../지역별/지역별여행/조회수.png" width="15px"> 54 &nbsp;
                        <img src="../지역별/지역별여행/댓글.png" width="15px"> 43</div>
                    <h3>중구</h3>
                    <p>동대문 역사 문화 공원</p>
                </div>
            </div>
            <div class="img3">
                <div id="img">
                    <div><img src="../지역별/지역별여행/찜.png" width="15px"> 266 &nbsp; 
                        <img src="../지역별/지역별여행/조회수.png" width="15px"> 54 &nbsp;
                        <img src="../지역별/지역별여행/댓글.png" width="15px"> 43</div>
                    <h3>강서구</h3>
                    <p>서울 식물원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                </div>
            </div>
            <div class="img4">
                <div id="img">
                    <div><img src="../지역별/지역별여행/찜.png" width="15px"> 266 &nbsp; 
                        <img src="../지역별/지역별여행/조회수.png" width="15px"> 54 &nbsp;
                        <img src="../지역별/지역별여행/댓글.png" width="15px"> 43</div>
                    <h3>중구</h3>
                    <p>서울 스카이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                </div>
            </div>
            <div class="img5">
                <div id="img">
                    <div><img src="../지역별/지역별여행/찜.png" width="15px"> 266 &nbsp; 
                        <img src="../지역별/지역별여행/조회수.png" width="15px"> 54 &nbsp;
                        <img src="../지역별/지역별여행/댓글.png" width="15px"> 43</div>
                    <h3>종로구</h3>
                    <p>경복궁&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                </div>
            </div>
            <div class="img1">
                <div id="img">
                    <div><img src="../지역별/지역별여행/찜.png" width="15px"> 266 &nbsp; 
                        <img src="../지역별/지역별여행/조회수.png" width="15px"> 54 &nbsp;
                        <img src="../지역별/지역별여행/댓글.png" width="15px"> 43</div>
                    <h3>중구</h3>
                    <p>동대문 디자인 플라자</p>
                </div>
            </div>
            <div class="img2">
                <div id="img">
                    <div><img src="../지역별/지역별여행/찜.png" width="15px"> 266 &nbsp; 
                        <img src="../지역별/지역별여행/조회수.png" width="15px"> 54 &nbsp;
                        <img src="../지역별/지역별여행/댓글.png" width="15px"> 43</div>
                    <h3>중구</h3>
                    <p>동대문 역사 문화 공원</p>
                </div>
            </div>
            <div class="img3">
                <div id="img">
                    <div><img src="../지역별/지역별여행/찜.png" width="15px"> 266 &nbsp; 
                        <img src="../지역별/지역별여행/조회수.png" width="15px"> 54 &nbsp;
                        <img src="../지역별/지역별여행/댓글.png" width="15px"> 43</div>
                    <h3>강서구</h3>
                    <p>서울 식물원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                </div>
            </div>
            <div class="img4">
                <div id="img">
                    <div><img src="../지역별/지역별여행/찜.png" width="15px"> 266 &nbsp; 
                        <img src="../지역별/지역별여행/조회수.png" width="15px"> 54 &nbsp;
                        <img src="../지역별/지역별여행/댓글.png" width="15px"> 43</div>
                    <h3>중구</h3>
                    <p>서울 스카이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                </div>
            </div>
            <div class="img5">
                <div id="img">
                    <div><img src="../지역별/지역별여행/찜.png" width="15px"> 266 &nbsp; 
                        <img src="../지역별/지역별여행/조회수.png" width="15px"> 54 &nbsp;
                        <img src="../지역별/지역별여행/댓글.png" width="15px"> 43</div>
                    <h3>종로구</h3>
                    <p>경복궁&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                </div>
            </div>
            <div class="img1">
                <div id="img">
                    <div><img src="../지역별/지역별여행/찜.png" width="15px"> 266 &nbsp; 
                        <img src="../지역별/지역별여행/조회수.png" width="15px"> 54 &nbsp;
                        <img src="../지역별/지역별여행/댓글.png" width="15px"> 43</div>
                    <h3>중구</h3>
                    <p>동대문 디자인 플라자</p>
                </div>
            </div>
            <div class="img2">
                <div id="img">
                    <div><img src="../지역별/지역별여행/찜.png" width="15px"> 266 &nbsp; 
                        <img src="../지역별/지역별여행/조회수.png" width="15px"> 54 &nbsp;
                        <img src="../지역별/지역별여행/댓글.png" width="15px"> 43</div>
                    <h3>중구</h3>
                    <p>동대문 역사 문화 공원</p>
                </div>
            </div>
            <div class="img3">
                <div id="img">
                    <div><img src="../지역별/지역별여행/찜.png" width="15px"> 266 &nbsp; 
                        <img src="../지역별/지역별여행/조회수.png" width="15px"> 54 &nbsp;
                        <img src="../지역별/지역별여행/댓글.png" width="15px"> 43</div>
                    <h3>강서구</h3>
                    <p>서울 식물원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                </div>
            </div>
            <div class="img4">
                <div id="img">
                    <div><img src="../지역별/지역별여행/찜.png" width="15px"> 266 &nbsp; 
                        <img src="../지역별/지역별여행/조회수.png" width="15px"> 54 &nbsp;
                        <img src="../지역별/지역별여행/댓글.png" width="15px"> 43</div>
                    <h3>중구</h3>
                    <p>서울 스카이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                </div>
            </div>
            <div class="img5">
                <div id="img">
                    <div><img src="../지역별/지역별여행/찜.png" width="15px"> 266 &nbsp; 
                        <img src="../지역별/지역별여행/조회수.png" width="15px"> 54 &nbsp;
                        <img src="../지역별/지역별여행/댓글.png" width="15px"> 43</div>
                    <h3>종로구</h3>
                    <p>경복궁&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                </div>
            </div>
            <div class="img1">
                <div id="img">
                    <div><img src="../지역별/지역별여행/찜.png" width="15px"> 266 &nbsp; 
                        <img src="../지역별/지역별여행/조회수.png" width="15px"> 54 &nbsp;
                        <img src="../지역별/지역별여행/댓글.png" width="15px"> 43</div>
                    <h3>중구</h3>
                    <p>동대문 디자인 플라자</p>
                </div>
            </div>
            <div class="img2">
                <div id="img">
                    <div><img src="../지역별/지역별여행/찜.png" width="15px"> 266 &nbsp; 
                        <img src="../지역별/지역별여행/조회수.png" width="15px"> 54 &nbsp;
                        <img src="../지역별/지역별여행/댓글.png" width="15px"> 43</div>
                    <h3>중구</h3>
                    <p>동대문 역사 문화 공원</p>
                </div>
            </div>
            <div class="img3">
                <div id="img">
                    <div><img src="../지역별/지역별여행/찜.png" width="15px"> 266 &nbsp; 
                        <img src="../지역별/지역별여행/조회수.png" width="15px"> 54 &nbsp;
                        <img src="../지역별/지역별여행/댓글.png" width="15px"> 43</div>
                    <h3>강서구</h3>
                    <p>서울 식물원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                </div>
            </div>
            <div class="img4">
                <div id="img">
                    <div><img src="../지역별/지역별여행/찜.png" width="15px"> 266 &nbsp; 
                        <img src="../지역별/지역별여행/조회수.png" width="15px"> 54 &nbsp;
                        <img src="../지역별/지역별여행/댓글.png" width="15px"> 43</div>
                    <h3>중구</h3>
                    <p>서울 스카이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                </div>
            </div>
            <div class="img5">
                <div id="img">
                    <div><img src="../지역별/지역별여행/찜.png" width="15px"> 266 &nbsp; 
                        <img src="../지역별/지역별여행/조회수.png" width="15px"> 54 &nbsp;
                        <img src="../지역별/지역별여행/댓글.png" width="15px"> 43</div>
                    <h3>종로구</h3>
                    <p>경복궁&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                </div>
            </div>
            <div class="img1">
                <div id="img">
                    <div><img src="../지역별/지역별여행/찜.png" width="15px"> 266 &nbsp; 
                        <img src="../지역별/지역별여행/조회수.png" width="15px"> 54 &nbsp;
                        <img src="../지역별/지역별여행/댓글.png" width="15px"> 43</div>
                    <h3>중구</h3>
                    <p>동대문 디자인 플라자</p>
                </div>
            </div>
            <div class="img2">
                <div id="img">
                    <div><img src="../지역별/지역별여행/찜.png" width="15px"> 266 &nbsp;
                        <img src="../지역별/지역별여행/조회수.png" width="15px"> 54 &nbsp;
                        <img src="../지역별/지역별여행/댓글.png" width="15px"> 43</div>
                    <h3>중구</h3>
                    <p>동대문 역사 문화 공원</p>
                </div>
            </div>
            <div class="img3">
                <div id="img">
                    <div><img src="../지역별/지역별여행/찜.png" width="15px"> 266 &nbsp; 
                        <img src="../지역별/지역별여행/조회수.png" width="15px"> 54 &nbsp;
                        <img src="../지역별/지역별여행/댓글.png" width="15px"> 43</div>
                    <h3>강서구</h3>
                    <p>서울 식물원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                </div>
            </div>
            <div class="img4">
                <div id="img">
                    <div><img src="../지역별/지역별여행/찜.png" width="15px"> 266 &nbsp; 
                        <img src="../지역별/지역별여행/조회수.png" width="15px"> 54 &nbsp;
                        <img src="../지역별/지역별여행/댓글.png" width="15px"> 43</div>
                    <h3>중구</h3>
                    <p>서울 스카이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                </div>
            </div>
            <div class="img5">
                <div id="img">
                    <div><img src="../지역별/지역별여행/찜.png" width="15px"> 266 &nbsp; 
                        <img src="../지역별/지역별여행/조회수.png" width="15px"> 54 &nbsp;
                        <img src="../지역별/지역별여행/댓글.png" width="15px"> 43</div>
                    <h3>종로구</h3>
                    <p>경복궁&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                </div>
            </div>
        </div>
        <br>
        <div class="paging">
            <a href="">1</a>
            <a href="">2</a>
            <a href="">3</a>
            <a href="">4</a>
            <a href="">5</a>
            <a href="">5</a>
            <a href="">6</a>        
            <a href="">7</a>
            <a href="">8</a>
            <a href="">9</a>
            <a href="">10</a>
            <a href=""><img src="../1.jpg"></a>
            <a href=""><img src="../2.jpg"></a>
        </div>

        <div class="search">
             <input class ="seh" type="text" placeholder="검색어를 입력해 주세요">
             <button class="btn1" ></button>
        </div>
        <br>
     <%@include file="../footer.jsp" %>
    </div>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script>
    $(document).ready(function(){
                    $(".img1").click(function(){
                        $("#popup").fadeIn();
                    });
                    $(".pop1").click(function(){
                        $("#popup").fadeOut();
                    });            
    });
    $('.slider-2 .page-nav > div').click(function() {
    
    var $this = $(this);
    var $pagenav = $this.parent()
    var $current = $pagenav.find('.active');
    
    $current.removeClass('active');
    $this.addClass('active');

    var index = $this.index();
    var $슬라이더 = $this.closest('.slider-2');
    
    $슬라이더.find('.slides > div.active').removeClass('active');
    $슬라이더.find('.slides > div').eq(index).addClass('active');
    
    
});

$('.slider-2 > .side-btns > div:first-child').click(function() {
    var $this = $(this);
    var $slider = $this.closest('.slider-2');
    
    var $current = $slider.find('.page-nav > div.active');
    var $post = $current.prev();
    
    if ( $post.length == 0 ) {
        $post = $slider.find('.page-nav > div:last-child');
    }
    
    $post.click();
});

$('.slider-2 > .side-btns > div:last-child').click(function() {
    var $this = $(this);
    var $slider = $this.closest('.slider-2');
    
    var $current = $slider.find('.page-nav > div.active');
    var $post = $current.next();
    
    if ( $post.length == 0 ) {
        $post = $slider.find('.page-nav > div:first-child');
    }
    
    $post.click();
});

const tabList = document.querySelectorAll('.tab_menu .list li');
for(var i = 0; i < tabList.length; i++){
  tabList[i].querySelector('.btn').addEventListener('click', function(e){
    e.preventDefault();
    for(var j = 0; j < tabList.length; j++){
      tabList[j].classList.remove('is_on');
    }
    this.parentNode.classList.add('is_on');
  });
}
 </script>
</body>
</html>