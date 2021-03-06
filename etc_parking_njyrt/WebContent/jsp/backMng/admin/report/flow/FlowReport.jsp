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
		<form action="report.shtml" method="post" id="pageForm"
			enctype="multipart/form-data">
			<div class="container" style="width: 100%">

				<div class="box mt10">
					<div class="box-header">
						<div class="col-sm-6">流量报表</div>
						<div class="col-sm-12 ">
							<table class="queryTable">
								<tr>
									<td>统计日期类型:</td>
									<td><select name="query_date_type" id="query_date_type">
											<option value="1" selected="selected">自然日</option>
											<option value="2">公班日</option>
									</select></td>
									<!-- 									<td>公班日期</td>
									<td><input type="text" id="query_start_time_from"
										name="query_start_time_from"
										value="${queryParam.query_cancel_time_from}"
										onfocus="WdatePicker()"></td>
									<td>-</td>
									<td><input type="text" id="query_cancel_time_to"
										name="query_cancel_time_to"
										value="${queryParam.query_cancel_time_to}"
										onfocus="WdatePicker()"></td> -->
									<td>日期</td>
									<td><input type="text" id="query_time_from"
										name="query_time_from" value="${queryParam.query_time_from}"
										onfocus="WdatePicker()"></td>
									<td>-</td>
									<td><input type="text" id="query_time_to"
										name="query_time_to" value="${queryParam.query_time_to}"
										onfocus="WdatePicker()"></td>
									<!-- 									<td>停车场编号</td> 
									<td><input type="text" id="query_park_id"
										name="query_in_time_to" value="${queryParam.query_in_time_to}"></td>
									<td>区域编号</td>
									<td><input type="text" id="query_area_id"
										name="query_in_time_to" value="${queryParam.query_in_time_to}"></td>-->
									<!-- 									<td>车道</td> -->
									<!-- 									<td><input type="text" id="query_in_time_from" -->
									<!-- 										name="query_in_time_from" -->
									<%-- 										value="${queryParam.query_in_time_from}"></td> --%>
									<!-- 									<td>车道类型</td> -->
									<!-- 									<td><select name="query_b_list_type" -->
									<!-- 										id="query_b_list_type"> -->
									<!-- 											<option></option> -->
									<!-- 											<option value="1">入口</option> -->
									<!-- 											<option value="2">出口</option> -->
									<!-- 									</select></td> -->
									<td>
										<button class="btn btn-primary" type="submit">检索</button>
									</td>
								</tr>
								<!-- 								<tr> 
									<td>车牌号</td>
									<td><input type="text" id="query_mv_license"
										name="query_mv_license" value="${queryParam.query_mv_license}"
										placeholder="" autocomplete="off"></td>

								</tr>-->
							</table>
						</div>
					</div>
					<input type="file" id="file" name="file" style="display: none;">
					<!-- /.box-header -->
					<div class="box-body">
						<lable>统计单位:(辆)</lable>
						<table id="dataTable"
							class="table table-bordered table-striped table-condensed"
							style="font-size: 12px">
							<thead>
								<tr>
									<th>日期</th>
									<!-- 									<th>停车场</th> -->
									<th>区域</th>
									<th>车道</th>
									<th>车道类型</th>
									<!-- 									<th>小车储值</th> -->
									<!-- 									<th>小车记账</th> -->
									<!-- 									<th>小车会员</th> -->
									<!-- 									<th>大车储值</th> -->
									<!-- 									<th>大车记账</th> -->
									<!-- 									<th>大车会员</th> -->
									<th>ETC支付（小车）</th>
									<th>ETC支付（大车）</th>
									<th>移动支付（小车）</th>
									<th>移动支付（大车）</th>
									<th>现金支付（小车）</th>
									<th>现金支付（大车）</th>
									<th>人工放行（小车）</th>
									<th>人工放行（大车）</th>
									<th>总计</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list }" var="obj" varStatus="status">
									<tr>
										<td>${obj.date}</td>
										<%-- 										<td>${obj.laneId}</td> --%>
										<%-- 										<td>${obj.laneId}</td> --%>
										<%-- 										<td>${obj.parkName}</td> --%>
										<td>${obj.areaName}</td>
										<td>${obj.laneName}</td>
										<td>${obj.laneFlag==1?'入口':'出口'}</td>
										<%-- 										<td>${obj.carStoreValue}</td> --%>
										<%-- 										<td>${obj.carAccount}</td> --%>
										<td>${obj.carETC}</td>
										<td>${obj.cartETC}</td>
										<td>${obj.carMobile}</td>
										<td>${obj.cartMobile}</td>
										<td>${obj.carCash}</td>
										<td>${obj.cartCash}</td>
										<td>${obj.carArtificial}</td>
										<td>${obj.cartArtificial}</td>
										<%-- 										<td>${obj.carMember}</td> --%>
										<%-- 										<td>${obj.cartStoreValue}</td> --%>
										<%-- 										<td>${obj.cartAccount}</td> --%>
										<%-- 										<td>${obj.cartMember}</td> --%>
										<td>${obj.carETC
										+obj.carMobile+obj.carCash+obj.cartETC
										+obj.cartMobile+obj.cartCash+obj.carArtificial+obj.cartArtificial}</td>
									</tr>
								</c:forEach>
								<tr>
									<td>总计</td>
									<!-- 									<td></td> -->
									<td></td>
									<td></td>
									<td></td>
									<%-- 									<td><c:set var="totalCarStoreValue" value="0" /> <c:forEach --%>
									<%-- 											items="${list }" var="obj"> --%>
									<%-- 											<c:set var="totalCarStoreValue" --%>
									<%-- 												value="${totalCarStoreValue + obj.carStoreValue }" /> --%>
									<%-- 										</c:forEach> ${totalCarStoreValue}</td> --%>
									<%-- 									<td><c:set var="totalCarAccount" value="0" /> <c:forEach --%>
									<%-- 											items="${list }" var="obj"> --%>
									<%-- 											<c:set var="totalCarAccount" --%>
									<%-- 												value="${totalCarAccount + obj.carAccount }" /> --%>
									<%-- 										</c:forEach> ${totalCarAccount}</td> --%>
									<td><c:set var="totalCarETC" value="0" /> <c:forEach
											items="${list }" var="obj">
											<c:set var="totalCarETC" value="${totalCarETC + obj.carETC }" />
										</c:forEach> ${totalCarETC}</td>
									<td><c:set var="totalCartETC" value="0" /> <c:forEach
											items="${list }" var="obj">
											<c:set var="totalCartETC"
												value="${totalCartETC + obj.cartETC }" />
										</c:forEach> ${totalCartETC}</td>
									<td><c:set var="totalCarMobile" value="0" /> <c:forEach
											items="${list }" var="obj">
											<c:set var="totalCarMobile"
												value="${totalCarMobile + obj.carMobile }" />
										</c:forEach> ${totalCarMobile}</td>
									<td><c:set var="totalCartMobile" value="0" /> <c:forEach
											items="${list }" var="obj">
											<c:set var="totalCartMobile"
												value="${totalCartMobile + obj.cartMobile }" />
										</c:forEach> ${totalCartMobile}</td>
									<td><c:set var="totalCarCash" value="0" /> <c:forEach
											items="${list }" var="obj">
											<c:set var="totalCarCash"
												value="${totalCarCash + obj.carCash }" />
										</c:forEach> ${totalCarCash}</td>
									<td><c:set var="totalCartCash" value="0" /> <c:forEach
											items="${list }" var="obj">
											<c:set var="totalCartCash"
												value="${totalCartCash + obj.cartCash }" />
										</c:forEach> ${totalCartCash}</td>
									<td><c:set var="totalCarArtificial" value="0" /> <c:forEach
											items="${list }" var="obj">
											<c:set var="totalCarArtificial"
												value="${totalCarArtificial + obj.carArtificial }" />
										</c:forEach> ${totalCarArtificial}</td>
									<td><c:set var="totalCartArtificial" value="0" /> <c:forEach
											items="${list }" var="obj">
											<c:set var="totalCartArtificial"
												value="${totalCartArtificial + obj.cartArtificial }" />
										</c:forEach> ${totalCartArtificial}</td>
									<td><c:set var="total" value="0" /> <c:forEach
											items="${list }" var="obj">
											<c:set var="total"
												value="${total+obj.carETC
										+obj.carMobile+obj.carCash+obj.carArtificial+obj.cartETC
										+obj.cartMobile+obj.cartCash+obj.cartArtificial}" />
										</c:forEach> ${total}</td>
									<%-- 									<td><c:set var="totalCarMember" value="0" /> <c:forEach 
											items="${list }" var="obj">
											<c:set var="totalCarCash"
												value="${totalCarMember + obj.carMember }" />
										</c:forEach> ${totalCarMember}</td>--%>
									<%-- 									<td><c:set var="totalCartStoreValue" value="0" /> <c:forEach --%>
									<%-- 											items="${list }" var="obj"> --%>
									<%-- 											<c:set var="totalCartStoreValue" --%>
									<%-- 												value="${totalCartStoreValue + obj.cartStoreValue }" /> --%>
									<%-- 										</c:forEach> ${totalCartStoreValue}</td> --%>
									<%-- 									<td><c:set var="totalCartAccount" value="0" /> <c:forEach --%>
									<%-- 											items="${list }" var="obj"> --%>
									<%-- 											<c:set var="totalCartAccount" --%>
									<%-- 												value="${totalCartAccount + obj.cartAccount }" /> --%>
									<%-- 										</c:forEach> ${totalCartAccount}</td> --%>
									<%--	<td><c:set var="totalCartMember" value="0" /> <c:forEach
											items="${list }" var="obj">
											<c:set var="totalCartMember"
												value="${totalCartMember + obj.cartMember }" />
 										</c:forEach> ${totalCartMember}</td> --%>
								</tr>
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
					<%@include file="/jsp/common/bootstrap/divPage.jsp"%>
				</div>
				<!-- /.box -->

			</div>
		</form>
		<!-- /.content -->
	</div>
	<%@include file="/jsp/common/bootstrap/footer.jsp"%>

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"></div>

	<script type="text/javascript">
	
		$(function() {
	
			tool.selOption("query_date_type",'${queryParam.date_type}');
	
			$("#file").change(function() {
				$.ajaxFileUpload({
						url : 'upload.shtml',
						secureuri : false,
						fileElementId : 'file',
						dataType : 'json',
						success : function(data, status) {
							if (data.success) {
								$("#file").attr("value", '');
								location.reload();
							} else {
								tool.alert("黑名单类型可能存在非法参数，请核实");
							}
						}
					});
			}
			);
	
		});
		function deleteData(dataId) {
			tool.confirm("确实要删除该条目吗？", function(result) {
				if (result) {
					$.ajax({
						type : 'post',
						url : 'delete.shtml',
						data : {
							"ID" : dataId
						},
						dataType : 'json',
						success : function(msg) {
							if (msg.success) {
								$("#pageForm").attr("action", "list.shtml");
								tool.formSubmit();
							} else {
								tool.alert(msg.message);
							}
						},
						error : function(msg) {
							tool.alert("删除失败！");
						}
					});
				}
			});
		}
		function daoru() {
			$("#file").click();
		}
		function daochu() {
			$("#pageForm").attr("action", "downLoad.shtml");
			tool.formSubmit();
		}
		// 		function test1(){
		// 			$.ajax({
		// 				url:'${contentPath}/valid/test.shtml',
		// 				dataType:'json',
		// 				type:'post',
		// 				success:function(data){
		// 					console.log(data);
		// 				}
	
		// 			});
	
		// 		}
	
		// 		function test2(){
		// 			$.ajax({
		// 				url:'${contentPath}/valid/test2.shtml',
		// 				dataType:'json',
		// 				type:'post',
		// 				success:function(data){
		// 					console.log(data);
		// 				}
	
		// 			});
	
		// 		}
		function search() {
			$("#pageForm").attr("action", "list.shtml");
			tool.formSubmit();
		}
	</script>
</body>
</html>