<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/path.jsp" %>
<%@ include file="../common/tag.jsp"%>
<link href="<%=path%>/resources/css/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/resources/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/Calendar.js"></script>
<script type="text/javascript">
	$(function() {
		$("#query").click(function() {
			//$("[name='pageNum']").val(1);
			$("form:first").submit();
		});
	});
	function showMsg(msg,uuid){
		//top.document.getElementById("context-msg").style.display = "block";
		top.$('context-msg').style.display = "block";
		top.$('context-msg-text').innerHTML=msg;
		top.$('hid-action').value="actionName";
		top.lock.show();
	}
	
	function onDelete(msg,goid){
		var bool=confirm(msg);
		if(bool){
			var xmlhttp=new XMLHttpRequest();
			xmlhttp.open("GET","/invoicing/goods/delete/"+goid,true);
			xmlhttp.send();
		}
	}
</script>
<div class="content-right">
	<div class="content-r-pic_w">
		<div style="margin:8px auto auto 12px;margin-top:6px">
			<span class="page_title">商品管理</span>
		</div>
	</div>
	<div class="content-text">
		<form action="/invoicing/goods/query" method="post"> 
			<div class="square-o-top" style="margin:8px 182.5px 20px 182.5px;">
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					style="font-size:14px; font-weight:bold; font-family:"黑体";">
					<tr>
						<td>供应商:</td>
						<td>
							<select class="kuan" name="supplierId">
								<option value="0">----请-选-择----</option>
								<c:forEach items="${supplierList}" var="supplier">
									<option value="${supplier.suid}">${supplier.name}</option>
								</c:forEach>
							</select>
						</td>
						<td height="30">商&nbsp;品&nbsp;名</td>
						<td><input type="text" name="goodsName" size="14" /></td>
						<td>生产厂家</td>
						<td><input type="text" name="goodsProducer" size="14" /></td>
						<td>单&nbsp;&nbsp;&nbsp;&nbsp;位</td>
						<td><input type="text" name="goodsUnit" size="14" /></td>
						<td width="70"><a href="/invoicing/goods/input"><img src="<%=path%>/resources/images/can_b_02.gif" border="0" /> </a></td>
					</tr>
					<tr>
						<td height="30">进货价格</td>
						<td><input type="text" name="minInPrice" size="14" /></td>
						<td>到</td>
						<td><input type="text" name="maxInPrice" size="14" /></td>
						<td height="30">销售价格</td>
						<td><input type="text" name="minOutPrice" size="14" /></td>
						<td>到</td>
						<td><input type="text" name="maxOutPrice" size="14" /></td>
						<td><a id="query"> <img src="<%=path%>/resources/images/can_b_01.gif" border="0" /> </a></td>
					</tr>
				</table>
			</div>
			<!--"square-o-top"end-->
			<div class="square-order">
				<table width="100%" border="1" cellpadding="0" cellspacing="0">
					<tr align="center"
						style="background:url(<%=path%>/resources/images/table_bg.gif) repeat-x;">
						<td width="12%" height="30">供应商</td>
						<td width="12%">商品名</td>
						<td width="12%">生产厂家</td>
						<td width="12%">产地</td>
						<td width="12%">进货价格</td>
						<td width="12%">销售价格</td>
						<td width="12%">单位</td>
						<td width="16%">操作</td>
					</tr>
					<c:forEach items="${goodsDtoList}" var="goodsDto">
						<tr align="center" bgcolor="#FFFFFF">
							<td width="13%" height="30">${goodsDto.supplierName}</td>
							<td>${goodsDto.goodsName}</td>
							<td>${goodsDto.goodsProducer}</td>
							<td>${goodsDto.goodsOrigin}</td>
							<td align="right">${goodsDto.goodsInPrice}&nbsp;元&nbsp;</td>
							<td align="right">${goodsDto.goodsOutPrice}&nbsp;元&nbsp;</td>
							<td>${goodsDto.goodsUnit}</td>
							<td>
								<img src="<%=path%>/resources/images/icon_3.gif" /> 
								<span style="line-height:12px; text-align:center;"> 
									<a href="/invoicing/goods/update/${goodsDto.goodsId}" class="xiu">修改</a> 
								</span> 
								<img src="<%=path%>/resources/images/icon_04.gif" /> 
								<span style="line-height:12px; text-align:center;"> 
									<a href="javascript:void(0)" class="xiu" onclick="onDelete('是否删除该项数据？',${goodsDto.goodsId})">删除</a>
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
