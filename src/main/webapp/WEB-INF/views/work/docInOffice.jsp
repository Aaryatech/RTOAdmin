<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Document In Office</title>


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
							<strong class="card-title">Document In Office</strong>
						</div>
						<div class="card-body">
							<form
								action="${pageContext.request.contextPath}/updateWorkStatus"
								id="work_form" method="post">
								<table id="bootstrap-data-table"
									class="table table-striped table-bordered">
									<thead>
										<tr>
											<th width="2%" class="check"><input type="checkbox"
												name="selAll" id="selAll" /> All</th>
											<th width="2%">Sr No</th>
											<th width="4%">Enq No</th>
											<th width="5%">Date</th>
											<th width="15%">Cust Name</th>
											<th width="10%">Mob No</th>
											<th width="40%">Work Type Name</th>
											<th width="10%">Work Cost</th>
											<th width="10%">Payment Done</th>
											<th width="10%">Rem Amt</th>
											<th width="2%">Action</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach items="${workList}" var="workList"
											varStatus="count">
											<tr>
												<td><input type="checkbox" name="sendWorkIds"
													id="sendWorkIds" value="${workList.workId}" /></td>
												<td><c:out value="${count.index+1}" /></td>
												<td><c:out value="${workList.workId}" /></td>

												<td><c:out value="${workList.date1}" /></td>

												<td><c:out value="${workList.custName}" /></td>

												<td><c:out value="${workList.custMobile}" /></td>
												<td><c:out value="${workList.workTypeName}" /></td>

												<td align="right"><input class="form-control"
													id="workCost${workList.workId}" placeholder="Cost"
													type="text" name="workCost${workList.workId}"
													value="${workList.workCost}" readonly /></td>
												<td align="right"><input class="form-control"
													id="workCost${workList.workId}" placeholder="Cost"
													type="text" name="workCost${workList.workId}"
													value="${workList.workCost}" readonly /></td>
												<td align="right"><input class="form-control"
													id="workCost${workList.workId}" placeholder="Cost"
													type="text" name="workCost${workList.workId}"
													value="${workList.workCost}" readonly /> <input
													type="hidden" name="status" id="status" value="5"></td>
												<td>
													<div class="fa-hover col-lg-3 col-md-6">
														<a
															href="${pageContext.request.contextPath}/editWorkDetail/${workList.workId}"><i
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
										onclick="valthisform()"
										style="align-content: center; width: 226px; margin-left: 80px;">
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
	<script type="text/javascript">
		function valthisform() {
			var checkboxs = document.getElementsByName("sendWorkIds");
			var okay = false;
			for (var i = 0, l = checkboxs.length; i < l; i++) {
				if (checkboxs[i].checked) {
					okay = true;
					break;
				}
			}
			if (okay) {

				var form = document.getElementById("work_form");

				form.submit();
			} else
				alert("Please check a checkbox");
		}
	</script>

</body>
</html>