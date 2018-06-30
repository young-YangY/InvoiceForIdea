<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/path.jsp" %>
<%@ include file="../common/tag.jsp"%>
<link href="<%=path%>/resources/css/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/resources/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	function save(){
		var name=$("#name").val();
		var address=$("#address").val();
		var contact=$("#contact").val();
		var telephone=$("#telephone").val();
		var needs=$("#needs").val();
		if(name==null || name==""){
			alert("请输入供应商名称！");
			return;
		}else if(address==null || address==""){
			alert("请输入供应商地址！");
			return;
		}else if(contact==null || contact ==""){
			alert("请输入联系人！");
			return;
		}else if(telephone==null || telephone==""){
			alert("请输入电话！");
			return;
		}else if(needs==null || needs==""){
			alert("请选择送货方式！");
			return;
		}else{
			javascript:document.forms[0].submit();
		}
	}
	
	function reset(){
		$("#name").val("");
		$("#address").val("");
		$("#contact").val("");
		$("#telephone").val("");
		$("#needs").val("");
	}
</script>
<div class="content-right">
	<div class="content-r-pic_w">
		<div style="margin:8px auto auto 12px;margin-top:6px">
			<span class="page_title">供应商管理</span>
		</div>
	</div>
	<div class="content-text">
		<div class="square-order">
			<form action="/invoicing/supplier/save/${suid!=null?suid:0}" method="post">
  			<div style="border:1px solid #cecece;">
				<table width="100%"  border="0" cellpadding="0" cellspacing="0">
				  <tr bgcolor="#FFFFFF">
				    <td>&nbsp;</td>
				  </tr>
				</table>
				<table width="100%"  border="0" cellpadding="0" cellspacing="0">
				    <tr  bgcolor="#FFFFFF">
				      <td width="18%" height="30" align="center">供应商名称</td>
				      <td width="82%" colspan="3">
				      	<input id="name" name="name" value="${supplier.name}" type="text" size="82"/>
				      </td>
				    </tr>
				    <tr  bgcolor="#FFFFFF">
				      <td colspan="4">&nbsp;</td>
				    </tr>
				    <tr  bgcolor="#FFFFFF">
				      <td width="18%" height="30" align="center">供应商地址</td>
				      <td width="82%" colspan="3">
				      	<input id="address" name="address" value="${supplier.address}" type="text" size="82"/>
				      </td>
				    </tr>
				    <tr  bgcolor="#FFFFFF">
				      <td colspan="4">&nbsp;</td>
				    </tr>
				    <tr  bgcolor="#FFFFFF">
				      <td width="18%" height="30" align="center">联系人</td>
				      <td width="32%">
				      	<input id="contact" name="contact" value="${supplier.contact}" type="text" size="25"/>
				      </td>
				      <td width="18%" align="center">电话</td>
				      <td width="32%">
				      	<input id="telephone" name="telephone" value="${supplier.telephone}" type="text" size="25"/>
				      </td>
				    </tr>
				    <tr  bgcolor="#FFFFFF">
				      <td colspan="4">&nbsp;</td>
				    </tr>
				    <tr  bgcolor="#FFFFFF">
				      <td width="18%" height="30" align="center">送货方式</td>
				      <td width="32%">
				      		<select id="needs" name="needs" value="${supplier.needs}" style="width:190px">
								<option value="0">----请-选-择----</option>
								<option value="1">自提</option>
								<option value="2">送货</option>
							</select>
				      </td>
				      <td width="18%" align="center">&nbsp;</td>
				      <td width="32%">
				      	&nbsp;
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
					    	<a href="javascript:void()" onclick="save()"><img src="<%=path%>/resources/images/order_tuo.gif" border="0" /></a>
					    </td>
					    <td>&nbsp;</td>
					    <td><a href="javascript:void()" onclick="reset()"><img src="<%=path%>/resources/images/order_tuo.gif" border="0" /></a></td>
					    <td>&nbsp;</td>
					    <td><a href="/invoicing/supplier/list"><img src="<%=path%>/resources/images/order_tuo.gif" border="0" /></a></td>
					  </tr>
					</table>
				</div>
			</div>
			</form>
		</div><!--"square-order"end-->
	</div><!--"content-text"end-->
	<div class="content-bbg"><img src="<%=path%>/resources/images/content_bbg.jpg" /></div>
</div>
