<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="common/path.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=path%>/resources/css/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/resources/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/login.js"></script>

<title>蓝源进销存-系统登录页</title>
</head>
<body>
	<div class="container-login">
		<div class="login-pic">
			<div class="login-text">
				<form action="/invoicing/main" method="post" name="login_form">
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td width="28%" height="28">用户名：</td>
							<td colspan="2">
								<input id="username" name="username" value="yuyang" type="text" size="18" />
							</td>
						</tr>
						<tr>
							<td height="31">密&nbsp;&nbsp;码：</td>
							<td colspan="2">
								<input id="password" name="password" value="123456" type="password" size="18" />
							</td>
						</tr>
						<tr>
							<td height="30">验证码：</td>
							<td width="40%">
								<input id="verification" name="verification" value="8952" type="text" size="9" />
							</td>
							<td width="32%"><img src="<%=path%>/resources/images/test.gif" />
							</td>
						</tr>
						<tr>
							<td height="30">&nbsp;</td>
							<td colspan="2">
								<a href="javascript:void(0)" id="login_ok" onclick="loginSuccess()">
									<img src="<%=path%>/resources/images/denglu_bg_03.gif" 
										 name="Image1" width="40"	
										 height="22" border="0"  
										 onmouseover="MM_swapImage(this,'<%=path%>/resources/images/denglu_h_03.gif')" 
										 onmouseout="MM_swapImage(this,'<%=path%>/resources/images/denglu_bg_03.gif')" /></a>
								<a href="javascript">
									<img src="<%=path%>/resources/images/giveup_bg_03.gif" 
										 name="Image2" width="42" 
										 height="22" border="0"  
										 onmouseover="MM_swapImage(this,'<%=path%>/resources/images/giveup_h_03.gif')" 
										 onmouseout="MM_swapImage(this,'<%=path%>/resources/images/giveup_bg_03.gif')" /></a>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
