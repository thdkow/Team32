<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>HTML, CSS and JavaScript demo</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#panel1").slideToggle(0);
		$("#panel2").slideToggle(0);
		$("#panel3").slideToggle(0);
		$("#panel4").slideToggle(0);
		$("#panel5").slideToggle(0);
		$("#panel6").slideToggle(0);
		$("#panel7").slideToggle(0);
		$("#panel8").slideToggle(0);
		$("#panel9").slideToggle(0);
		$("#panel10").slideToggle(0);

		$("#flip1").click(function() {
			$("#panel1").slideToggle("700");
		});
		$("#flip2").click(function() {
			$("#panel2").slideToggle("700");
		});
		$("#flip3").click(function() {
			$("#panel3").slideToggle("700");
		});
		$("#flip4").click(function() {
			$("#panel4").slideToggle("700");
		});
		$("#flip5").click(function() {
			$("#panel5").slideToggle("700");
		});
		$("#flip6").click(function() {
			$("#panel6").slideToggle("700");
		});
		$("#flip7").click(function() {
			$("#panel7").slideToggle("700");
		});
		$("#flip8").click(function() {
			$("#panel8").slideToggle("700");
		});
		$("#flip9").click(function() {
			$("#panel9").slideToggle("700");
		});
		$("#flip10").click(function() {
			$("#panel10").slideToggle("700");
		});
	});
</script>

