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
		$("#supplier").change(function(){
			$.post("<%=path%>/resources/goodsTypeAction_getAll.action",{"gm.supplier.uuid":$(this).val()},function(data){
				$("#goodsType").empty();
				for(var i = 0;i<data.gtList.length;i++){
					var goodsType = data.gtList[i];
					var $option = $("<option value='"+goodsType.uuid+"'>"+goodsType.goodsTypeName+"</option>");	//创建option对象(jQuery格式)
					$("#goodsType").append($option);				//将option对象添加到select组件中
				}
			});
		});
	});
	
	function reset(){
		$("#supplierId").val("");
		$("#goodstypeId").val("");
		$("#name").val("");
		$("#origin").val("");
		$("#producer").val("");
		$("#unit").val("");
		$("#inPrice").val("");
		$("#outPrice").val("");
	}
	
	function save(){
		var supplierId=$("#supplierId").val();
		var goodstypeId=$("#goodstypeId").val();
		var name=$("#name").val();
		var origin=$("#origin").val();
		var producer=$("#producer").val();
		var unit=$("#unit").val();
		var inPrice=$("#inPrice").val();
		var outPrice=$("#outPrice").val();
		if(supplierId==0 || supplierId=="0"){
			alert("请选择供应商！");
			return;
		}
		if(goodstypeId==0 || goodstypeId=="0"){
			alert("请选择商品类别！");
			return;
		}
		if(name==""){
			alert("请输入商品名称！");
			return;
		}
		if(origin==""){
			alert("请输入产地！");
			return;
		}
		if(producer==""){
			alert("请输入生产厂家！");
			return;
		}
		if(unit==""){
			alert("请输入单位！");
			return;
		}
		if(inPrice==""){
			alert("请输入进货单价！")
			return;
		}
		if(outPrice==""){
			alert("请输入销售单价！")
			return;
		}
		$("form:first").submit();
	}
</script>
<div class="content-right">
	<div class="content-r-pic_w">
		<div style="margin:8px auto auto 12px;margin-top:6px">
			<span class="page_title">商品管理</span>
		</div>
	</div>
	<div class="content-text">
		<div class="square-order">
			<form action="/invoicing/goods/save/${goods.goid!=null?goods.goid:0}" method="post">
  			<div style="border:1px solid #cecece;">
				<table width="100%"  border="0" cellpadding="0" cellspacing="0">
				  <tr bgcolor="#FFFFFF">
				    <td>&nbsp;</td>
				  </tr>
				</table>
				<table width="100%"  border="0" cellpadding="0" cellspacing="0">
				    <tr  bgcolor="#FFFFFF">
				      <td width="18%" height="30" align="center">供&nbsp;应&nbsp;商</td>
				      <td width="32%">
				      		<select style="width:190px" value="${goods.supplierId}" name="supplierId" id="supplierId">
								<option value="0">----请-选-择----</option>
								<c:forEach items="${supplierList}" var="supplier">
									<option value="${supplier.suid}">${supplier.name}</option>
								</c:forEach>
							</select>
				      </td>
				      <td width="18%"align="center">商品类别</td>
				      <td width="32%">
				      		<select style="width:190px" value="${goods.goodstypeId}" name="goodstypeId" id="goodstypeId">
								<option value="0">----请-选-择----</option>
								<c:forEach items="${goodstypeList}" var="goodstype">
									<option value="${goodstype.gsid}">${goodstype.name}</option>
								</c:forEach>
							</select>
					  </td>
				    </tr>
				    <tr bgcolor="#FFFFFF">
					  <td colspan="4">&nbsp;</td>
					</tr>
				    <tr  bgcolor="#FFFFFF">
				      <td align="center">商品名称</td>
				      <td>
				      	<input type="text" value="${goods.name}" name="name" id="name" size="25"/>
				      </td>
				      <td  align="center">产&nbsp;&nbsp;&nbsp;&nbsp;地</td>
				      <td >
				      	<input type="text" value="${goods.origin}" name="origin" id="origin" size="25"/>
				      </td>
				    </tr>
				     <tr bgcolor="#FFFFFF">
					  <td colspan="4">&nbsp;</td>
					</tr>
				    <tr  bgcolor="#FFFFFF">
				      <td height="30" align="center">生产厂家</td>
				      <td>
				      	<input type="text" value="${goods.producer}" name="producer" id="producer" size="25"/>
				      <td align="center">单&nbsp;&nbsp;&nbsp;&nbsp;位</td>
				      <td>
				      	<input type="text" value="${goods.unit}" name="unit" id="unit" size="25"/>
					  </td>
				     </tr>
				    <tr bgcolor="#FFFFFF">
					  <td colspan="4">&nbsp;</td>
					</tr>
				    <tr  bgcolor="#FFFFFF">
				      <td height="30" align="center">进货单价</td>
				      <td>
				      	<input type="text" value="${goods.inPrice}" name="inPrice" id="inPrice" size="25"/>
					  </td>
				      <td align="center">销售单价</td>
				      <td>
				      	<input type="text" value="${goods.outPrice}" name="outPrice" id="outPrice" size="25"/>
					  </td>
				    </tr>
				    <tr bgcolor="#FFFFFF">
					  <td colspan="4">&nbsp;</td>
					</tr>
				    <!-- <tr  bgcolor="#FFFFFF">
				      <td height="30" align="center">体&nbsp;&nbsp;&nbsp;&nbsp;积</td>
				      <td>
				      	<input type="text" size="25"/>
					  </td>
				      <td align="center">&nbsp;</td>
				      <td>&nbsp;</td>
				    </tr> -->
				     <tr bgcolor="#FFFFFF">
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
					    <td><a href="/invoicing/goods/list"><img src="<%=path%>/resources/images/order_tuo.gif" border="0" /></a></td>
					  </tr>
					</table>
				</div>
			</div>
			</form>
		</div><!--"square-order"end-->
	</div><!--"content-text"end-->
	<div class="content-bbg"><img src="<%=path%>/resources/images/content_bbg.jpg" /></div>
</div>
