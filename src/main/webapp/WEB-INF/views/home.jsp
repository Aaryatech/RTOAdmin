<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>RTO Admin Pannel</title>
<c:url var="getDashboardCount" value="/getDashboardCount" />


<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath}/resources/apple-icon.png">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/favicon.ico">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/normalize.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/themify-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/flag-icon.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/cs-skin-elastic.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/scss/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/lib/chosen/chosen.min.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/lib/datatable/dataTables.bootstrap.min.css">


</head>

<!-- 
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script> -->


<body onload="setData()" class="bg-overlay">
	<c:url var="getChartData" value="/getGraphDataForDistwiseOrderHistory"></c:url>

	<c:url var="getCatOrdQty" value="/getCatOrdQty"></c:url>

	<c:url var="getCatwiseTrend" value="/getCatwiseTrend"></c:url>



	<!-- Left Panel -->
	<jsp:include page="/WEB-INF/views/common/left.jsp"></jsp:include>
	<!-- Left Panel -->


	<!-- Header-->
	<jsp:include page="/WEB-INF/views/common/right.jsp"></jsp:include>
	<!-- Header-->


	<div class="content mt-3">
		<div class="animated fadeIn">

			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<strong class="card-title">Dashboard</strong>
						</div>
						<div class="card-body">


							<div class="col-xs-12 col-sm-12">





								<div class="form-group"></div>

								<div class="col-xs-12 col-sm-12">




									<div class="col-sm-6 col-lg-4"
										style="cursor: pointer; max-width: 27.333333%;"
										onclick="showEnq(${dashBoard.noTotalHandover})">
										<div class="card text-white bg-flat-color-2"
											style="background:  #FF4500;">
											<div class="card-body pb-0" align="center">

												<h4 class="mb-0">

													<span class="count" style="font-size: 30px;" id="totalEnq">${dashBoard.noTotalHandover}</span>

												</h4>
												<p style="font-size: 15px; font-weight: bold; color: white;">
													<font color="white">Total No of Enquiry</font>
												</p>

											</div>
										</div>

									</div>



									<div class="col-sm-6 col-lg-4"
										style="cursor: pointer; max-width: 27.333333%;"
										onclick="showEnqBetDate(${dashBoard.noDocument})">

										<div class="card text-white bg-flat-color-2"
											style="background:#e74c3c;">
											<div class="card-body pb-0" align="center">

												<h4 class="mb-0">

													<span class="count" style="font-size: 30px;"
														id="totalQuotPending">${dashBoard.noDocument}</span>
												</h4>
												<p style="font-size: 15px; font-weight: bold; color: white;">
													<font color="white">Work Cost Pending</font>
												</p>

											</div>
										</div>
									</div>


									<div class="col-sm-6 col-lg-4"
										style="cursor: pointer; max-width: 27.333333%;"
										onclick="showPayment(${dashBoard.noCost})">

										<div class="card text-white bg-flat-color-2"
											style="background: 		#DC143C;">
											<div class="card-body pb-0" align="center">

												<h4 class="mb-0">

													<span class="count" style="font-size: 30px;"
														id="totalQuotGenerated">${dashBoard.noCost}</span>

												</h4>
												<p style="font-size: 15px; font-weight: bold; color: white;">
													<font color="white">Payment Pending</font>
												</p>

											</div>
										</div>

									</div>

								</div>
								<div class="col-xs-12 col-sm-12">



									<div class="col-sm-6 col-lg-4"
										style="cursor: pointer; max-width: 27.333333%;"
										onclick="showUserAllocation(${dashBoard.noPayment})">

										<div class="card text-white bg-flat-color-2"
											style="background:#e74c3c;">
											<div class="card-body pb-0" align="center">

												<h4 class="mb-0">

													<span class="count" style="font-size: 30px;"
														id="totalQuotGenerated">${dashBoard.noPayment}</span>

												</h4>
												<p style="font-size: 15px; font-weight: bold; color: white;">
													<font color="white">User Allocation Pending</font>
												</p>

											</div>
										</div>

									</div>




									<div class="col-sm-6 col-lg-4"
										style="cursor: pointer; max-width: 27.333333%;"
										onclick="showOfficeDoc(${dashBoard.noAllocate})">

										<div class="card text-white bg-flat-color-3"
											style="background: #DC143C;">
											<div class="card-body pb-0" align="center">

												<h4 class="mb-0">

													<span class="count" style="font-size: 30px;"
														id="poGenerated">${dashBoard.noAllocate}</span>

												</h4>
												<p style="font-size: 15px; font-weight: bold; color: white;">
													<font color="white">Pending Document to Office</font>
												</p>


											</div>
										</div>

									</div>

							
							
									<div class="col-sm-6 col-lg-4"
										style="cursor: pointer; max-width: 27.333333%;"
										onclick="showRTODoc(${dashBoard.noOffice})">

										<div class="card text-white bg-flat-color-3"
											style="background: #FF4500;">
											<div class="card-body pb-0" align="center">

												<h4 class="mb-0">

													<span class="count" style="font-size: 30px;"
														id="totalOrderAmount">${dashBoard.noOffice}</span>

												</h4>
												<p style="font-size: 15px; font-weight: bold; color: white;">
													<font color="white">Pending Document to RTO</font>
												</p>

											</div>
										</div>

									</div>


									</div>
									<div class="col-xs-12 col-sm-12">


									<div class="col-sm-6 col-lg-4"
										style="cursor: pointer; max-width: 27.333333%;"
										onclick="showHandOver(${dashBoard.noRto})">

										<div class="card text-white bg-flat-color-3"
											style="background:#DC143C ;">
											<div class="card-body pb-0" align="center">

												<h4 class="mb-0">

													<span class="count" style="font-size: 30px;"
														id="totalNoOfOrders">${dashBoard.noRto}</span>

												</h4>
												<p style="font-size: 15px; font-weight: bold; color: white;">
													<font color="white">Pending Document Hand Over</font>
												</p>

											</div>
										</div>

									</div>
									<div class="col-sm-6 col-lg-4"
										style="cursor: pointer; max-width: 27.333333%;"
										onclick="showTotalHandOver(${dashBoard.noHandover})">

										<div class="card text-white bg-flat-color-3"
											style="background: #FF4500;">
											<div class="card-body pb-0" align="center">

												<h4 class="mb-0">



													<span class="count" style="font-size: 30px;"
														id="totalNoOfOrders">${dashBoard.noHandover}</span>

												</h4>
												<p style="font-size: 15px; font-weight: bold; color: white;">
													<font color="white">Total Hand Over</font>
												</p>

											</div>
										</div>

									</div>
								</div>

							</div>
						</div>







					</div>
				</div>
			</div>
		</div>
	</div>




