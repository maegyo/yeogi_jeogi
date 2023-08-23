<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  <title>대한민국 여기저기 : 회원가입</title>
</head>
<body>
	<div id="container">
		<div class="form-wrap">
			<form action="/membership/add" method="post" enctype="multipart/form-data">
				<h4><label for="used-id">아이디</label><br></h4>
				<input type="text" name="mUserId" id="used-id" style="cursor: pointer" maxlength="20">
				<h4><label for="password">비밀번호</label><br></h4>
				<input type="password" name="mPassword" id="password" style="cursor: pointer" maxlength="20">
				<h4><label for="password">비밀번호 재확인</label><br></h4>
				<input type="password" name="password" id="password" style="cursor: pointer" maxlength="20">
				<h4><label for="name">이름</label><br></h4>
				<input type="text" name="mName" id="mName" style="cursor: pointer" maxlength="20">
				<h4><label for="phone" name = "phone">휴대전화</label><br></h4>
				<select id="nation"><br>
					<option value="1" selected="">미국/캐나다 +1</option>
					<option value="55" selected="">브라질 +82</option>
					<option value="44" selected="">영국 +44</option>
					<option value="81" selected="">일본 +81</option>
					<option value="86" selected="">중국 +86</option>
					<option value="33" selected="">프랑스 +33</option>
					<option value="61" selected="">호주 +61</option>
					<option value="82" selected="">대한민국 +82</option>
				</select><br>
				<input type="text" id="phone" name="mPhone" style="cursor: pointer" placeholder="전화번호 입력">
				<label for="phone" class="lbl"></label>
				<a href="#" class="tel-btn" onclick="javascript:telbtn()">인증번호 받기</a>
				<input type="phone" id="tel-btn2" name="tel-btn2" style="cursor: pointer" placeholder="인증번호 입력하세요">
				<div>
					<h4><label for="MBTI">MBTI</label></h4>
					<select id="MBTI" class="sel" name="mMbti">
						<option value="MBTI">유형</option>
						<option value="ISTJ">ISTJ</option>
						<option value="ISTP">ISTP</option>
						<option value="ISFJ">ISFJ</option>
						<option value="ISFP">ISFP</option>
						<option value="INTJ">INTJ</option>
						<option value="INTP">INTP</option>
						<option value="INFJ">INFJ</option>
						<option value="INFP">INFP</option>
						<option value="ESTJ">ESTJ</option>
						<option value="ESTP">ESTP</option>
						<option value="ESFJ">ESFJ</option>
						<option value="ESFP">ESFP</option>
						<option value="ENTJ">ENTJ</option>
						<option value="ENTP">ENTP</option>
						<option value="ENFJ">ENFJ</option>
						<option value="ENFP">ENFP</option>
					</select>
				</div>
				<h4><label for="email">본인 확인 이메일<span style="color: gray;"><span style="font-size: 11px;">(선택)</span></span></label><br></h4>
				<input type="email" name="mEmail" id="email" style="cursor: pointer">
				<button type="submit" class="btn">가입하기</button>
			</form>
		</div>
	</div>
</body>
</html>