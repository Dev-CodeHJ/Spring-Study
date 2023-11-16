<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
	body {
		margin: 0 auto;
  		width: 800px;
  		align-content: center;
	}
	table {
		width: auto;
		border-collapse: collapse;
	}
	table td, th {
		border: black solid 1px;
		padding: 5px;
	}
</style>
</head>
<body>
	<h1 style="text-align: center;">회원가입</h1>
	<form method="post" action="">
		<table>
			<tr>
				<th colspan="2" style="background-color: navy; color: white;" >회원 기본 정보</th>
			</tr>
			<tr>
				<td width="130px">아이디</td>
				<td>
					<input type="text" name="id" id="id"> ※4-12자의 영문 대소문자와 숫자로만 입력
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password" name="pw" id="pw"> ※4-12자의 영문 대소문자와 숫자로만 입력
				</td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td>
					<input type="password" name="pw2" id="pw2">
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="name" id="name">
				</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>
					<input type="text" name="tel1" id="tel1" size="10"> - <input type="text" name="tel2" id="tel2" size="10"> - <input type="text" name="tel3" id="tel3" size="10"> ※앞자리는 010,011,017,018,019로 입력
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<input type="text" name="addr" id="addr">
				</td>
			</tr>
			<tr>
				<td>생일</td>
				<td>
					<input id="datepicker" type="text" name="birth" id="birth">
				</td>
			</tr>
			<tr>
				<td>직업</td>
				<td>
					<label><input type="radio" name="job" id="job" value="student">학생</label>
					<label><input type="radio" name="job" id="job" value="employee">직장인</label>
					<label><input type="radio" name="job" id="job" value="owner">자영업</label>
					<label><input type="radio" name="job" id="job" value="etc" checked="checked">기타</label>
					<input type="text" name="etc" id="etc" size="10">
				</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<label><input type="radio" name="gender" id="gender" value="male" checked="checked">남자</label>
					<label><input type="radio" name="gender" id="gender" value="female">여자</label>
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
					<input type="email" name="email" id="email"> ex)aaa123456@naver.com 
				</td>
			</tr>
			<tr>
				<td>자기소개</td>
				<td>
					<textarea rows="13" cols="80" name="introduce" id="introduce"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center" style="border: none;">
		            <input type="button" id="btn_join" value="회원 가입">
		            <input type="reset" id="btn_cancel" value="다시 작성">
		        </td>
	        </tr>
		</table>
	</form>
<script type="text/javascript">
    $(document).ready(function() {
    $("#btn_join").click(function() {
       
            var tel1_pattern = /(^01[01789]$)/;
            var regex = /^[A-Za-z0-9+]{4,12}$/; 
 
            if ($("#id").val() == "") {
                alert("아이디를 입력해주세요!");
                $("#id").focus();
            } else if (!regex.test($("#id").val())) {
                alert("4-12자의 영문 대소문자와 숫자로만 입력해주세요!");
                $("#id").focus();
                
            } else if ($("#pw").val() == "") {
                alert("비밀번호를 입력해주세요!");
                $("#pw").focus();
            } else if (!regex.test($("#pw").val())) {
                alert("4-12자의 영문 대소문자와 숫자로만 입력해주세요!");
                $("#pw").focus();
                
            }else if ($("#pw2").val() == "") {
                alert("비밀번호확인을 입력해주세요!");
                $("#pw2").focus();
            } else if ($("#pw").val() != $("#pw2").val()) {
                alert("비밀번호와 비밀번호 확인이 일치하지않습니다.");
                $("#pw2").focus();
                
            } else if ($("#name").val() == "") {
                alert("이름을 입력해주세요!");
                $("#name").focus();
                
            } else if ($("#tel1").val() == "") {
                alert("전화번호를 입력해주세요!");
                $("#tel1").focus();
            } else if ($("#tel1").val().length != 3) {
            	alert("첫 번째 전화번호 입력란은 010,011,017,018,019로 시작해야합니다!!");
                $("#tel1").focus();
            } else if (isNaN($("#tel1").val())) {
            	alert("첫 번째 전화번호 입력란은 010,011,017,018,019로 시작해야합니다!!");
                $("#tel1").focus();
            } else if (!tel1_pattern.test($("#tel1").val())) {
                alert("첫 번째 전화번호 입력란은 010,011,017,018,019로 시작해야합니다!!");
                $("#tel1").focus();
            }
 
            else if ($("#tel2").val() == "") {
            	alert("전화번호를 입력해주세요!");
                $("#tel2").focus();
            } else if (isNaN($("#tel2").val())) {
            	alert("전화번호를 입력해주세요!");
                $("#tel2").focus();
            }
 
            else if ($("#tel3").val() == "") {
            	alert("전화번호를 입력해주세요!");
                $("#tel3").focus();
 
            } else if ($("#addr").val() == "") {
                alert("주소를 입력해주세요!");
                $("#addr").focus();
 
            } else if ($("#birth").val() == "") {
                alert("생일을 입력해주세요!");
                $("#birth").focus();
 
            } else if ($("#job").val() == "") {
                alert("직업을 선택해주세요!");
                $("#job").focus();
 
            }  else if ($("#email").val() == "") {
                alert("이메일을 입력해주세요!");
                $("#email").focus();
                
            } else if ($("#introduce").val() == "") {
                alert("자기소개를 입력해주세요!");
                $("#intro").focus();
                
            } else {
                alert("회원가입이 완료되었습니다!!");
            }
        });
    
 
        $("#birth").datepicker(); 
 
    });
   
</script>
<script>
   $(function() {
       //input을 datepicker로 선언
       $("#datepicker").datepicker({
           dateFormat: 'yy-mm-dd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능                
           ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
           ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
           ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
           ,buttonText: "선택" //버튼 호버 텍스트              
           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
           ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
           ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
       });                    
       
       //초기값을 오늘 날짜로 설정해줘야 합니다.
       $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
   });
</script>
</body>
</html>