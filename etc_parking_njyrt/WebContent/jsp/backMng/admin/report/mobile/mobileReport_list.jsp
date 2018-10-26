<!DOCTYPE html >
<%@page import="com.redoak.jar.util.PropertiesUtil"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/jsp/common/bootstrap/taglib.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><%=PropertiesUtil.get("PROJECT_NAME")%></title>
<%@include file="/jsp/common/bootstrap/commonJsCss.jsp"%>
<script type="text/javascript"
	src="${contentPath }/js/common/ajaxfileupload.js"></script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<%@include file="/jsp/common/bootstrap/header.jsp"%>
	<%@include file="/jsp/common/bootstrap/leftSide.jsp"%>

	<div id="mainContentDiv" style="margin-left: 180px">

		<!-- Main content -->
		<form action="list.shtml" method="post" id="pageForm"
			enctype="multipart/form-data">
			<div class="container" style="width: 100%">

				<div class="box mt10">
					<div class="box-header">
						<div class="col-sm-6">移动支付报表</div>
					<div class="col-sm-6"></div>
					<div class="col-sm-12 ">
							<table class="queryTable">
								<tr>
									<td>支付方式</td>
									<td>
									<td><select id="query_pay_method" name="query_pay_method"
										style="WIDTH: 100%">
<!-- 											<option value="">所有</option> -->
											<option value="3">微信</option>
											<option value="4">支付宝</option>
									</select></td>
									<td>收费点</td>
									<td>
									<td><select id="query_lane_id" name="query_lane_id"
										style="WIDTH: 100%">
											<option value="">所有</option>
											<option value="1199">预支付</option>
											<c:forEach items="${QUERY_LANE_LIST }" var="obj">
												<option value="${obj.lane_id }">${obj.lane_name }</option>
											</c:forEach>
									</select></td>
									<td>收费员</td>
									<td><select id="query_operator" name="query_operator"
										style="WIDTH: 100%">
											<option value="">所有</option>
											<c:forEach items="${QUERY_USER_LIST }" var="obj">
												<option value="${obj.login_name }">${obj.name }</option>
											</c:forEach>
									</select></td>
									<td>开始日期</td>
									<td><input type="text" id="query_statistics_date_from"
										name="query_statistics_date_from"
										value="${queryParam.query_statistics_date_from }"
										placeholder="" autocomplete="off"
										onfocus="WdatePicker({ dateFmt: 'yyyy-MM-dd' })"
										style="width:90%"></td>
									<td>结束日期</td>
									<td><input type="text" id="query_statistics_date_to"
										name="query_statistics_date_to"
										value="${queryParam.query_statistics_date_to }" placeholder=""
										autocomplete="off"
										onfocus="WdatePicker({ dateFmt: 'yyyy-MM-dd' })"
										style="width:90%"></td>

									<td>
										<button class="btn btn-primary" type="button"
											onclick="search()">查询</button>
										<button class="btn btn-primary" type="button"
											onclick="exprort()">导出</button>
									</td>
								</tr>
							</table>
						</div>
					</div>
					<input type="file" id="file" name="file" style="display: none;">
					<!-- /.box-header -->
					<div class="box-body">
						<table id="dataTable"
							class="table table-bordered table-striped table-condensed"
							style="font-size: 12px">
							<thead>
								<tr>
									<th rowspan="2">停车场</th>
									<th rowspan="2">区域</th>
									<th rowspan="2">收费点</th>
									<th rowspan="2">日期</th>
									<th rowspan="2">收费员</th>
									<th rowspan="2">工班</th>
									<th rowspan="2">支付方式</th>
									<th rowspan="2">总流量（单位：元）</th>
									<th rowspan="2">总金额（单位：元）</th>
									<th colspan="2">全额收款</th>
									<th colspan="3">优惠收款</th>
									<th colspan="2">退款</th>
								</tr>
								<tr>
									<th>笔数</th>
									<th>金额</th>
									<th>笔数</th>
									<th>实收金额</th>
									<th>应收金额</th>
									<th>笔数</th>
									<th>金额</th>
								</tr>
							</thead>
							<tbody >
							<input type="hidden" id="park_id"
										name="park_id" />
									<input type="hidden" id="area_id"
										name="area_id"  />
									<input type="hidden" id="lane_id"
										name="lane_id"  />
									<input type="hidden" id="lane_name"
										name="lane_name" />
									<input type="hidden" id="pay_method"
										name="pay_method" />
									<input type="hidden" id="operator"
										name="operator" />
									<input type="hidden" id="operator_name"
										name="operator_name" />
									<input type="hidden" id="date"
										name="date" />
									<input type="hidden" id="flow_type"
										name="flow_type" />
								<c:forEach items="${list }" var="obj" varStatus="status">
									<tr align="center">
										<td>${obj.park_name}</td>
										<td>${obj.area_name}</td>
										<td>
										<c:if test="${obj.lane_id == 1199}">
											移动预支付
										</c:if>
										<c:if test="${obj.lane_id != 1199}">
											${obj.lane_name}
										</c:if>
										</td>
										<td>
										${fn:substring(obj.statistics_date,0,4)}-${fn:substring(obj.statistics_date,4,6)}-${fn:substring(obj.statistics_date,6,8)}
										</td>
										<td>${obj.operator_name}</td>
										<td>${obj.shift}</td>
										<td>
										<c:if test="${obj.mpay_type==3}">微信</c:if>
										<c:if test="${obj.mpay_type==4}">支付宝</c:if>
										</td>
										<td>
										<c:if test="${obj.mpay_type==3}">
										<a href="javascript:detailList(${obj.flow_wx_total},'${obj.park_id}','${obj.area_id}','${obj.lane_id}','${obj.lane_name}','${obj.operator}','${obj.operator_name}','${obj.statistics_date}','${obj.shift}','${obj.mpay_type}','0')">
											${obj.flow_wx_total}
										</a>
										</c:if>
										<a href="javascript:detailList(${obj.flow_zfb_total},'${obj.park_id}','${obj.area_id}','${obj.lane_id}','${obj.lane_name}','${obj.operator}','${obj.operator_name}','${obj.statistics_date}','${obj.shift}','${obj.mpay_type}','0')">
										<c:if test="${obj.mpay_type==4}">
											${obj.flow_zfb_total}
										</c:if>
										</a>
										</td>
										
										<td>
										<c:if test="${obj.mpay_type==3}">
											<fmt:formatNumber type="number" value="${obj.toll_wx_total/100}" pattern="#0.00"/>
										</c:if>
										<c:if test="${obj.mpay_type==4}">
											<fmt:formatNumber type="number" value="${obj.toll_zfb_total/100}" pattern="#0.00"/>
										</c:if>
										</td>
										
										<td>
										<c:if test="${obj.mpay_type==3}">
										<a href="javascript:detailList(${obj.flow_wx_full},'${obj.park_id}','${obj.area_id}','${obj.lane_id}','${obj.lane_name}','${obj.operator}','${obj.operator_name}','${obj.statistics_date}','${obj.shift}','${obj.mpay_type}','1')">
											${obj.flow_wx_full}
										</a>
										</c:if>
										<c:if test="${obj.mpay_type==4}">
										<a href="javascript:detailList(${obj.flow_zfb_full},'${obj.park_id}','${obj.area_id}','${obj.lane_id}','${obj.lane_name}','${obj.operator}','${obj.operator_name}','${obj.statistics_date}','${obj.shift}','${obj.mpay_type}','1')">
											${obj.flow_zfb_full}
										</a>
										</c:if>
										</td>
										
										<td>
										<c:if test="${obj.mpay_type==3}">
											<fmt:formatNumber type="number" value="${obj.toll_wx_full/100}" pattern="#0.00"/>
										</c:if>
										<c:if test="${obj.mpay_type==4}">
											<fmt:formatNumber type="number" value="${obj.toll_zfb_full/100}" pattern="#0.00"/>
										</c:if>
										</td>
										
										<td>
										<c:if test="${obj.mpay_type==3}">
										<a href="javascript:detailList(${obj.flow_wx_coupon},'${obj.park_id}','${obj.area_id}','${obj.lane_id}','${obj.lane_name}','${obj.operator}','${obj.operator_name}','${obj.statistics_date}','${obj.shift}','${obj.mpay_type}','2')">
											${obj.flow_wx_coupon}
										</a>
										</c:if>
										<c:if test="${obj.mpay_type==4}">
										<a href="javascript:detailList(${obj.flow_zfb_coupon},'${obj.park_id}','${obj.area_id}','${obj.lane_id}','${obj.lane_name}','${obj.operator}','${obj.operator_name}','${obj.statistics_date}','${obj.shift}','${obj.mpay_type}','2')">
											${obj.flow_zfb_coupon}
										</a>
										</c:if>
										</td>
										
										<td>
										<c:if test="${obj.mpay_type==3}">
											<fmt:formatNumber type="number" value="${obj.toll_wx_coupon_ea/100}" pattern="#0.00"/>
										</c:if>
										<c:if test="${obj.mpay_type==4}">
											<fmt:formatNumber type="number" value="${obj.toll_zfb_coupon_ea/100}" pattern="#0.00"/>
										</c:if>
										</td>
										
										<td>
										<c:if test="${obj.mpay_type==3}">
											<fmt:formatNumber type="number" value="${obj.toll_wx_coupon_eb/100}" pattern="#0.00"/>
										</c:if>
										<c:if test="${obj.mpay_type==4}">
											<fmt:formatNumber type="number" value="${obj.toll_zfb_coupon_eb/100}" pattern="#0.00"/>
										</c:if>
										</td>
										
										<td>
										<c:if test="${obj.mpay_type==3}">
										<a href="javascript:detailList(${obj.flow_wx_refund},'${obj.park_id}','${obj.area_id}','${obj.lane_id}','${obj.lane_name}','${obj.operator}','${obj.operator_name}','${obj.statistics_date}','${obj.shift}','${obj.mpay_type}','3')">
											${obj.flow_wx_refund}
										</a>
										</c:if>
										<c:if test="${obj.mpay_type==4}">
										<a href="javascript:detailList(${obj.flow_zfb_refund},'${obj.park_id}','${obj.area_id}','${obj.lane_id}','${obj.lane_name}','${obj.operator}','${obj.operator_name}','${obj.statistics_date}','${obj.shift}','${obj.mpay_type}','3')">
											${obj.flow_zfb_refund}
										</a>
										</c:if>
										</td>
										
										<td>
										<c:if test="${obj.mpay_type==3}">
											<fmt:formatNumber type="number" value="${obj.toll_wx_refund/100}" pattern="#0.00"/>
										</c:if>
										<c:if test="${obj.mpay_type==4}">
											<fmt:formatNumber type="number" value="${obj.toll_zfb_refund/100}" pattern="#0.00"/>
										</c:if>
										</td>
									</tr>
								</c:forEach>
							</tbody>
							<!-- 
						<tfoot>
							<tr>
								<th></th>
							</tr>
						</tfoot>
						 -->
						</table>

					</div>
					<!-- /.box-body -->
					<div class="col-sm-5">
			<div class="dataTables_info" role="status" aria-live="polite">
				${page.pageCount==0?0:page.currentPage }/${page.pageCount}页 &nbsp;&nbsp;&nbsp;共${page.recordCount }条记录</div>
		</div>
		<div class="col-sm-7">
			<div class="dataTables_paginate paging_simple_numbers"
				id="example2_paginate">
				<ul class="pagination">
					<li class="paginate_button previous" id="example2_previous">
						<a href="javascript:divPage(1);" aria-controls="example2" data-dt-idx="0" tabindex="0">首页</a>
					</li>
					<li class="paginate_button">
						<a href="javascript:divPage(2);" aria-controls="example2" data-dt-idx="1" tabindex="0">上一页</a>
					</li>
					<li class="paginate_button ">
						<a href="javascript:divPage(3);" aria-controls="example2" data-dt-idx="2" tabindex="0">下一页</a>
					</li>
					<li class="paginate_button next" id="example2_next">
						<a href="javascript:divPage(4);" aria-controls="example2" data-dt-idx="7" tabindex="0">尾页</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
		<input type="hidden" id="currentPage" name="page.currentPage" value="${page.currentPage}">
	<input type="hidden" id="pageCount" name="page.pageCount" value="${page.pageCount}">
	<input type="hidden" id="pageSize" name="page.pageSize" value="${page.pageSize }">
				</div>
				<!-- /.box -->
		</form>
		<!-- /.content -->
	</div>
	<%@include file="/jsp/common/bootstrap/footer.jsp"%>

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"></div>

	<script type="text/javascript">
	