<script
		src="${pageContext.request.contextPath}/resources/assets/js/vendor/jquery-2.1.4.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/plugins.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/datatables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/dataTables.buttons.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/buttons.bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/jszip.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/pdfmake.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/vfs_fonts.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/buttons.html5.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/buttons.print.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/buttons.colVis.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/datatables-init.js"></script>



	<!-- 	<script>
		jQuery(document).ready(function() {
			jQuery(".standardSelect").chosen({
				disable_search_threshold : 1,
				no_results_text : "Oops, nothing found!",
				width : "100%"
			});
		});
	</script> 
 -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		$(function() {
			$('input[id$=from_date]').datepicker({
				dateFormat : 'dd-mm-yy'
			});
			
			$('input[id$=to_date]').datepicker({
				dateFormat : 'dd-mm-yy'
			});
			
		});
	</script>


	<script type="text/javascript">
		// onclick of submit to search order 
		function showQuot() {
		
			var plantId = document.getElementById("plantId").value;
			var fromDate = document.getElementById("from_date").value;
			var toDate = document.getElementById("to_date").value;
			var valid = true;
			var plantId = document.getElementById("plantId").value;
			//alert("plantId" + plantId);
			var valid = true;
			if (plantId == null || plantId == "") {
				valid = false;
				alert("Please Select Plant");
				var dataTable = $('#bootstrap-data-table').DataTable();
				dataTable.clear().draw();
			} else if (plantId < 0) {
				valid = false;
			}
			else if (fromDate == null || fromDate == "") {
				valid = false;
				alert("Please select from date");
			}
			else if (toDate == null || toDate == "") {
				valid = false;
				alert("Please select to date");
			}
			if (fromDate > toDate) {
				valid = false;
				alert("from date greater than todate ");
			}
			if (valid == true) {
				$
						.getJSON(
								'${getDashboardCount}',
								{
									plantId : plantId,
									fromDate : fromDate,
									toDate : toDate,
									ajax : 'true',
								},
								function(data) {
									alert("hi");
									document.getElementById("totalEnq").innerText = data.totalEnq;
									document.getElementById("totalQuotPending").innerText = data.totalQuotPending;
									document
											.getElementById("totalQuotGenerated").innerText = data.totalQuotGenerated;
									document.getElementById("totalPoPending").innerText = data.totalPoPending;
									document.getElementById("poGenerated").innerText = data.poGenerated;
									document.getElementById("totalOrderAmount").innerText = data.totalOrderAmount;
									document.getElementById("totalNoOfOrders").innerText = data.totalNoOfOrders;
									document.getElementById("totalBillAmount").innerText = data.totalBillAmount;
									document.getElementById("totalTaxBillAmt").innerText = data.totalTaxBillAmt;
									document
											.getElementById("totalTaxableBillAmt").innerText = data.totalTaxableBillAmt;
									document.getElementById("paymentRecPaid").innerText = data.paymentRecPaid;
									document
											.getElementById("paymentRecOutstandingPending").innerText = data.paymentRecOutstandingPending;
								});
			}//end of if valid ==true
		}
	</script>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
	<script>
	$(function() { $('input[id$=from_date]').datepicker({ dateFormat :
	'dd-mm-yy' }); $('input[id$=to_date]').datepicker({ dateFormat :
	'dd-mm-yy' }); });
	</script>
