<!DOCTYPE html >
<%@page import="com.redoak.jar.util.PropertiesUtil"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/jsp/common/bootstrap/taglib.jsp"%>
<%@include file="/jsp/common/bootstrap/commonJsCss.jsp"%>
<%@include file="/jsp/common/bootstrap/header.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet"
	href="${contentPath }/css/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css"> -->
<!-- Ionicons -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css"> -->
<!-- DataTables -->
<!-- <link rel="stylesheet" -->
<!-- 	href="../../plugins/datatables/dataTables.bootstrap.css"> -->
<!-- Theme style -->
<link rel="stylesheet"
	href="${contentPath }/css/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<!-- <link rel="stylesheet" href="../../dist/css/skins/_all-skins.min.css"> -->
<title><%=PropertiesUtil.get("PROJECT_NAME")%></title>
<script type="text/javascript"
	src="${contentPath }/js/common/ajaxfileupload.js"></script>

</head>
<body class="hold-transition skin-blue sidebar-mini">

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrap">
		<!-- 		<section class="content-header"> -->
		<h3>停车场基本信息&emsp;&emsp;<input id="back_main" class="btn btn-info" type="button"
				value="主页 "></input></h3>
<!-- 		<div class="weui-btn-area" style="float:right"> -->
			
<!-- 		</div> -->
		<!-- 		</section> -->
		<!-- Main content -->
		<section class="content">
			<!-- Small boxes (Stat box) -->
			<div class="row">
				<div class="col-lg-3 col-xs-3">
					<!-- small box -->
					<div class="small-box bg-aqua">
						<div class="inner">
							<h4>
								今日收入：<font size="8"><fmt:formatNumber
										value="${today_info.income/100}" type="currency" pattern="0" /></font>元
							</h4>
							<h4>今日入口流量：${today_info.entry_flow}次</h4>
							<h4>今日出口流量：${today_info.exit_flow}次</h4>
						</div>
						<div class="icon">
							<i class="ion"></i>
						</div>
					</div>
				</div>
				<!-- ./col -->
				<div class="col-lg-3 col-xs-6">
					<!-- small box -->
					<div class="small-box bg-green">
						<div class="inner">
							<h4>
								昨日收入：<font size="8"><fmt:formatNumber
										value="${yesterday_info.income/100}" type="currency"
										pattern="0" /></font>元
							</h4>
							<h4>昨日入口流量：${yesterday_info.entry_flow}次</h4>
							<h4>昨日出口流量：${yesterday_info.exit_flow}次</h4>
						</div>
						<div class="icon">
							<i class="ion "></i>
						</div>
					</div>
				</div>
			</div>

			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h3>
					运营明细 <small>流量收入明细表</small>
				</h3>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-xs-22">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title" style='float:left;'>明细报表</h3>
								<div style='float:right;'>
									<label style='float:left;'> 自然日</label> <input
										style='float:left;' type="radio" name="type" value="1"
										checked="checked"></input> <label style='float:left;'>公班日</label>
									<input style='float:left;' type="radio" name="type" value="2">&nbsp;&nbsp;&nbsp;&nbsp;</input>
									<button type="button" onclick="findRunDetail(this.value)"
										value="1">小时</button>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<button type="button" onclick="findRunDetail(this.value)"
										value="2">每日</button>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<button type="button" onclick="findRunDetail(this.value)"
										value="3">月份</button>
									<!-- 			  &nbsp;&nbsp;&nbsp;&nbsp;<button>年份</button> -->
								</div>
								<!-- /.box-header -->
								<div class="box-body">
									<table id="example" class=" table-hover" border="2"
										width="100%" height="250">
										<thead>
											<tr>
												<th colspan="1">日期</th>
												<th colspan="4">入口流量</th>
												<th colspan="6">出口流量</th>
												<th colspan="2">车辆统计</th>
												<th colspan="6">收费情况</th>
											</tr>
											<tr align="center">
												<td id='date_name'>自然日</td>
												<td>车牌</td>
												<td>ETC</td>
												<td>人工</td>
												<td>总流量</td>
												<td>现金</td>
												<td>ETC</td>
												<td>微信</td>
												<td>支付宝</td>
												<td>人工</td>
												<td>总流量</td>
												<td>免费车</td>
												<td>特殊车</td>
												<td>现金</td>
												<td>ETC</td>
												<td>微信</td>
												<td>支付宝</td>
												<td>人工</td>
												<td>总收入</td>
											</tr>
										</thead>
										<tbody id="detail_info" align="center">
											<c:if test="${queryParam.type==1}">
												<c:set var="date_pettern" value="yyyy-MM-dd" />
											</c:if>
											<c:if test="${queryParam.type==2}">
												<c:set var="date_pettern" value="yyyy-MM-dd" />
											</c:if>

											<c:forEach items="${detail }" var="obj" varStatus="status">
												<tr>
													<td><fmt:formatDate value="${obj.date}"
															pattern="${date_pettern}" /></td>
													<td>${obj.entry_flow_license}次</td>
													<td>${obj.entry_flow_etc}次</td>
													<td> ${obj.entry_flow_operator}次</td>
													<td>${obj.entry_flow_total}次</td>
													<td>${obj.exit_flow_cash}次</td>
													<td>${obj.exit_flow_etc}次</td>
													<td>${obj.exit_flow_wechat}次</td>
													<td>${obj.exit_flow_alipay}次</td>
													<td>${obj.exit_flow_operator}次</td>
													<td>${obj.exit_flow_total}次</td>
													<td>${obj.count_flow_free}次</td>
													<td>${obj.count_flow_special}次</td>
													<td>${obj.charge_info_cash/100}元</td>
													<td>${obj.charge_info_etc/100}元</td>
													<td>${obj.charge_info_wechat/100}元</td>
													<td>${obj.charge_info_alipay/100}元</td>
													<td>${obj.charge_info_operator/100}元</td>
													<td>${obj.charge_info_total/100}元</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<!--
								 /.box-body -->
							</div>
							<!-- /.box -->


						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
			</section>


			<script type="text/javascript">
				$(function() {
					$("#back_main").click(function() {
						var pathName = window.document.location.pathname;
						window.location.href = '/etc_parking/main.shtml';
					});
			
			
				})
			
			
			
			
				function findRunDetail(value) {
					var type = $("input[name='type']:checked").val();
					$.ajax({
						type : 'post',
						url : 'search_run_detail.shtml',
						data : {
							"type" : type,
							"cycle" : value
						},
						dataType : 'json',
						success : function(data) {
							$("#detail_info").empty();
							if (type == 1) {
								$("#date_name").text('自然日');
							}
							if (type == 2) {
								$("#date_name").text('公班日');
							}
			
							for (var i = 0; i < data.length; i++) {
								var obj = data[i];
								createDetailTd(obj, value);
							}
							return;
						}
					});
				}
			
				function createDetailTd(obj, cycle) {
					var date_time = '';
					if (cycle == 1) {
						var date_time = formatDateTime(new Date(obj.date.time));
					}
					if (cycle == 2) {
						var date_time = formatDate(new Date(obj.date.time));
					}
					if (cycle == 3) {
						var date_time = formatDateMouth(new Date(obj.date.time));
					}
					var recognition = 100;
					if ((obj.entry_flow_total + obj.exit_flow_total) != 0) {
						recognition = (obj.entry_flow_total + obj.exit_flow_total) == 0 ? 1 : (((obj.entry_flow_total + obj.exit_flow_total - obj.special_license_recognition) / (obj.entry_flow_total + obj.exit_flow_total)).toFixed(2) * 100);
					}
			
					var td = '<tr>'
						+ '<td>' + date_time + '</td>'
						+ '<td>' + obj.entry_flow_license + '次</td>'
						+ '<td>' + obj.entry_flow_etc + '次</td>'
						+ '<td>' + obj.entry_flow_operator + '次</td>'
						+ '<td>' + obj.entry_flow_total + '次</td>'
						+ '<td>' + obj.exit_flow_cash + '次</td>'
						+ '<td>' + obj.exit_flow_etc + '次</td>'
						+ '<td>' + obj.exit_flow_wechat + '次</td>'
						+ '<td>' + obj.exit_flow_alipay + '次</td>'
						+ '<td>' + obj.exit_flow_operator + '次</td>'
						+ '<td>' + obj.exit_flow_total + '次</td>'
						+ '<td>' + obj.count_flow_free + '次</td>'
						+ '<td>' + obj.count_flow_special + '次</td>'
						+ '<td>' + obj.charge_info_cash / 100 + '元</td>'
						+ '<td>' + obj.charge_info_etc / 100 + '元</td>'
						+ '<td>' + obj.charge_info_wechat / 100 + '元</td>'
						+ '<td>' + obj.charge_info_alipay / 100 + '元</td>'
						+ '<td>' + obj.charge_info_operator / 100 + '元</td>'
						+ '<td>' + obj.charge_info_total / 100 + '元</td>'
						+ '</tr>'
					var $td = $(td);
					// 					$td.data("note", note);
					$("#detail_info").append($td);
				}
			
			
				function formatDateMouth(date) {
					var y = date.getFullYear();
					var m = date.getMonth() + 1;
					m = m < 10 ? '0' + m : m;
					return y + '-' + m;
				}
			
				function formatDate(date) {
					var y = date.getFullYear();
					var m = date.getMonth() + 1;
					m = m < 10 ? '0' + m : m;
					var d = date.getDate();
					d = d < 10 ? ('0' + d) : d;
					return y + '-' + m + '-' + d;
				}
			
				function formatDateTime(date) {
					var y = date.getFullYear();
					var m = date.getMonth() + 1;
					m = m < 10 ? ('0' + m) : m;
					var d = date.getDate();
					d = d < 10 ? ('0' + d) : d;
					var h = date.getHours();
					h = h < 10 ? ('0' + h) : h;
					var minute = date.getMinutes();
					minute = minute < 10 ? ('0' + minute) : minute;
					return y + '-' + m + '-' + d + ' ' + h + ':' + minute;
				}
			</script>
</body>
</html>