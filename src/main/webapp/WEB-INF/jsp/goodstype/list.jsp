<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/path.jsp" %>
<%@ include file="../common/tag.jsp"%>
<link href="<%=path%>/resources/css/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/resources/js/Calendar.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	$(function() {
		$("#query").click(function() {
			//$("[name='pageNum']").val(1);
			$("form:first").submit();
		});
	});
	function showMsg(msg,uuid){
		top.$('context-msg').style.display = "block";
		top.$('context-msg-text').innerHTML=msg;
		top.$('hid-action').value="actionName";
		top.lock.show();
	}
	function onDelete(msg,gsid){
		var bool=confirm(msg);
		if(bool){
			var xmlHttp;
			if(window.XMLHttpRequest){
				xmlHttp=new XMLHttpRequest();
			}else{
				xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
			}
			//设置要请求的类型和路径
			xmlHttp.open("GET","/invoicing/goodstype/delete/"+gsid,true);
			xmlHttp.send();
		}
	}
</script>
<div class="content-right">
	<div class="content-r-pic_w">
		<div style="margin:8px auto auto 12px;margin-top:6px">
			<span class="page_title">商品类别管理</span>
		</div>
	</div>
	<div class="content-text">
		<form action="/invoicing/goodstype/query" method="post">
			<div class="square-o-top">
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					style="font-size:14px; font-weight:bold; font-family:"黑体";">
					<tr>
						<td width="68" height="30">&nbsp;</td>
						<td width="123">&nbsp;</td>
						<td width="62">供应商:</td>
						<td width="142">
							<select class="kuan" name="suid">
								<option value="0">----请-选-择----</option>
								<c:forEach items="${supplierList}" var="supplier">
									<option value="${supplier.suid}">${supplier.name}</option>
								</c:forEach>
							</select>
						</td>
						<td width="60">类别名称:</td>
						<td width="149"><input name="name" type="text" size="18" /></td>
						<td width="70"><a id="query"> <img
								src="<%=path%>/resources/images/can_b_01.gif" border="0" /> </a></td>
						<td width="70"><a href="/invoicing/goodstype/input"><img
								src="<%=path%>/resources/images/can_b_02.gif" border="0" /> </a></td>
					</tr>
				</table>
			</div>
			<!--"square-o-top"end-->
			<div class="square-order">
				<table width="100%" border="1" cellpadding="0" cellspacing="0">
					<tr align="center"
						style="background:url(<%=path%>/resources/images/table_bg.gif) repeat-x;">
						<td width="30%" height="30">供应商</td>
						<td width="30%">类别名称</td>
						<td width="40%">操作</td>
					</tr>
					
					<c:forEach var="goodsDto" items="${list}">
						<tr align="center" bgcolor="#FFFFFF">
							<td width="30%" height="30">${goodsDto.supplierName}</td>
							<td>${goodsDto.goodstypeName}</td>
							<td>
								<img src="<%=path%>/resources/images/icon_3.gif" /> 
								<span style="line-height:12px; text-align:center;"> 
									<a href="/invoicing/goodstype/update/${goodsDto.goodstypeId}" class="xiu">修改</a> 
								</span> 
								<img src="<%=path%>/resources/images/icon_04.gif" /> 
								<span style="line-height:12px; text-align:center;"> 
									<a href="javascript:void(0)" class="xiu" onclick="onDelete('是否删除该项数据？',${goodsDto.goodstypeId})">删除</a>
								</span>
							</td>
					</tr>
					</c:forEach>
										
				</table>
			</div>
		</form>
	</div>
	<div class="content-bbg"></div>
</div>
