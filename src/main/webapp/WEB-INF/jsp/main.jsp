<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common/path.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=path%>/resources/css/index.css" rel="stylesheet" type="text/css" />
<title>蓝源进销存系统-系统主页</title>
<script type="text/javascript" src="<%=path%>/resources/js/jquery-1.8.3.js"></script>
</head>
<body>
	<div class="container">
		<div class="head">
			<div class="head-left">
				<span style="font-weight:bold; font-size:15px; color:#1f4906">欢迎您-</span><br />
				<span style="font-size:18px;color:#4a940d">${employee.name}</span>
			</div>
			<div class="head-right">
				<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td width="33%">
							<a href="employee/changePwd.jsp" target="main">
								<img width="100%" height="100%" src="<%=path%>/resources/images/head-l.gif"	border="0" />
							</a>
						</td>
						<td width="25%">
							<a href="<%=path%>/resources/index2.jsp">
								<img width="100%" height="100%" src="<%=path%>/resources/images/head-m.gif"	border="0" />
							</a>
						</td>
						<td width="3%">&nbsp;</td>
						<td width="39%"><a href="#"><img width="100%" height="100%" src="<%=path%>/resources/images/head-r.gif"
								border="0" />
						</a>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<!--"head"end-->

		<div class="content">
			<div class="left">
				<div style="margin-left:2px;">
					<img src="<%=path%>/resources/images/left-top.gif" width="100%" height="30" />
				</div>
				<div class="left-bottom">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td><a class="hei" target="main" href="#">商品管理</a></td>
							</tr>
							<tr>
								<td><a class="hei" target="main" href="/invoicing/supplier/list">&nbsp;&nbsp;&nbsp;&nbsp;供应商</a></td>
							</tr>
							<tr>
								<td><a class="hei" target="main" href="/invoicing/goodstype/list">&nbsp;&nbsp;&nbsp;&nbsp;商品类别</a></td>
							</tr>
							<tr>
								<td><a class="hei" target="main" href="/invoicing/goods/list">&nbsp;&nbsp;&nbsp;&nbsp;商品</a></td>
							</tr>
							<tr>
								<td><a class="hei" target="main" href="#">采购管理</a></td>
							</tr>
							<tr>
								<td><a class="hei" target="main" href="order/in/inList.jsp">&nbsp;&nbsp;&nbsp;&nbsp;采购订单</a></td>
							</tr>
							<tr>
								<td><a class="hei" target="main" href="#">&nbsp;&nbsp;&nbsp;&nbsp;采购退货</a></td>
							</tr>
							<tr>
								<td><a class="hei" target="main" href="order/in/inApproveList.jsp">&nbsp;&nbsp;&nbsp;&nbsp;采购审批</a></td>
							</tr>
							<tr>
								<td><a class="hei" target="main" href="#">销售管理</a></td>
							</tr>
							<tr>
								<td><a class="hei" target="main" href="#">&nbsp;&nbsp;&nbsp;&nbsp;销售订单</a></td>
							</tr>
							<tr>
								<td><a class="hei" target="main" href="#">&nbsp;&nbsp;&nbsp;&nbsp;销售退货</a></td>
							</tr>
							<tr>
								<td><a class="hei" target="main" href="#">&nbsp;&nbsp;&nbsp;&nbsp;销售审批</a></td>
							</tr>
							<tr>
								<td><a class="hei" target="main" href="#">商品运输</a></td>
							</tr>
							<tr>
								<td><a class="hei" target="main" href="order/transport/list.jsp">&nbsp;&nbsp;&nbsp;&nbsp;运输任务指派</a></td>
							</tr>
							<tr>
								<td><a class="hei" target="main" href="order/transport/tasks.jsp">&nbsp;&nbsp;&nbsp;&nbsp;运输任务查询</a></td>
							</tr>
							<tr>
								<td><a class="hei" target="main" href="#">仓库管理</a></td>
							</tr>
							<tr>
								<td><a class="hei" target="main" href="store/detail/list.jsp">&nbsp;&nbsp;&nbsp;&nbsp;库存查询</a></td>
							</tr>
							<tr>
								<td><a class="hei" target="main" href="store/in/list.jsp">&nbsp;&nbsp;&nbsp;&nbsp;入库</a></td>
							</tr>
							<tr>
								<td><a class="hei" target="main" href="#">&nbsp;&nbsp;&nbsp;&nbsp;出库</a></td>
							</tr>
							<tr>
								<td><a class="hei" target="main" href="store/oper/list.jsp">&nbsp;&nbsp;&nbsp;&nbsp;仓库操作明细</a></td>
							</tr>
							<tr>
								<td><a class="hei" target="main" href="#">报表中心</a></td>
							</tr>
							<tr>
								<td><a class="hei" target="main" href="bill/in/inGoods.jsp">&nbsp;&nbsp;&nbsp;&nbsp;进货报表</a></td>
							</tr>
							<tr>
								<td><a class="hei" target="main" href="#">&nbsp;&nbsp;&nbsp;&nbsp;销售报表</a></td>
							</tr>
							<tr>
								<td><a class="hei" target="main" href="#">&nbsp;&nbsp;&nbsp;&nbsp;仓库报表</a></td>
							</tr>
							<tr>
								<td><a class="hei" target="main" href="#">基础维护</a></td>
							</tr>
							<tr>
								<td><a class="hei" target="main" href="/invoicing/department/list">&nbsp;&nbsp;&nbsp;&nbsp;部门维护</a></td>
							</tr>
							<tr>
								<td><a class="hei" target="main" href="/invoicing/employee/list">&nbsp;&nbsp;&nbsp;&nbsp;员工维护</a></td>
							</tr>
							<tr>
								<td><a class="hei" target="main" href="role/list.jsp">&nbsp;&nbsp;&nbsp;&nbsp;角色维护</a></td>
							</tr>
							<tr>
								<td><a class="hei" target="main" href="resource/list.jsp">&nbsp;&nbsp;&nbsp;&nbsp;资源维护</a></td>
							</tr>
							<tr>
								<td><a class="hei" target="main" href="menu/list.jsp">&nbsp;&nbsp;&nbsp;&nbsp;菜单维护</a></td>
							</tr>
							<tr>
								<td><a class="hei" target="main" href="store/list.jsp">&nbsp;&nbsp;&nbsp;&nbsp;仓库管理</a></td>
							</tr>
						</table>
				</div>
				<!--"left-bottom"end-->
			</div>
			<!--"left"end-->

			<iframe id="frame-contect" src="/invoicing/context"
				style="width:85%;float:right;height:662px" scrolling="no"
				name="main" frameborder="0">
			</iframe>
			<!--"content-right"end-->
		</div>
		<!--"content"end-->
		<div class="footer">
			<div style="margin-top:5px;">
				<table width="98%" border="0" cellpadding="0" cellspacing="0"
					align="center">
					<tr>
						<td width="82%"><img src="<%=path%>/resources/images/icon_1.gif" />&nbsp; <a
							class="lanyo" href="www.itcast.cn">蓝源信息技术 2014</a></td>
						<td width="18%" valign="middle"><img src="<%=path%>/resources/images/icon_2.gif" />&nbsp;
							<a class="lanyo" href="#">如有疑问请与技术人员联系</a></td>
					</tr>
				</table>
			</div>

		</div>
		<!--"footer"end-->
	</div>
	<!--"container"end-->
	<%-- <%@include file="/jsp/tools/mask.jsp"%> --%>
</body>
</html>
