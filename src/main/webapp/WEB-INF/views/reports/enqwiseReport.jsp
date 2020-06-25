<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js" lang="">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Enquiry wise Report</title>
<meta name="description" content="Sufee Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="apple-icon.png">
<link rel="shortcut icon" href="favicon.ico">

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


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
	href="${pageContext.request.contextPath}/resources/assets/css/lib/chosen/chosen.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/scss/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/lib/chosen/chosen.min.css">


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/lib/datatable/dataTables.bootstrap.min.css">
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>

<style type="text/css">
.right {
	text-align: right;
}

.left {
	text-align: left;
}
</style>
</head>
<body>

	<c:url var="getEnqByDate" value="/getEnqByDate"></c:url>
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
							<strong class="card-title">Search</strong>
						</div>
						<div class="form-group"></div>
						<div class="form-group">

							<div class="col-md-2">From Date</div>
							<div class="col-md-3">

								<input type="text" id="fromDate" name="fromDate" />
							</div>


							<div class="col-md-2">To Date</div>
							<div class="col-md-3">

								<input type="text" id="toDate" name="toDate" />
							</div>

						</div>
						<input type="hidden" id="langSelected" name="langSelected" />

						<div class="form-group"></div>
						<div class="form-group">

							<div class="col-md-2">Select Work Type</div>


							<div class="col-md-3">

								<select id="workTypeId" name="workTypeId" class="standardSelect"
									tabindex="1">

	<option value="0">All</option>
									<c:forEach items="${workList}" var="workList">
									

										<option value="${workList.workTypeId}">${workList.workTypeName}
										</option>


									</c:forEach>
								</select>

							</div>
							<div class="form-group">

								<div class="col-md-2">Select Status</div>

								<div class="col-md-3">

									<select id="status" name="status" class="standardSelect"
										tabindex="1">
	<option value="0">All</option>

										<c:forEach items="${taskList}" var="taskList">

										
											<option value="${taskList.taskId}">${taskList.taskDesc}
											</option>


										</c:forEach>
									</select>
								</div>

							</div>

							<div class="col-md-2">

								<button type="button" class="btn btn-primary"
									onclick="callSearch()"
									style="align-content: center; width: 150px;">Search</button>


							</div>


						</div>
						&nbsp;

						<div class="card">
							<div class="card-header">
								<strong class="card-title">Enquiry Wise Report</strong>
							</div>


							<div class="card-body">
								<table id="bootstrap-data-table1"
									class="table table-striped table-bordered">

									<thead>
										<tr>
											<th>Sr. No</th>
											<th>Date</th>
											<th>Customer Name</th>
											<th>Mobile no</th>
											<th>Work Type Name</th>
											<th>Work Status</th>

										</tr>
									</thead>


								</table>

								<div class="col-md-2"></div>

								<div class="col-md-3">

									<button type="button" class="btn btn-primary"
										onclick="exportToExcel();" disabled="disabled" id="expExcel"
										style="align-content: center; width: 200px; margin-left: 80px;">
										Export To Excel</button>
								</div>


								<div class="col-md-3">

									<button type="button" class="btn btn-primary"
										onclick="genPdf()" disabled="disabled" id="PDFButton"
										style="align-content: center; width: 100px; margin-left: 80px;">
										PDF</button>
								</div>
								&nbsp;


							</div>

						</div>

					</div>

				</div>


			</div>
		</div>


		<!-- .animated -->
	</div>
	<!-- .content -->


	<!-- Footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- Footer -->




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

	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/chosen/chosen.jquery.min.js"></script>

	<script type="text/javascript">
		function callSearch() {

		
			var fromDate = $("#fromDate").val();
			var toDate = $("#toDate").val();
			var workTypeId = $("#workTypeId").val();
			var status = $("#status").val();

			$.getJSON('${getEnqByDate}',

			{
				fromDate : fromDate,
				toDate : toDate,
				workTypeId : workTypeId,
				status : status,

				ajax : 'true'

			}, function(data) {
				document.getElementById("expExcel").disabled = false;
				document.getElementById("PDFButton").disabled = false;
				$('#bootstrap-data-table1 td').remove();
				if (data == "") {
					alert("No records found !!");
					document.getElementById("expExcel").disabled = true;
					document.getElementById("PDFButton").disabled = true;

				}
				/* alert(data[0].orderQty); */

				var dataTable = $('#bootstrap-data-table1').DataTable();
				$.each(data, function(i, v) {
					var status;
					if(v.status==1)
					{
					status="Upload Documnents";
					}
					else if(v.status==2)
					{
					status="Update Work Cost";
					}
					else if(v.status==3)
					{
					status="Update Payment Done";
					}
					else if(v.status==4)
					{
					status="User Allocation";
					}
					else if(v.status==5)
					{
					status="Document In Office";
					}
					else if(v.status==6)
					{
					status="Document Submit top RTO";
					}
					else if(v.status==7)
					{
					status="Handover To Customer";
					}
					else
						{
						status="Work Completed ";
						}
					dataTable.row.add(
							[ i + 1, v.date1, v.custName, v.custMobile,
									v.workTypeName ,status]).draw();
				});

			});
		}
	</script>

	<script>
		jQuery(document).ready(function() {
			jQuery(".standardSelect").chosen({
				disable_search_threshold : 2,
				no_results_text : "Oops, nothing found!",
				width : "100%"
			});
		});
	</script>

	<!-- <script type="text/javascript">
		$(document).ready(function() {
			$('#bootstrap-data-table1').DataTable({
				columnDefs : [ {
					targets : [ 2, 3 ],
					className : "right"
				}, ]
			});
		});
	</script> -->


	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		$(function() {
			$('input[id$=fromDate]').datepicker({
				dateFormat : 'dd-mm-yy'
			});
		});

		$(function() {
			$('input[id$=toDate]').datepicker({
				dateFormat : 'dd-mm-yy'
			});
		});
	</script>

	<script type="text/javascript">
		function exportToExcel() {

			window.open("${pageContext.request.contextPath}/exportToExcel");
			document.getElementById("expExcel").disabled = true;
		}
	</script>

	<script type="text/javascript">
		function genPdf() {
		//	alert("hiii");
			var fromDate = document.getElementById("fromDate").value;
			var toDate = document.getElementById("toDate").value;

			window.open('${pageContext.request.contextPath}/showEnqwisePdf/'
					+ fromDate + '/' + toDate);
			document.getElementById("expExcel").disabled = true;

		}
	</script>
</body>
</html>