<script type="text/javascript">
		function showEnq(count) {
		
			if (count > 0) {
				window.open(
						'${pageContext.request.contextPath}/showEnquiryList',"_self");
			}
		}
	</script>
	<script type="text/javascript">
		function showEnqBetDate(count) {
		
			if (count > 0) {
				window.open(
						'${pageContext.request.contextPath}/showWorkList',"_self");
			}
		}
	</script>

	<script type="text/javascript">
		function showPayment(count) {
		
			if (count > 0) {
			window.open(
					'${pageContext.request.contextPath}/showUpdatePayment', "_self");
			}
		}
	</script>

	<script type="text/javascript">
		function showUserAllocation(count) {
			
			if (count > 0) {
			window.open(
					'${pageContext.request.contextPath}/showUserAllocation', "_self");
			}
		}
	</script>



	<script type="text/javascript">
		function showOfficeDoc(count) {
			
			if (count > 0) {
			window.open(
					'${pageContext.request.contextPath}/showDocInOffice', "_self");
			}
		}
	</script>


	<script type="text/javascript">
		function showRTODoc(count) {
			
			if (count > 0) {
			window.open(
					'${pageContext.request.contextPath}/showDocSubmitAtRto', "_self");
			}
		}
	</script>


	<script type="text/javascript">
		function showHandOver(count) {
			
			if (count > 0) {
			window.open(
					'${pageContext.request.contextPath}/showActualDocToCust', "_self");
			}
		}
	</script>

<script type="text/javascript">
		function showTotalHandOver(count) {
			
			if (count > 0) {
			window.open(
					'${pageContext.request.contextPath}/showWorkCompleteList', "_self");
			}
		}
	</script>


	
</body>
</html>