<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Work Head List</title>


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


<!-- Translate -->


<script type="text/javascript" src="http://www.google.com/jsapi"></script>


<!-- Translate -->
<script type="text/javascript"
	src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>

<body>


	<!-- Left Panel -->
	<jsp:include page="/WEB-INF/views/common/left.jsp"></jsp:include>
	<!-- Left Panel -->


		<!-- Header-->
	<jsp:include page="/WEB-INF/views/common/right.jsp"></jsp:include>
	<!-- Header-->




	<div class="content mt-3">
		<div class="animated fadeIn">

			<div class="row">

				<%-- <div class="col-xs-12 col-sm-12">
					<div class="card">
						<div class="card-header">
							<strong> Add New User</strong>
						</div>
						<div class="card-body card-block">
							<form action="${pageContext.request.contextPath}/insertUser"
								method="post">




								<div class="col-lg-12" align="center">


									<button type="submit" class="btn btn-primary"
										style="align-content: center; width: 226px; margin-left: 80px;">Submit

									</button>
								</div>
							</form>
						</div>
					</div>
				</div> --%>

				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<strong class="card-title">Work List</strong>
						</div>
						<div class="card-body">
							<form
								action="${pageContext.request.contextPath}/updateStatusAndCost"
								method="post">
								<table id="bootstrap-data-table"
									class="table table-striped table-bordered">
									<thead>
										<tr>

											<th width="5%">Sr No</th>
											<th width="2%">Enq No</th>
											<th width="15%">Date</th>
											<th width="15%">Cust Name</th>
											<th width="15%">Vehicle No.</th>
											<th width="15%">Work Type Name</th>
											<th width="15%">Work Status</th>
											<th width="5%">Action</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach items="${workList}" var="workList"
											varStatus="count">
											<tr>

												<td><c:out value="${count.index+1}" /></td>
												<td><c:out value="${workList.workId}" /></td>

												<td><c:out value="${workList.date1}" /></td>

												<td><c:out value="${workList.custName}-${workList.custMobile}" /></td>

												<td><c:out value="${workList.vehicalNo}" /></td>
												<td><c:out value="${workList.workTypeName}" /></td>
												<td>
												<c:choose>
												<c:when test="${workList.status==1}">
												Upload Documnents

												</c:when>
												</c:choose>
												<c:choose>
												<c:when test="${workList.status==2}">
												Update Work Cost

												</c:when>
												</c:choose>
												<c:choose>
												<c:when test="${workList.status==3}">
												Update Payment Done
 

												</c:when>
												</c:choose>
												<c:choose>
												<c:when test="${workList.status==4}">
												User Allocation

												</c:when>
												</c:choose>
												<c:choose>
												<c:when test="${workList.status==5}">
												Document In Office

												</c:when>
												</c:choose>
												<c:choose>
												<c:when test="${workList.status==6}">
												Document Submit top RTO
												</c:when>
												</c:choose>
												<c:choose>
												<c:when test="${workList.status==7}">
												Handover To Customer

												</c:when>
												</c:choose>
												</td>
												<td>	<div class="fa-hover col-lg-3 col-md-6">
														<a
															href="${pageContext.request.contextPath}/editWorkHead/${workList.workId}"><i
															class="fa fa-edit"></i> <span class="text-muted"></span></a>
													</div> <%-- <div class="fa-hover col-lg-3 col-md-6">
													<a
														href="${pageContext.request.contextPath}/deleteUser/${userList.userId}"
														onClick="return confirm('Are you sure want to delete this record');"><i
														class="fa fa-trash-o"></i></a>
												</div> --%>
												</td>
											</tr>
										</c:forEach>

									</tbody>

								</table>
								<div class="col-lg-12" align="center">


									<button type="submit" class="btn btn-primary"
										style="align-content: center; width: 150px; border-radius: 50px">
										Submit</button>
								</div>

							</form>
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


	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		$(function() {
			$('input[id$=dateOfBirth]').datepicker({
				dateFormat : 'dd-mm-yy'
			});
		});
	</script>


	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$('#bootstrap-data-table-export').DataTable();

							$("#selAll")
									.click(
											function() {
												$(
														'#bootstrap-data-table tbody input[type="checkbox"]')
														.prop('checked',
																this.checked);
											});
						});
	</script>

</body>
</html>