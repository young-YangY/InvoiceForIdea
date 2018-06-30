<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/path.jsp" %>
<%@ include file="../common/tag.jsp"%>
<link href="<%=path%>/resources/css/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/resources/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/Calendar.js"></script>
<script type="text/javascript">
	$(function() {
		$("#all").click(function() {
			$("[name=roles]:checkbox").attr("checked",$("#all").attr("checked")=="checked");
		});
		$("#reverse").click(function() {
			$("[name=roles]:checkbox").each(function () {
                $(this).attr("checked", !$(this).attr("checked"));
            });

		});
	});
	
	function save(){
		var username=$("#username").val();
		var name=$("#name").val();
		var password=$("#password").val();
		var passwordAgain=$("#passwordAgain").val();
		var email=$("#email").val();
		var telephone=$("#telephone").val();
		var gender=$("#gender").val();
		var address=$("#address").val();
		var birthdayStr=$("#birthdayStr").val();
		var depName=$("#depName").val();
		if(username==""){
			alert("用户名不能为空！");
			return;
		}else if(name==""){
			alert("真实姓名不能为空！");
			return;
		}else if(password==""){
			alert("密码不能为空！");
			return;
		}else if(password!=passwordAgain){
			alert("两次密码输入不一致！");
			return;
		}else if(email==""){
			alert("邮箱不能为空！");
			return;
		}else if(telephone==""){
			alert("电话号码不能为空！");
			return;
		}else if(gender==""){
			alert("性别不能为空！");
			return;
		}else if(address==""){
			alert("地址不能为空！");
			return;
		}else if(birthdayStr==""){
			alert("生日不能为空！");
			return;
		}else if(depName==""){
			alert("部门不能为空！");
			return;
		}
		$("#form1").submit();
	}
	
	function reset(){
		$("#username").val("");
		$("#name").val("");
		$("#password").val("");
		$("#passwordAgain").val("");
		$("#email").val("");
		$("#telephone").val("");
		$("#gender").val(-1);
		$("#address").val("");
		$("#birthdayStr").val("");
		$("#depName").val("");
	}
