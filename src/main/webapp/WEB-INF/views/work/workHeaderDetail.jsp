<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js" lang="">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Work Detail</title>
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




</head>
<body>
	<c:url var="getOrderByDate" value="/getOrderByDate"></c:url>

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
							<strong class="card-title">Work Detail</strong>
						</div>
						<div class="card-body card-block">

							<form
								action="${pageContext.request.contextPath}/updateStatusAndCostHeaderDetail"
								method="post">
								<div class="form-group"></div>


								<div class="form-group"></div>
								<div class="form-group">

									<div class="col-lg-4">

										<div>
											<div class="input-group" style="align-items: center;">
												Cust Name &nbsp; <input class="form-control"
													name="prevPendingCrateBal" id="prevPendingCrateBal"
													value="${getWork.custName}" type="text" disabled /> <span
													class="error" aria-live="polite"></span>
											</div>
										</div>
									</div>

									<div class="col-lg-4">

										<div>
											<div class="input-group" style="align-items: center;">
												Cust Contact No &nbsp; <input class="form-control"
													name="cratesIssued" id="cratesIssued" type="text"
													value="${getWork.custMobile}" disabled /> <span
													class="error" aria-live="polite"></span>
											</div>
										</div>
									</div>
									<div class="col-lg-4">

										<div>



											<div class="input-group" style="align-items: center;">
												Vehicle No &nbsp; <input class="form-control"
													name="orderTotal" value="${getWork.vehicalNo}"
													id="orderTotal" type="text" disabled /> <span
													class="error" aria-live="polite"></span>
											</div>
										</div>
									</div>


								</div>
								&nbsp;

								<div class="form-group">

									<div class="col-lg-12">

										<div>
											<div class="input-group" style="align-items: center;">
												Work Type Name &nbsp; <input class="form-control"
													id="workCost${workList.workId}"
													name="workCost${workList.workId}"
													value="${getWork.workTypeName}" type="text" disabled /> <span
													class="error" aria-live="polite"></span>
											</div>
										</div>
									</div>




								</div>
								&nbsp;


								<div class="form-group">
									<div class="col-lg-4">

										<div>
											<div class="input-group" style="align-items: center;">
												Work Cost &nbsp; <input class="form-control"
													value="${getWork.workCost}" id="workCost" name="workCost"
													type="text" /> <span class="error" aria-live="polite"></span>
											</div>
										</div>
									</div>

									<input type="hidden" value="${getWork.workId}"
										name="sendWorkId" id="sendWorkId">


									<div class="col-lg-3" align="right">
										<button type="submit" class="btn btn-primary"
											style="align-content: center; width: 113px; margin-left: 40px;">
											Submit</button>
									</div>
								</div>
							</form>

						</div>


						<hr>

						<c:if test="${getWork.workTypeTd==1}">



							<div class="form-group"></div>
							<div class="row">
								<div class="col-md-1"></div>

								<div class="col-md-2">

									<a href="${docUrl}${getWork.rcbook}"
										style="align-content: flex-end;">RC Book</a>

								</div>

								<div class="col-md-2">

									<a href="${docUrl}${getWork.insurance}"
										style="align-content: flex-end;">Insurance 1</a>

								</div>

								<div class="col-md-2">

									<a href="${docUrl}${getWork.insurance1}"
										style="align-content: flex-end;">Insurance 2</a>

								</div>
								<div class="col-md-2">


									<a href="${docUrl}${getWork.puc}"
										style="align-content: flex-end;">PUC</a>
								</div>
								<div class="col-md-2">

									<a href="${docUrl}${getWork.addProof}"
										style="align-content: flex-end;">Address Proof</a>
								</div>
							</div>

						</c:if>

						<c:if test="${getWork.workTypeTd==2}">

							<div class="form-group"></div>
							<div class="row">
								<div class="col-md-1"></div>


								<div class="col-md-2">

									<a href="${docUrl}${getWork.rcbook}"
										style="align-content: flex-end;">RC Book</a>

								</div>

								<div class="col-md-2">

									<a href="${docUrl}${getWork.insurance}"
										style="align-content: flex-end;">Insurance 1</a>

								</div>

								<div class="col-md-2">

									<a href="${docUrl}${getWork.insurance1}"
										style="align-content: flex-end;">Insurance 2</a>

								</div>
								<div class="col-md-2">


									<a href="${docUrl}${getWork.puc}"
										style="align-content: flex-end;">PUC</a>
								</div>
								<div class="col-md-2">
									<a href="${docUrl}${getWork.bankDocument}"
										style="align-content: flex-end;">Bank NOC</a>
								</div>
							</div>

						</c:if>


						<c:if test="${getWork.workTypeTd==3}">

							<div class="form-group"></div>
							<div class="row">
								<div class="col-md-1"></div>

								<div class="col-md-2">

									<a href="${docUrl}${getWork.rcbook}"
										style="align-content: flex-end;">RC Book</a>

								</div>

								<div class="col-md-2">

									<a href="${docUrl}${getWork.insurance}"
										style="align-content: flex-end;">Insurance 1</a>

								</div>

								<div class="col-md-2">

									<a href="${docUrl}${getWork.insurance1}"
										style="align-content: flex-end;">Insurance 2</a>

								</div>
								<div class="col-md-2">


									<a href="${docUrl}${getWork.puc}"
										style="align-content: flex-end;">PUC</a>
								</div>
								<div class="col-md-2">
									<a href="${docUrl}${getWork.bankDocument}"
										style="align-content: flex-end;">Bank Letter</a>
								</div>

								<div class="col-md-2">
									<a href="${docUrl}${getWork.bankDocument1}"
										style="align-content: flex-end;">Form No. 17</a>
								</div>
							</div>

						</c:if>


						<c:if test="${getWork.workTypeTd==4}">

							<div class="form-group"></div>
							<div class="row">
								<div class="col-md-1"></div>

								<div class="col-md-2">

									<a href="${docUrl}${getWork.rcbook}"
										style="align-content: flex-end;">RC Book</a>

								</div>

								<div class="col-md-2">

									<a href="${docUrl}${getWork.insurance}"
										style="align-content: flex-end;">Insurance 1</a>

								</div>

								<div class="col-md-2">

									<a href="${docUrl}${getWork.insurance1}"
										style="align-content: flex-end;">Insurance 2</a>

								</div>
								<div class="col-md-2">


									<a href="${docUrl}${getWork.puc}"
										style="align-content: flex-end;">PUC</a>
								</div>


								<div class="col-md-2">
									<a href="${docUrl}${getWork.addProof}"
										style="align-content: flex-end;">Address Proof</a>
								</div>
							</div>

						</c:if>
						<c:if test="${getWork.workTypeTd==5}">

							<div class="form-group"></div>
							<div class="row">

								<div class="col-md-2"></div>
								<div class="col-md-2">
									<a href="${docUrl}${getWork.orignalLicence}"
										style="align-content: flex-end;">Original License</a>

								</div>
							</div>
						</c:if>


						<hr>

						<div class="card-body">
							<table class="table table-striped table-bordered">

								<thead>
									<tr>
										<th>Sr No</th>
										<th>Date</th>
										<th>Work Id</th>
										<th>Description</th>

									</tr>
								</thead>
								<tbody>

									<c:forEach items="${workdetail}" var="workdetail"
										varStatus="count">
										<tr>

											<td><c:out value="${count.index+1}" /></td>
											<td><c:out value="${workdetail.date}" /></td>
											<td><c:out value="${workdetail.workId}" /></td>
											<td><c:out value="${workdetail.workDesc}" /></td>

										</tr>
									</c:forEach>

								</tbody>

							</table>
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
	<!-- <script type="text/javascript">
		function callSearch() {
			alert("cxcgxc");
			var date = $("#date").val();
			var distId = $("#distId").val();

			$.getJSON('${getOrderByDate}',

			{
				date : date,
				distId : distId,

				ajax : 'true'

			}, function(data) {

				alert(data.getOrderDetailList);

				if (data == "") {
					alert("No records found !!");

				}

				/* document.getElementById("orderDate").value = data.orderDate;

				document.getElementById("orderTotal").value = data.orderTotal;
				document.getElementById("prevPendingCrateBal").value = data.prevPendingCrateBal;
				document.getElementById("cratesIssued").value = data.cratesIssued;
				document.getElementById("cratesReceived").value = data.cratesReceived;
				document.getElementById("cratesBalance").value = (data.prevPendingCrateBal
						+ data.cratesIssued - data.cratesReceived);

				document.getElementById("prevPendingAmt").value = data.prevPendingAmt;
				document.getElementById("orderTotal1").value = data.orderTotal;
				document.getElementById("amtReceived").value = data.amtReceived;
				document.getElementById("amountBalanced").value = (data.prevPendingAmt
						+ data.orderTotal - data.amtReceived); */

				var dataTable = $('#bootstrap-data-table').DataTable();
				$.each(data.getOrderDetailList, function(i, v) {
					dataTable.row.add(
							[ i + 1, v.itemEngName, v.itemWt, v.uomName,
									v.orderQty, v.deliverQty, v.itemTotal ])
							.draw();
				});

			});
		}
	</script> -->
	<script>
		jQuery(document).ready(function() {
			jQuery(".standardSelect").chosen({
				disable_search_threshold : 2,
				no_results_text : "Oops, nothing found!",
				width : "100%"
			});
		});
	</script>

	<script type="text/javascript">
		$(document).ready(function() {
			$('#bootstrap-data-table-export').DataTable();
		});
	</script>


	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		$(function() {
			$('input[id$=date]').datepicker({
				dateFormat : 'dd-mm-yy'
			});
		});
	</script>

</body>
</html>