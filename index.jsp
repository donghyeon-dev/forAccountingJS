<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
input{
text-align:right;}
#tlc{
	width: 100px;
	border : none;
}
#ex{
border : none;}
#gmf,#profit,#subTotal,#vat,#total{
border : none;}

</style>
</head>
<body>
<div>
<form>
	<table>
		<tr>
			<td width="280px" style="font-weight:bold">
				총인건비(Total labor costs)
			</td>
			<td >
				<input style="width:30px" type="number" id="tMans" >인 X 
				<input style="width:30px" type="number" id="tDays"  >일 X 
				<input style="width:50px" type="number" id="tCost" >원=> 
				<input style="width:80px" style="border:none" readonly  value="0"  id="tlc"  >원 
				<script>
					function getTlc(){
						var tm = document.getElementById('tMans').value;
						console.log(tm);
						var td = document.getElementById('tDays').value;
						console.log(td);
						var tc = document.getElementById('tCost').value;
						console.log(tc);
						var tlc =  eval((tm*td*tc));
						document.getElementById('tlc').value = tlc;
					}
				</script>
				<input type="button" value="총인건비 ?" onclick="getTlc()">
				
			</td>
		</tr>
		<tr>
			<td style="font-weight:bold">
				경비(expans)
			</td>
			<td >
				<input style="width:30px" type="number"  id="eMans"  >인 X 
				<input style="width:30px" type="number" id="eTime"  >회 X 
				<input style="width:50px" type="number"  id="eCost"  >원=> 
				<input style="width:80px" style="border:none" 	readonly value="0"	id="ex"   >원 
				<script>
					function getEx(){
						var em = document.getElementById('eMans').value;
						console.log(em);
						var et = document.getElementById('eTime').value;
						console.log(et);
						var ec = document.getElementById('eCost').value;
						console.log(ec);
						var ex =  eval((em*et*ec));
						document.getElementById('ex').value = ex;
					}
				</script>
				<input type="button" value="총 경비 ?" onclick="getEx()">
			</td>
		
		</tr>
		<tr>
			<td>
				일반관리비(General Maintenance Fee)
			</td>
			<td >
				(총인건비 + 경비) *
				<input style="width:30px" type="number"  id="gRate" >
				
				%
				=
				<input style="width:80px" id="gmf" readonly style="border:none">원
				<script>
					function getGmf(){
						var tlc = parseInt(document.getElementById('tlc').value);
						var ex = parseInt(document.getElementById('ex').value);
						var gr = parseInt(document.getElementById('gRate').value);
						var gmf = ((tlc+ex)*(gr/100)).toFixed(1);
						console.log("getGmf.gmf = " + gmf);
						document.getElementById('gmf').value = gmf
					}
				</script>
			</td>
		</tr>
		<tr>
			<td>
				이윤(profit)
			</td>
			<td >
				(총인건비 + 경비 + 일반관리비) * 
				<input style="width:30px" type="number"  id="pRate" >
				% =  <input style="width:80px" id="profit" readonly style="border:none"> 원
				<script>
					function getPro(){
						var tlc = parseInt(document.getElementById('tlc').value);
						var ex = parseInt(document.getElementById('ex').value);
						var gmf = parseInt(document.getElementById('gmf').value);
						var pr = parseInt(document.getElementById('pRate').value);
						var pro = ((tlc+ex+gmf)* (pr/100)).toFixed(1);
						document.getElementById('profit').value = pro;
					}
				</script>
			</td>
		</tr>
		<tr>
			<td>
				소계(subtotal)
			</td>
			<td >
				(총인건비 + 경비+일반관리비+이윤) = <input style="width:80px" id="subTotal" readonly style="border:none">원
				<script>
					function getSt(){
						var tlc = parseInt(document.getElementById('tlc').value);
						var ex = parseInt(document.getElementById('ex').value);
						var gmf = parseInt(document.getElementById('gmf').value);
						var pro = parseInt(document.getElementById('profit').value);
						var st = tlc+ex+gmf+pro;
						document.getElementById('subTotal').value = st;
					}
				</script>
			</td>
		</tr>
		<tr>
			<td>
				부가가치세
			</td>
			<td >
				(소계) * 
				<input style="width:30px" type="number"  id="vRate">
				% = <input style="width:80px" id ="vat" readonly style="border:none">원
				<script>
					function getVat(){
						var st = parseInt(document.getElementById('subTotal').value);
						var vr = parseInt(document.getElementById('vRate').value);
						vat = (st * (vr/100)).toFixed(1);
						document.getElementById('vat').value = vat;
					}
				</script>
			</td>
		</tr>
		<tr>
			<td>
				총 합계
			</td>
			<td >
				(소계+부가가치세)= <input style="width:80px" id ="total" readonly style="border:none">원
				<script>
					function getTotal(){
					var st = parseInt(document.getElementById('subTotal').value);
					var vat = parseInt(document.getElementById('vat').value);
					var total = (st+vat);
					document.getElementById('total').value = total;
					}
					
					function calc(){
						var tlc = parseInt(document.getElementById('tlc').value);
						console.log("go.tlc = " + tlc);
						if(!tlc){
							getTlc();
						}
						
						var ex = parseInt(document.getElementById('ex').value);
						console.log("go.ex = " + ex)
						if(!ex){
							getEx();
						}
						getGmf();
						getPro();
						getSt();
						getVat();
						getTotal();
						
						
					}
				</script>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="계산 해보기" onclick = "calc()">
				<input type="reset" value="리셋">
			</td>
		</tr>
		<tr>
			<td>
			개인 용역비 값 찾기 프로그램 돌리기
			</td>
		</tr>
		<tr>
			<td width="100px">
			예상 용역 금액&nbsp;&nbsp;</td><td><input style="width:60px" type="number" id="allCost"></td>
		</tr>
		<tr>	
			<td>예상 출장 비용 &nbsp;&nbsp;</td> <td><input style="width:60px" type="number"id="cost"></td>
		</tr>
		<tr>
			<td>개인 용역비 시작 값 &nbsp;&nbsp;</td> <td><input style="width:60px" type="number"id="exPay"></td>
		</tr>
		<tr>
			<td>개인 용역비 증가 값 &nbsp;&nbsp;</td> <td><input style="width:30px" type="number"id="exPayPlus"></td>
		</tr>
		<tr>
			<td>일반 관리비 비율  &nbsp;&nbsp;</td> <td><input style="width:20px" type="number"id="gmfRate">%</td>
		</tr>
		<tr>
			<td>이윤 비율 &nbsp;&nbsp;</td> <td><input style="width:20px" type="number"id="proRate">%</td>
		</tr>
		<tr>
			<td>부가가치세 비율 &nbsp;&nbsp;</td> <td><input style="width:20px" type="number"id="vatRate">%</td>
		</tr>
		<tr>
			<td>예상 인원 &nbsp;&nbsp;</td> <td><input style="width:20px" type="number" id="mans"><br></td>
		</tr>
		<tr>
			<td>예상 소요일 &nbsp;&nbsp;</td> <td><input style="width:20px" type="number" id="days"><br></td>
		</tr>
		<tr>
			<td>예상 출장 횟수 &nbsp;&nbsp;</td> <td><input style="width:20px" type="number"id="times"></td>
		</tr>
		<tr>
			<td style="text-weight:bole">개인 용역비 근사값 &nbsp;&nbsp;</td> <td><input style="width:60px" type="number"id="realPay"></td>
		</tr>
		
		<script>
		function getExPay(){
		var mh = true;
		var exPay = parseInt(document.getElementById('exPay').value);
		var exPayPlus = parseInt(document.getElementById('exPayPlus').value);
		var allCost = parseInt(document.getElementById('allCost').value);
		var cost = parseInt(document.getElementById('cost').value);
		var times = parseInt(document.getElementById('times').value);
		var mans = parseInt(document.getElementById('mans').value);
		var days = parseInt(document.getElementById('days').value);
		var times = parseInt(document.getElementById('times').value);
		var gmfRate = parseInt(document.getElementById('gmfRate').value);
		var proRate = parseInt(document.getElementById('proRate').value);
		var vatRate = parseInt(document.getElementById('vatRate').value);
		var realPay = parseInt(document.getElementById('realPay').value);
		while(mh){
			var tlc = exPay * mans * days;
			console.log("tlc : "+tlc);
			var ex = mans * times * cost;
			console.log("ex : "+ex);
			var gmf = (tlc + ex) * (gmfRate/100);
			console.log("gmf : "+gmf);
			var pro = (tlc + ex +gmf) * (proRate/100);
			console.log("pro : "+pro);
			var vat = (tlc+ex+gmf+pro) * (vatRate/100);
			console.log("vat : "+vat);
			var all = tlc+ex+gmf+pro+vat;
			console.log("all : "+all);
			if(all >= allCost)
				{
				console.log("all : "+all);
				document.getElementById('realPay').value = exPay;
				console.log(realPay.value);
				mh = false;
				}
			else{
				exPay += exPayPlus;
				console.log(exPay);
			}
		}
		}
		</script>
		<tr>
			<td>
				<input type="button" value="프로그램 실행" onclick="getExPay()">
			</td>
		</tr>	
		
	
	</table>
	</form>
</div>
</body>
</html>