</script>
<div class="content-right">
	<div class="content-r-pic_w">
		<div style="margin:8px auto auto 12px;margin-top:6px">
			<span class="page_title">员工管理</span>
		</div>
	</div>
	<div class="content-text">
		<div class="square-order">
			<form id="form1" action="/invoicing/employee/save/${employee.emid!=null?employee.emid:0}" method="post"> 
  			<div style="border:1px solid #cecece;">
				<table width="100%"  border="0" cellpadding="0" cellspacing="0">
				  <tr bgcolor="#FFFFFF">
				    <td>&nbsp;</td>
				  </tr>
				</table>
				<table width="100%"  border="0" cellpadding="0" cellspacing="0">
				    <tr  bgcolor="#FFFFFF">
				      <td width="18%" height="30" align="center">用&nbsp;户&nbsp;名</td>
				      <td width="32%">
				      	<input name="username" id="username" value="${employee.username}" type="text" size="25"/>
				      </td>
				      <td width="18%" align="center">真实姓名</td>
				      <td width="32%">
				      	<input name="name" id="name" value="${employee.name}" type="text" size="25"/>
					  </td>
				    </tr>
				    <tr bgcolor="#FFFFFF">
					  <td colspan="4">&nbsp;</td>
					</tr>
				    <tr  bgcolor="#FFFFFF">
				      <td align="center">密&nbsp;&nbsp;&nbsp;&nbsp;码</td>
				      <td>
				      	<input name="password" id="password" value="${employee.password}" type="text" size="25"/>
				      </td>
				      <td  align="center">确认密码</td>
				      <td >
				      	<input name="passwordAgain" id="passwordAgain" value="${employee.password}" type="text" size="25"/>
				      </td>
				    </tr>
				     <tr bgcolor="#FFFFFF">
					  <td colspan="4">&nbsp;</td>
					</tr>
				    <tr  bgcolor="#FFFFFF">
				      <td height="30" align="center">电子邮箱</td>
				      <td>
				      	<input name="email" id="email" value="${employee.email}" type="text" size="25"/>
				      </td>
				      <td align="center">电话号码</td>
				      <td>
				      	<input name="telephone" id="telephone" value="${employee.telephone}" type="text" size="25"/>
					  </td>
				     </tr>
				      <tr bgcolor="#FFFFFF">
					  <td colspan="4">&nbsp;</td>
					</tr>
				    <tr  bgcolor="#FFFFFF">
				      <td height="30" align="center">性&nbsp;&nbsp;&nbsp;&nbsp;别</td>
				      <td>
				      	<select name="gender" id="gender" value="${employee.gender}" style="width:190px">
								<option value="-1">----请-选-择----</option>
								<option value="0">男</option>
								<option value="1">女</option>
							</select>
					  </td>
				      <td align="center">地&nbsp;&nbsp;&nbsp;&nbsp;址</td>
				      <td>
				      	<input name="address" id="address" value="${employee.address}" type="text" size="25"/>
					  </td>
				    </tr>
				     <tr bgcolor="#FFFFFF">
					  <td colspan="4">&nbsp;</td>
					</tr>
					
				    <tr  bgcolor="#FFFFFF">
				      <td height="30" align="center">出生日期</td>
				      <td>
				      	<input name="birthdayStr" id="birthdayStr" value="${employee.birthdayStr}" type="text" size="25" onfocus="c.showMoreDay=false;c.show(this);" readonly="true"/>
					  </td>
				      <td align="center">所属部门</td>
				      <td>
				      	<select name="depName" id="depName" value="${employee.depName}" style="width:190px">
							<option value="-1">----请-选-择----</option>
							<option value="1">销售部</option>
							<option value="2">采购部</option>
						</select>
					  </td>
				    </tr>
				    
				    
				    
				    <!-- <tr  bgcolor="#FFFFFF">
				      <td colspan="4">&nbsp;</td>
				    </tr>
				    <tr  bgcolor="#FFFFFF">
				      <td width="18%" height="30" align="center">角色名称</td>
				      <td width="82%" colspan="3">
				      	<input type="checkbox" id="all">全选&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				      	<input type="checkbox" id="reverse">反选
				      </td>
				    </tr>
				    <tr  bgcolor="#FFFFFF">
				      <td width="18%" height="30" align="center">&nbsp;</td>
				      <td width="82%" colspan="3">
				      	<input type="checkbox">经理
				      	<input type="checkbox">主管
				      	<input type="checkbox">员工
				      	<input type="checkbox">经理
				      	<input type="checkbox">主管
				      	<input type="checkbox">员工
				      	<input type="checkbox">经理
				      	<input type="checkbox">主管
				      	<input type="checkbox">员工
				      </td>
				    </tr>
				    -->
				    <tr  bgcolor="#FFFFFF">
				      <td colspan="4">&nbsp;</td>
				    </tr> 
				</table>
			</div>
			<div class="order-botton">
				<div style="margin:1px auto auto 1px;">
					<table width="100%"  border="0" cellpadding="0" cellspacing="0">
					  <tr>
					    <td>
					    	<a href="javascript:void()" onclick="save()"><img src="<%=path%>/resources/images/order_tuo.gif" border="0" /></a>
					    </td>
					    <td>&nbsp;</td>
					    <td><a href="javascript:void()" onclick="reset()"><img src="<%=path%>/resources/images/order_tuo.gif" border="0" /></a></td>
					    <td>&nbsp;</td>
					    <td><a href="/invoicing/employee/list"><img src="<%=path%>/resources/images/order_tuo.gif" border="0" /></a></td>
					  </tr>
					</table>
				</div>
			</div>
			</form>
		</div><!--"square-order"end-->
	</div><!--"content-text"end-->
	<div class="content-bbg"><img src="<%=path%>/resources/images/content_bbg.jpg" /></div>
</div>
