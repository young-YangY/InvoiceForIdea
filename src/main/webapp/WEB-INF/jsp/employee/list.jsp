<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/path.jsp" %>
<%@ include file="../common/tag.jsp"%>
<link href="<%=path%>/resources/css/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/resources/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/Calendar.js"></script>
<script type="text/javascript">
	$(function() {
		$("#query").click(function() {
			//$("[name='pageNum']").val(1);
			$("#form1").submit();
		});
	});
	
	function onDelete(msg,emid){
		var flag=confirm(msg);
		if(flag==true){
			var xmlHttp;
			if(window.XMLHttpRequest){
				xmlHttp=new XMLHttpRequest();
			}else{
				xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
			}
			//设置要请求的类型和路径
			xmlHttp.open("GET","/invoicing/employee/delete/"+emid,true);
			xmlHttp.send();
		}
	}
	/* function showMsg(msg,uuid){
		//top.document.getElementById("context-msg").style.display = "block";
		top.$('context-msg').style.display = "block";
		top.$('context-msg-text').innerHTML=msg;
		top.$('hid-action').value="actionName";
		top.lock.show();
	} */
</script>
<div class="content-right">
	<div class="content-r-pic_w">
		<div style="margin:8px auto auto 12px;margin-top:6px">
			<span class="page_title">员工管理</span>
		</div>
	</div>
	<div class="content-text">
		<form action="/invoicing/employee/query" id="form1" method="post">
			<div class="square-o-top" style="margin:8px 182.5px 20px 182.5px;">
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					style="font-size:14px; font-weight:bold; font-family:"黑体";">
					<tr>
						<td height="30">用&nbsp;户&nbsp;名</td>
						<td><input name="username" type="text" size="14" /></td>
						<td>姓&nbsp;&nbsp;名</td>
						<td><input name="name" type="text" size="14" /></td>
						<td>电&nbsp;&nbsp;&nbsp;&nbsp;话</td>
						<td><input name="telephone" type="text" size="14" /></td>
						<td>性&nbsp;&nbsp;&nbsp;&nbsp;别</td>
						<td>
							<select name="gender" class="kuan">
								<option value="-1">----请-选-择----</option>
								<option value="0">男</option>
								<option value="1">女</option>
							</select>
						</td>
							
						<td width="70"><a href="/invoicing/employee/input"> <img src="<%=path%>/resources/images/can_b_02.gif" border="0" /> </a></td>
					</tr>
					<tr>
						<td  height="30">电子邮件</td>
						<td><input name="email" type="text" size="14" /></td>
						<td>登录时间</td>
						<td>
							<input name="lastLoginTimeStr" type="text"  size="14" onfocus="c.showMoreDay=false;c.show(this);" readonly="true"/>
						</td>
						<td>地&nbsp;&nbsp;址</td>
						<td>
							<input name="address" type="text" size="14" onfocus="c.showMoreDay=false;c.show(this);" readonly="true"/>
						</td>
						<td>部门名称</td>
						<td>
							<select name="depName" class="kuan">
								<option value="0">----请-选-择----</option>
								<option value="1">销售部</option>
								<option value="2">采购部</option>
							</select>
						</td>
						<td><a id="query"> <img src="<%=path%>/resources/images/can_b_01.gif" border="0" /> </a></td>
					</tr>
				</table>
			</div>
			<!--"square-o-top"end-->
			<div class="square-order">
				<table width="100%" border="1" cellpadding="0" cellspacing="0">
					<tr align="center"
						style="background:url(<%=path%>/resources/images/table_bg.gif) repeat-x;">
						<td width="8%" height="30">用户名</td>
						<td width="8%">姓名</td>
						<td width="5%">性别</td>
						<td width="14%">出生日期</td>
						<td width="12%">电话</td>
						<td width="14%">电子邮件</td>
						<td width="9%">所属部门</td>
						<td width="14%">最后登录时间</td>
						<td width="16%">操作</td>
					</tr>
					<c:forEach var="employee" items="${list}">
						<tr align="center" bgcolor="#FFFFFF">
							<td width="8%" height="30">${employee.username}</td>
							<td>${employee.name}</td>
							<td>${employee.gender}</td>
							<td>${employee.birthdayStr}</td>
							<td>${employee.telephone}</td>
							<td>${employee.email}</td>
							<td>${employee.depName}</td>
							<td>${employee.lastLoginTimeStr}</td>
							<td>
								<img src="<%=path%>/resources/images/icon_3.gif" /> 
								<span style="line-height:12px; text-align:center;"> 
									<a href="/invoicing/employee/update/${employee.emid}" class="xiu">修改</a>
								</span> 
								<img src="<%=path%>/resources/images/icon_04.gif" /> 
								<span style="line-height:12px; text-align:center;"> 
									<a href="javascript:void(0)" class="xiu" onclick="onDelete('是否删除该项数据？',${employee.emid})">删除</a>
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
