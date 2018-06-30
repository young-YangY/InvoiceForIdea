<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/path.jsp" %>
<%@ include file="../common/tag.jsp"%>
<link href="<%=path%>/resources/css/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/resources/js/Calendar.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	
	function save(){
		var suid=$("#suid").val();
		var name=$("#name").val();
		if(suid=="" || suid==0){
			alert("请选择供应商！");
			return;
		}
		if(name==""){
			alert("请输入商品类别名称！");
			return;
		}
		$("form:first").submit();
	}
	
	function reset(){
		$("#suid").val();
		$("#name").val();
	}
</script>
<div class="content-right">
	<div class="content-r-pic_w">
		<div style="margin:8px auto auto 12px;margin-top:6px">
			<span class="page_title">商品类别管理</span>
		</div>
	</div>
	<div class="content-text">
		<div class="square-order">
			<form action="/invoicing/goodstype/save/${goodstype.gsid!=null?goodstype.gsid:0}" method="post">
  			<div style="border:1px solid #cecece;">
				<table width="100%"  border="0" cellpadding="0" cellspacing="0">
				  <tr bgcolor="#FFFFFF">
				    <td>&nbsp;</td>
				  </tr>
				</table>
				<table width="100%"  border="0" cellpadding="0" cellspacing="0">
				    <tr  bgcolor="#FFFFFF">
				      <td width="18%" height="30" align="center">供应商</td>
				      <td width="82%" colspan="3">
				      		<select class="kuan" value="${goodstype.suid}" id="suid" name="suid" style="width:190px">
								<option value="0">----请-选-择----</option>
								<c:forEach items="${supplierList}" var="supplier">
									<option value="${supplier.suid}">${supplier.name}</option>
								</c:forEach>
							</select>
				      </td>
				    </tr>
				    <tr  bgcolor="#FFFFFF">
				      <td colspan="4">&nbsp;</td>
				    </tr>
				    <tr  bgcolor="#FFFFFF">
				      <td width="18%" height="30" align="center">商品类别名称</td>
				      <td width="82%" colspan="3">
				      	<input name="name" value="${goodstype.name}" id="name" type="text" size="25"/>
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
					    <td><a href="/invoicing/goodstype/list"><img src="<%=path%>/resources/images/order_tuo.gif" border="0" /></a></td>
					  </tr>
					</table>
				</div>
			</div>
			</form>
		</div><!--"square-order"end-->
	</div><!--"content-text"end-->
	<div class="content-bbg"><img src="<%=path%>/resources/images/content_bbg.jpg" /></div>
</div>