$(function(){
	tool.selOption("query_lane_id", '${queryParam.query_lane_id}');
	tool.selOption("query_operator", '${queryParam.query_operator}');
	tool.selOption("query_pay_method", '${queryParam.query_pay_method}');
// 	$("#query_pay_method").val(4);
	});
	
	
	function search(){
			$("#pageForm").attr("action","list.shtml");
			tool.formSubmit();
	}
	
	
	function exprort(){
		 bootbox.dialog({  
		 		size: "small",
                message: "是否导出明细数据?",  
                buttons: {  
                    Cancel: {  
                        label: "否",  
                        className: "btn-default",  
                        callback: function () {  
                        	$("#pageForm").attr("action","downLoad.shtml");
							tool.formSubmit();
                        }  
                    }  
                    , OK: {  
                        label: "是",  
                        className: "btn-primary",  
                        callback: function () {  
//                             $("#pageForm").attr("action","downLoad.shtml");
// 							tool.formSubmit();
// 							alert(12345);
							$("#pageForm").attr("action","downLoadAll.shtml");
							tool.formSubmit();
                        }  
                    }  
                }  
            });  
		
// 		$("#pageForm").attr("action","downLoad.shtml");
// 		tool.formSubmit();
	}
	
	// 查詢明細
// 	function detail(park_id,area_id,lane_id,operator,statistics_date,mpay_type)
// 	{
		
