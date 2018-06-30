<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/path.jsp" %>
<link href="<%=path%>/resources/css/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/resources/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	function save(){
		$("form:first").submit();
	}
	
	function reset(){
		console.log("reset");
		document.getElementById("departmentName").value="";
		document.getElementById("departmentTelephone").value="";		
	}
</script>
	<div class="content-right">
	<div class="content-r-pic_w">
		<div style="margin:8px auto auto 12px;margin-top:6px">
			<span class="page_title">部门管理</span>
		</div>
	</div>
	<div class="content-text">
		<div class="square-order">
			<form action="/invoicing/department/new/${department.deid!=null?department.deid:0}" method="get">
  			<div style="border:1px solid #cecece;">
				<table width="100%"  border="0" cellpadding="0" cellspacing="0">
				  <tr bgcolor="#FFFFFF">
				    <td>&nbsp;</td>
				  </tr>
				</table>
				<table width="100%"  border="0" cellpadding="0" cellspacing="0">
				    <tr  bgcolor="#FFFFFF">
				      <td width="18%" height="30" align="center">部门名称</td>
				      <td width="32%">
				      	<input type="text" id="departmentName" name="departmentName" value="${department.name}" size="25"/>
				      </td>
				      <td width="18%" align="center">电话</td>
				      <td width="32%">
				      	<input type="text" id="departmentTelephone" value="${department.telephone}" name="departmentTelephone" size="25"/>
				      </td>
				    </tr>
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
					    	<a href="javascript:void(0)" id="commit" onclick="save()"><img src="<%=path%>/resources/images/order_tuo.gif" border="0" /></a>
					    </td>
					    <td>&nbsp;</td>
					    <td><a href="javascript:void(0)" onclick="reset()"><img src="<%=path%>/resources/images/order_tuo.gif" border="0" /></a></td>
					    <td>&nbsp;</td>
					    <td><a href="/invoicing/department/list"><img src="<%=path%>/resources/images/order_tuo.gif" border="0" /></a></td>
					  </tr>
					</table>
				</div>
			</div>
			</form>
		</div><!--"square-order"end-->
	</div><!--"content-text"end-->
	<div class="content-bbg"><img src="<%=path%>/resources/images/content_bbg.jpg" /></div>
</div>
