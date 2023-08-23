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
    <link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/main/main.css">
    <title>메인페이지</title>
</head>
<body>
    <%@ include file="../header.jsp" %>
    <div class="container">
        <!-- 배너 -->
        <div class="slider">
            <img src="/images/main/banner1.jpg" class="slide">
            <img src="/images/main/banner2.jpg" class="slide">
            <div class="toggle">
                <button class="active" data-slide="1"></button>
                <button data-slide="2"></button>
            </div>
        </div>
        <div class="main_search">
            <div class="main_search_bg">
                <div class="tabs_menu">
                    <p>언제, 어디로 여행을 떠날 예정인가요?</p>
                </div>
                <div class="search_box">
                    <div class="area">
                        <div class="tab_content">
                            <div class="search_form">
                            <ul id="main_travel_search">
                            <!-- 검색 창 -->
                                <form id="main_travelForm" method="get">			
                                    <li class="area_form">
                                        <input type="text" name="location_input" value="" placeholder="어디로 가실건가요?" readonly/>						
                                    </li>
                                    <li class="cal">
                                        <input name="calendar" placeholder="출발 날짜를 입력해주세요." class="search_cal" type="text" style="cursor:pointer;" readonly="" required>
                                    </li>
                                    <li class="cal">
                                        <input input name="calendar" placeholder="도착 날짜를 입력해주세요." class="search_cal" type="text" style="cursor:pointer;" readonly="" required>
                                    </li>
                                </form>		
                            </ul>
                                <li class="search_confirm">
                                    <a href="javascript:;" id="mainSearchBtn" data-kind="h"><i class="xi-search"></i>&nbsp;검색</i></a>
                                </li>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 이달의 인기여행지 -->
        <div id="popularity_place_area">
            <h2>이달의 인기 여행지</h2>
            <div class="popularity_place">
                <ul class="popularity_place_tabs">
                    <li class="on">#서울</li>
                    <li class>#경기</li>
                    <li class>#인천</li>
                    <li class>#대전</li>
                    <li class>#대구</li>
                    <li class>#광주</li>
                    <li class>#부산</li>
                    <li class>#울산</li>
                    <li class>#강원</li>
                    <li class>#제주</li>
                </ul>
                    <div class="popularity_top_eight">
                        <div class="size-text">
                            <strong>인기 TOP 8</strong>
                        </div>
                        <table class="size-table">
                            <tbody>
                                <tr>
                                    <th style="width:10%;" id="border_line_top">1. [서울 성동구] 서울숲</th>
                                </tr>
                                <tr>
                                    <th style="width:10%;">2. [서울 용산구] 남산타워</th>
                                </tr>
                                <tr>
                                    <th style="width:10%;">3. [서울 중구] 동대문 디자인 플라자</th>
                                </tr>
                                <tr>
                                    <th style="width:10%;">4. [서울 용산구] 하이브 인사이트</th>
                                </tr>
                                <tr>
                                    <th style="width:10%;">5. [서울 중구] 청계천</th>
                                </tr>
                                <tr>
                                    <th style="width:10%;">6. [서울 종로구] 경복궁</th>
                                </tr>
                                <tr>
                                    <th style="width:10%;">7. [서울 용산구] 남산 서울타워</th>
                                </tr>
                                <tr>
                                    <th style="width:10%;" id="border_line_bottom">8. [서울 마포구] 하늘공원</th>
                                </tr>
                                <tr>
                                    <td>2023.03.29 15:00 기준</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="popularity_picture">
                        <div class="picture-list">
                        <div class="picture-list-bar">
                            <ul>
                            <li style="width: 0px;"></li>
                            <li>
                                <img src="/images/main/popular1.jpg">
                                <div class="caption">
                                <h3>[서울 성동구] 서울숲</h3>
                                <div class="icon">+</div>
                                <p class="place">
                                    반려동물 동반가능한, 시민의 참여로 <br>이루어진 최초의 공원
                                </p>
                                <p class="genre">문의 및 안내 : 02-460-2905<br>주소 : 서울특별시 성동구 뚝섬로 273<br>휴일 : 연중무휴 (일부 시설 월요일 휴관)</p>
                                </div>
                            </li>
                            <li>
                                <img src="/images/main/popular2.jpg">
                                <div class="caption">
                                <h3>[서울 용산구] 남산타워</h3>
                                <div class="icon">+</div>
                                <p class="place">
                                    대를 이어온 데이트의 추억
                                </p>
                                <p class="genre">문의 및 안내 : 02-3455-9277<br>주소 : 서울특별시 용산구 남산공원길 105<br>휴일 : 연중무휴</p>
                                </div>
                            </li>
                            <li>
                                <img src="/images/main/popular3.jpg">
                                <div class="caption">
                                <h3>[서울 중구] DDP</h3>
                                <div class="icon">+</div>
                                <p class="place">
                                    가장 매력적인 서울 야경을 볼 수 있는 동대문에 위치한 복합 문화공간
                                </p>
                                <p class="genre">문의 및 안내 : 02-2153-0000<br>주소 : 서울특별시 중구 을지로 281<br>휴일 : 신정, 추석, 설날 당일(살림터는 매월 세번째주 월요일 휴무)</p>
                                </div>
                            </li>
                            </ul>
                        </div>
                    </div>
                </div>    
            </div>
            <a href="" class="more">더보기 ></a>
        </div>

        <!-- 요즘 뜨는 핫플 -->
        <div id="hot_place_background">
            <div class="hot_place">
                <h2>요즘 뜨는 핫플!</h2>
                <ul class="hot_place_tabs">
                    <li class="on">#벚꽃 축제</li>
                    <li class>#야경 명소</li>
                    <li class>#액티비티</li>
                    <li class>#감성 카페</li>
                    <li class>#전시/공연</li>
                    <li class>#힐링</li>
                    <li class>#배낭여행</li>
                </ul>
            </div>

            <div class="hot_picture-list">
                <ul>
                    <li style="width: 0px;"></li>
                    <li>
                        <div class="image_group_bottom">
                            <img src="/images/main/hot1.jpg">
                        </div>
                        <div class="caption">
                            <h3>대구 - 이월드 블라썸 피크닉</h3>
                            <p class="place">
                                축제기간 : 2023.03.18(토) ~ 2023.04.09(일)<br>운영시간 : 평일 10:30 ~ 21:00, 주말 : 10:00 ~ 22:00
                            </p>
                        </div>
                    </li>
                    <li>
                        <div class="image_group_top">
                            <img src="/images/main/hot2.jpg">
                        </div>  
                        <div class="caption">
                            <h3>창원 - 진해 군항제</h3>
                            <p class="place">
                                축제기간 : 2023.03.25(토) ~ 2023.04.03(월)<br>운영시간 : 평일 10:30 ~ 21:00, 주말 : 10:00 ~ 22:00
                            </p>
                        </div>
                    </li>
                    <li>
                        <div class="image_group_bottom">
                            <img src="/images/main/hot3.jpg">
                        </div>  
                        <div class="caption">
                            <h3>서울 - 석촌호수 벚꽃 축제</h3>
                            <p class="place">
                                축제기간 : 2023.03.25(토) ~ 2023.04.03(월)<br>운영시간 : 평일 10:30 ~ 21:00, 주말 : 10:00 ~ 22:00
                            </p>
                        </div>
                    </li>
                    <li>
                        <div class="image_group_top">
                            <img src="/images/main/hot4.JPG">
                        </div> 
                        <div class="caption">
                            <h3>가평 - 에덴벚꽃길 벚꽃 축제</h3>
                            <p class="place">
                                축제기간 : 2023.04.08(토) ~ 2023.04.16(일)<br>운영시간 : 주말 09:00 ~ 20:00
                            </p>
                        </div>
                    </li>
                </ul>
                <a href="" class="more">더보기 ></a>
            </div>
        </div>

        <!-- 여행 상품 추천 -->
        <div class="travel_products">
            <h2>여행 상품 추천</h2>
            <div class="travel_products_list">
                <ul>
                    <li>
                        <div class="round_square_first">
                            <div class="image_group" id="img_first">
                                <img src="/images/main/product1.JPG">
                            </div>
                            <div class="caption">
                                <h3>[당일치기] 수원 화성 야경 투어 19,900원 ~</h3>
                                <p class="place">
                                    조선 최초의 신도시, 정조의 야심작 수원화성.조선의<br> 
                                    뇌섹남 정조가 꿈꾸었던 세상, 수원화성에서 만나봅니다.
                                </p>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="round_square_second">
                            <div class="image_group" id="img_second">
                                <img src="/images/main/product2.jpg">
                            </div>
                            <div class="caption">
                                <h3>[1박2일] KTX 부산 명소 구석구석 완전 일주 214,000원 ~</h3>
                                <p class="place">
                                    부산의 구석구석 BEST 명소를 찾아 떠나는 가성비 좋은 여행
                                </p>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="round_square_third">
                            <div class="image_group" id="img_third">
                                <img src="/images/main/product3.jpg">
                            </div>
                            <div class="caption">
                                <h3>[1박2일] 제천 워터파크 캠핑랜드  150,000원 ~</h3>
                                <p class="place">
                                    대형 실내 온수 워터파크, 놀이기구, 글램핑 등 아이들이 더 좋아하는<br> 캠핑장
                                </p>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 이용가이드 / 공지사항&이벤트 -->
        <div id="guide_background">
            <div class="guide_wrap">
                <div class="cs_guide">
                    <h3>이용가이드</h3>
                    <table class="cs_guide_tbl">
                        <tr>
                            <td><a href=""><img src="/images/main/guide1.jpg" alt="예약조회"><p>예약조회</p></a></td>
                            <td><a href=""><img src="/images/main/guide2.jpg" alt="여행후기"><p>여행후기</p></a></td>
                            <td><a href=""><img src="/images/main/guide3.jpg" alt="문의답변"><p>문의답변</p></a></td>
                            <td><a href=""><img src="/images/main/guide4.jpg" alt="자주하는 질문"><p>자주하는 질문</p></a></td>
                        </tr>
                    </table>
                </div>
                <div class="notice">
                    <h3>공지사항 &amp; 이벤트<a href="" class="more_view">+ 더보기</a></h3>
                    <ul>
                        <li>
                            <a href="" title="공지사항">
                                <span class="c_y">[공지]</span>공지사항<span class="notice_date">2022-11-30</span>
                            </a>
                        </li>
                        <li>
                            <a href="" title="공지사항">
                                <span class="c_y">[공지]</span>공지사항<span class="notice_date">2022-11-30</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <%@include file="../footer.jsp" %>
    <script src="/js/main/main.js"></script>
</body>
</html>