// 		alert($(obj).attr("mpay_type"));
// 		$("#pageForm").attr("action","detailList.shtml");
// 		tool.formSubmit();
// 	}

	
	function detailList(flow,park_id,area_id,lane_id,lane_name,operator,operator_name,statistics_date,shift,pay_method,flow_type)
	{
		if(flow == 0)
		{	
			tool.alert("无车辆记录！");
			return;
		}
		$("#park_id").val(park_id);
		$("#area_id").val(area_id);
		$("#lane_id").val(lane_id);
		$("#lane_name").val(lane_name);
		$("#operator").val(operator);
		$("#operator_name").val(operator_name);
		$("#date").val(statistics_date);
		$("#shift").val(shift);
		$("#pay_method").val(pay_method);
		$("#flow_type").val(flow_type);
		$("#currentPage").val("");
		$("#pageCount").val("");
		$("#pageSize").val("");
		$("#pageForm").attr("action","detailList.shtml");
		tool.formSubmit();
	}
	
		function divPage(type){
	        var to_page;
	        if(type==1){
	        	to_page = 1;
	        }else if(type==2){
	        	to_page = parseInt(document.getElementById('currentPage').value) - 1; 
	        }else if(type==3){
	        	to_page = parseInt(document.getElementById('currentPage').value) + 1;
	        }else if(type==4){
	        	to_page = parseInt(document.getElementById('pageCount').value);
	        }else if(type==5){
	        	if(document.getElementById('selPage').value.length==0){
	        		return ;
	        	}
	        	to_page = parseInt(document.getElementById('selPage').value);
	        }
	        if(to_page < 1){
	        	to_page = 1;
	        }
	        if(to_page > parseInt(document.getElementById('pageCount').value)){
	        	to_page = parseInt(document.getElementById('pageCount').value);
	        }
	        $("#pageForm").attr("action","list.shtml");
	        document.getElementById('currentPage').value = to_page;
	        document.getElementById('pageForm').submit();
	    }
	    //只允许输入的值是否为0--9，左向方向键及删除键
		function checkCharIsNumber(){
			if(event.keyCode==13){//回车键
				divPage(5);
				return false;
			}else if((event.keyCode<=57&&event.keyCode>=48)||(event.keyCode<=105&&event.keyCode>=96)||
				(event.keyCode==8||event.keyCode==37||event.keyCode==39)){
				return true;
			}else{
				return false;
			}
		}
		
	
	
	</script>
</body>
</html>