</head>
<body>
	<!-- Start your code here -->
	<table style="margin-left: auto; margin-right: auto;">
		<tr>
			<td style="height: 50px;"></td>
		</tr>
		<tr>
			<td>

				<table
					style="width: 1000px; border-top: 1px solid #7393b6; border-bottom: 1px solid #7393b6;">
					<tr>
						<td
							style="font-size: 1.5em; text-align: left; border-bottom: 1px solid #7393b6; height: 50px">
							���ֹ��� ���� &nbsp <a style="font-size: 0.5em;">1:1����</a>
						</td>
					</tr>
					<tr>
						<td id="flip1" style="font-size: 1.3em; cursor: pointer;">
							Q1.�Ǹ��Ϸ��� ��ǰ�� ��� ����ϳ���?
							<div id="panel1" style="font-size: 0.8em;">�Ǹ��Ͻ÷��� �������� Ȩ ȭ��
								��� �����ʿ� [�Ǹ��ϱ�] ��ư�� ���� �� ������ ����, �̹���, �󼼼���, ī�װ�, ���� ���� ����������
								�Է��Ͽ� ����Ͻ� �� �ֽ��ϴ�.</div>
						</td>
					</tr>
					<tr>
						<td id="flip2"
							style="font-size: 1.3em; border-top: 1px solid #7393b6; cursor: pointer;">
							Q2.�Ǹ��ϸ� �ȵǴ� �׸��� �ֳ���?
							<div id="panel2" style="font-size: 0.8em;">
							�ǻ� ó���� �ʿ��� �Ǿ�ǰ, ���, ���ڴ��, ��� �ַ�, ���ο�ǰ, �㰡���� ���� ���̾�Ʈ ��ǰ ���� �����������Դϴ�.</div>
						</td>
					</tr>
					<td id="flip3"
						style="font-size: 1.3em; border-top: 1px solid #7393b6; cursor: pointer;">
						Q3.������ �˻��� ��� �ϳ���?
						<div id="panel3" style="font-size: 0.8em;">
							������Ʈ ��� �˻�â�� �˻�� �Է��Ͽ� ã���÷��� �������� �˻��� �� �ֽ��ϴ�.</div>
					</td>
					</tr>
					<td id="flip4"
						style="font-size: 1.3em; border-top: 1px solid #7393b6; cursor: pointer;">
						Q4.�����ؾ� �ϴ� �ൿ�� �ֳ���?
						<div id="panel4" style="font-size: 0.8em;">�Ǹ��Ͻ÷��� �������� Ȩ ȭ��
							��� �����ʿ� [�Ǹ��ϱ�] ��ư�� ���� �� ������ ����, �̹���, �󼼼���, ī�װ�, ���� ���� ���������� �Է��Ͽ�
							����Ͻ� �� �ֽ��ϴ�.</div>
					</td>
					</tr>
					<td id="flip5"
						style="font-size: 1.3em; border-top: 1px solid #7393b6; cursor: pointer;">
						Q5.ȸ������ ������ ��� �ϳ���?
						<div id="panel5" style="font-size: 0.8em;">�Ǹ��Ͻ÷��� �������� Ȩ ȭ��
							��� �����ʿ� [�Ǹ��ϱ�] ��ư�� ���� �� ������ ����, �̹���, �󼼼���, ī�װ�, ���� ���� ���������� �Է��Ͽ�
							����Ͻ� �� �ֽ��ϴ�.</div>
					</td>
					</tr>
					<td id="flip6"
						style="font-size: 1.3em; border-top: 1px solid #7393b6; cursor: pointer;">
						Q6.�Ǹ��� ����� �����ΰ���?
						<div id="panel6" style="font-size: 0.8em;">�Ǹ��Ͻ÷��� �������� Ȩ ȭ��
							��� �����ʿ� [�Ǹ��ϱ�] ��ư�� ���� �� ������ ����, �̹���, �󼼼���, ī�װ�, ���� ���� ���������� �Է��Ͽ�
							����Ͻ� �� �ֽ��ϴ�.</div>
					</td>
					</tr>
					<td id="flip7"
						style="font-size: 1.3em; border-top: 1px solid #7393b6; cursor: pointer;">
						Q7.Ż��� ��� �ϳ���?
						<div id="panel7" style="font-size: 0.8em;">�Ǹ��Ͻ÷��� �������� Ȩ ȭ��
							��� �����ʿ� [�Ǹ��ϱ�] ��ư�� ���� �� ������ ����, �̹���, �󼼼���, ī�װ�, ���� ���� ���������� �Է��Ͽ�
							����Ͻ� �� �ֽ��ϴ�.</div>
					</td>
					</tr>
					<td id="flip8"
						style="font-size: 1.3em; border-top: 1px solid #7393b6; cursor: pointer;">
						Q8.�Ǹű� ������ ��� �ϳ���?
						<div id="panel8" style="font-size: 0.8em;">�Ǹ��Ͻ÷��� �������� Ȩ ȭ��
							��� �����ʿ� [�Ǹ��ϱ�] ��ư�� ���� �� ������ ����, �̹���, �󼼼���, ī�װ�, ���� ���� ���������� �Է��Ͽ�
							����Ͻ� �� �ֽ��ϴ�.</div>
					</td>
					</tr>
					<td id="flip9"
						style="font-size: 1.3em; border-top: 1px solid #7393b6; cursor: pointer;">
						Q9.Ȩ ȭ�鿡 ���̴� ��ǰ���� �����ΰ���?
						<div id="panel9" style="font-size: 0.8em;">�Ǹ��Ͻ÷��� �������� Ȩ ȭ��
							��� �����ʿ� [�Ǹ��ϱ�] ��ư�� ���� �� ������ ����, �̹���, �󼼼���, ī�װ�, ���� ���� ���������� �Է��Ͽ�
							����Ͻ� �� �ֽ��ϴ�.</div>
					</td>
					</tr>
					<td id="flip10"
						style="font-size: 1.3em; border-top: 1px solid #7393b6; cursor: pointer;">
						Q10.�Ǹ��� ��ǰ�� �н� �Ǵ� �ļյǾ��� ��� ����ϳ���?
						<div id="panel10" style="font-size: 0.8em;">�Ǹ��Ͻ÷��� �������� Ȩ ȭ��
							��� �����ʿ� [�Ǹ��ϱ�] ��ư�� ���� �� ������ ����, �̹���, �󼼼���, ī�װ�, ���� ���� ���������� �Է��Ͽ�
							����Ͻ� �� �ֽ��ϴ�.</div>
					</td>
					</tr>




				</table>

			</td>
		</tr>
	</table>

	<!-- End your code here -->
</body>
</html>