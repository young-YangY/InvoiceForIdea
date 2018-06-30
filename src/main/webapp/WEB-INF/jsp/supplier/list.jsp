<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/path.jsp" %>
<%@ include file="../common/tag.jsp"%>
<link href="<%=path%>/resources/css/index.css" rel="stylesheet" type="text/css" />
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
	};
	function onDelete(msg,suid){
		var bool=confirm(msg);
		if(bool){
			var xmlHttp;
			if(window.XMLHttpRequest){
				xmlHttp=new XMLHttpRequest();
			}else{
				xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
			}
			//设置要请求的类型和路径
			xmlHttp.open("GET","/invoicing/supplier/delete/"+suid,true);
			xmlHttp.send();
		}
	}
</script>
<div class="content-right">
	<div class="content-r-pic_w">
		<div style="margin:8px auto auto 12px;margin-top:6px">
			<span class="page_title">供应商管理</span>
		</div>
	</div>
	<div class="content-text">
		<form action="/invoicing/supplier/query" method="post">
			<div class="square-o-top">
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					style="font-size:14px; font-weight:bold; font-family:"黑体";">
					<tr>
						<td width="28%" height="30">&nbsp;</td>
						<td width="8%">供应商:</td>
						<td width="17%"><input name="name" type="text" size="18" /></td>
						<td width="8%">联系人:</td>
						<td width="17%"><input name="contact" type="text" size="18" /></td>
						<td width="12%">
							<a id="query"><img src="<%=path%>/resources/images/can_b_01.gif" border="0" /> </a></td>
					</tr>
					<tr>
						<td height="30">&nbsp;</td>
						<td>电话:</td>
						<td><input name="telephone" type="text" size="18" /></td>
						<td>提货方式：</td>
						<td>
							<select name="needs" class="kuan">
								<option value="0">----请-选-择----</option>
								<option value="1">自提</option>
								<option value="2">送货</option>
							</select>
						</td>
						<td>
							<a href="/invoicing/supplier/input"><img	src="<%=path%>/resources/images/can_b_02.gif" border="0" /> </a></td>
					</tr>
				</table>
			</div>
			<!--"square-o-top"end-->
			<div class="square-order">
				<table width="100%" border="1" cellpadding="0" cellspacing="0">
					<tr align="center"
						style="background:url(<%=path%>/resources/images/table_bg.gif) repeat-x;">
						<td width="20%" height="30">供应商</td>
						<td width="20%">地址</td>
						<td width="20%">联系人</td>
						<td width="12%">电话</td>
						<td width="12%">送货方式</td>
						<td width="16%">操作</td>
					</tr>
					
					<c:forEach items="${list}" var="supplier">
						<tr align="center" bgcolor="#FFFFFF">
							<td width="13%" height="30">${supplier.name}</td>
							<td>${supplier.address}</td>
							<td>${supplier.contact}</td>
							<td>${supplier.telephone}</td>
							<td>${supplier.needs}</td>
							<td>
								<img src="<%=path%>/resources/images/icon_3.gif" /> 
								<span style="line-height:12px; text-align:center;"> 
									<a href="/invoicing/supplier/update/${supplier.suid}" class="xiu">修改</a>
								</span> 
								<img src="<%=path%>/resources/images/icon_04.gif" /> 
								<span style="line-height:12px; text-align:center;"> 
									<a href="javascript:void(0)" class="xiu" onclick="onDelete('是否删除该项数据？',${supplier.suid})">删除</a>
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
