<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/path.jsp" %>
<%@ include file="../common/tag.jsp"%>
<link href="<%=path%>/resources/css/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/resources/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	$(function() {
		$("#query").click(function() {
			console.log("query");
			$("form:first").submit();
		});
	});
	function showMsg(msg,deid){
		console.log("showMsg");
		//top.document.getElementById("context-msg").style.display = "block";
		/* top.$('context-msg').style.display = "block";
		top.$('context-msg-text').innerHTML=msg;
		top.$('hid-action').value="actionName";
		top.lock.show(); */
		var bool=confirm(msg);
		if(bool==true){
			var xmlHttp;
			if(window.XMLHttpRequest){
				xmlHttp=new XMLHttpRequest();
			}else{
				xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
			}
			//设置要请求的类型和路径
			xmlHttp.open("GET","/invoicing/department/delete/"+deid,true);
			xmlHttp.send();
		}
	}
</script>
<div class="content-right">
	<div class="content-r-pic_w">
		<div style="margin:8px auto auto 12px;margin-top:6px">
			<span class="page_title">部门管理</span>
		</div>
	</div>
	<div class="content-text">
		<form action="/invoicing/department/query" method="get">
			<div class="square-o-top">
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					style="font-size:14px; font-weight:bold; font-family:"黑体";">
					<tr>
						<td width="68" height="30">&nbsp;&nbsp;&nbsp;</td>
						<td width="123">&nbsp;</td>
						<td width="62">部门名称:</td>
						<td width="142"><input name="departmentName" value="" type="text" size="18" /></td>
						<td width="60">电话:</td>
						<td width="149"><input type="text" value="" name="departmentTelephone" size="18" /></td>
						<td width="70"><a href="javascript:void(0)" id="query"> <img
								src="<%=path%>/resources/images/can_b_01.gif" border="0" /> </a></td>
						<td width="70"><a href="/invoicing/department/input">
							<img src="<%=path%>/resources/images/can_b_02.gif" border="0" /> </a></td>
					</tr>
				</table>
			</div>
			<!--"square-o-top"end-->
			<div class="square-order">
				<center>
					<span style="font-size:20px;color:#96D34A;font-weight:bold">没有查找到满足条件的数据！</span>
				</center>
				<table width="100%" border="1" cellpadding="0" cellspacing="0">
					<tr align="center"
						style="background:url(<%=path%>/resources/images/table_bg.gif) repeat-x;">
						<td width="13%" height="30">编号</td>
						<td width="13%">部门名称</td>
						<td width="16%">电话</td>
						<td width="16%">操作</td>
					</tr>
					<c:forEach items="${list}" var="list">
						<tr align="center" bgcolor="#FFFFFF">
							<td width="13%" height="30">${list.deid}</td>
							<td>${list.name}</td>
							<td>${list.telephone}</td>
							<td>
							<img src="<%=path%>/resources/images/icon_3.gif" /> 
							<span style="line-height:12px; text-align:center;"> 
								<a href="/invoicing/department/update/${list.deid}" class="xiu">修改</a>
							</span> 
							<img src="<%=path%>/resources/images/icon_04.gif" /> 
							<span style="line-height:12px; text-align:center;"> 
								<a href="javascript:void(0)" class="xiu" onclick="showMsg('是否删除该项数据？当前部门删除后，所有部门内的员工将被删除，同时相关数据也将删除！',${list.deid})">删除</a>
							</span>
						</td>
						</tr>
					</c:forEach>
					
				</table>
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td width="51%">&nbsp;</td>
						<td width="13%">共${size}条记录
						<td width="6%">
							<a id="fir" class="sye">首&nbsp;&nbsp;页</a>
						</td>
						<td width="6%">
							<a id="pre" class="sye">上一页</a>
						</td>
						<td width="6%">
							<a id="next" class="sye">下一页</a>
						</td>
						<td width="6%">
							<a id="last" class="sye">末&nbsp;&nbsp;页</a>
						</td>
						<td width="12%">当前第<span style="color:red;">1</span>/1页</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
	<div class="content-bbg"></div>
</div>
