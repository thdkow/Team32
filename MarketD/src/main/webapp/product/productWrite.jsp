<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/reply.js"></script>
<script type="text/javascript">
alert="시밤";
		$(document).ready(function() {

			$("#save").click(function() {//#으로 id를 호출하여 jquery를 사용하였다.

				if ($("#pcontent").val() != "") {// else if를 한 이유는 textarea를 이용했을때 비교가 안되고 값이 null로 들어가
					//db에 입력이 되어버려서 조건을 추가해서 막아놓았다.
					var frm = document.form1;
					frm.action = "${pageContext.request.contextPath}/Product/ProductSaleWriteAction.dobby";
					frm.method = "post";
					frm.submit();
				}
			}); //click 입력확인
			
			$("#cart").click(function() {//#으로 id를 호출하여 jquery를 사용하였다.

				if ($("#midx").val() != "") {// else if를 한 이유는 textarea를 이용했을때 비교가 안되고 값이 null로 들어가
					//db에 입력이 되어버려서 조건을 추가해서 막아놓았다.
					var frm = document.form1;
					frm.action = "${pageContext.request.contextPath}/Product/ProductPlusShoppingCart.dobby";
					frm.method = "post";
					frm.submit();
				}
			}); //click 입력확인

		});

</script>

</head>
<body>
	<h1 style="text-align: center;">판매글 작성</h1>

	<form name="form1">

		<table
			style="table-layout: fixed; border-collapse: collapse; margin-left: auto; margin-right: auto; border: 3px solid green; width: 800px; height: 400px; text-align: center;">


			<tr>
				<td style="background-color: gray; border: 3px solid green;">제목</td>
				<td colspan=3
					style="border: 3px solid green; background-color: white;"><input
					type="text" name="psubject" value=""
					style="border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;" /></td>
			</tr>
			<!-- 보더 콜랩스로 컬럼과 표테두리 사이의 공간을 없앴다.(collapse는 부순다라는 의미로 테두리를 부숴서 없앤다) -->
			<tr>
				<td style="background-color: gray; border: 3px solid green;">내용</td>
				<td style="border: 3px solid green; background-color: white;">
					<input type="text" name="pcontent" value=""
					style="border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;" />
					<!-- 기본값을 ""로 지정하였는데 기본값을 지정하지않고 초기화를 하지않는다면
					기록이 없을때 출력시에 null로 나오게된다. ""와 null은 다르다 -->
				</td>
				<td style="background-color: gray; border: 3px solid green;">품목</td>
				<td style="border: 3px solid green; background-color: white;">
					<input type="text" name="caidx" value=""
					style="border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;" />
				</td>
			</tr>
			<tr>
				<td style="background-color: gray; border: 3px solid green;">수량</td>
				<td colspan=3
					style="border: 3px solid green; background-color: white;"><input
					type="text" name="pvol" value=""
					style="border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;" /></td>
			</tr>
			<tr>
				<td style="background-color: gray; border: 3px solid green;">금액</td>
				<td colspan=3
					style="border: 3px solid green; background-color: white;"><input
					type="text" name="pmoney" value=""
					style="border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;" /></td>
				<!-- 라디오 타입의 기원은 차량라디오의 버튼에서 유래되었다. 라디오 버튼 처럼 둥그런모양이다. -->
			</tr>
			<tr>
				<td style="background-color: gray; border: 3px solid green;">배송비</td>
				<td colspan=3
					style="border: 3px solid green; background-color: white;"><input
					type="text" name="pfee" value="" size="6" maxlength="6"
					style="border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;" /></td>
			</tr>
			<tr>
				<td style="background-color: gray; border: 3px solid green;">사용자</td>
				<td colspan=3
					style="border: 3px solid green; background-color: white;"><input
					type="text" name="midx" value=""
					style="border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;" /></td>
			</tr>


			<tr>
				<td colspan=2
					style="border: 3px solid green; background-color: white;"><input
					type="button" id="save" style="width: 250px;" value="전   송" /></td>
					
					<td colspan=2
					style="border: 3px solid green; background-color: white;"><input
					type="button" id="cart" style="width: 250px;" value="전   송" /></td>
			</tr>
		</table>
	</form>
</body>
</html>