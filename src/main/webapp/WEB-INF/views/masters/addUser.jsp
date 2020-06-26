<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Add New User</title>


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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/lib/datatable/dataTables.bootstrap.min.css">

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
	<c:url var="getMobileNoForAdd" value="/getMobileNoForAdd" />


	<!-- Left Panel -->
	<jsp:include page="/WEB-INF/views/common/left.jsp"></jsp:include>
	<!-- Left Panel -->


	<!-- Header-->
	<jsp:include page="/WEB-INF/views/common/right.jsp"></jsp:include>
	<!-- Header-->



	<div class="content mt-3">
		<div class="animated fadeIn">

			<div class="row">

				<div class="col-xs-12 col-sm-12">
					<div class="card">
						<div class="card-header">
							<strong> Add New User</strong>
						</div>
						<div class="card-body card-block">
							<form action="${pageContext.request.contextPath}/insertUser"
								method="post">
								<div class="row">
									<div class="col-md-2">User Name</div>
									<div class="col-md-4">

										<div class="input-group">
											<input class="form-control" name="userName" id="userName"
												type="text" placeholder="User Name"
												value="${editUser.userName}" required
												oninvalid="setCustomValidity('Please enter Name ')"
												onchange="try{setCustomValidity('')}catch(e){}"
												autocomplete="off" /> <span class="error"
												aria-live="polite"></span>

										</div>
									</div>

									<input type="hidden" name="userId" id="userId"
										value="${editUser.userId}">

									<div class="col-md-2">User Email</div>
									<div class="col-md-4">


										<div class="input-group">
											<input class="form-control" name="userEmail" id="userEmail"
												placeholder="User Email" type="text"
												value="${editUser.userEmail}" required
												oninvalid="setCustomValidity('Please enter Email ')"
												onchange="try{setCustomValidity('')}catch(e){}"
												autocomplete="off" /> <span class="error"
												aria-live="polite"></span>
										</div>
									</div>

								</div>
								&nbsp;
								<div class="row">
									<div class="col-md-2">Contact Number</div>
									<div class="col-md-4">


										<div class="input-group">

											<input class="form-control" name="contactNo" id="contactNo"
												placeholder="Contact No" value="${editUser.userMobile}"
												onblur="getMobNoTocheck()" required maxlength="10"
												oninvalid="setCustomValidity('Please enter valid Mobile no ')"
												onchange="try{setCustomValidity('')}catch(e){}"
												pattern="[0-9]{10}" autocomplete="off"> <span
												class="error" aria-live="polite"></span>
										</div>
									</div>

									<div class="col-md-2">Password</div>
									<div class="col-md-4">
										<div class="input-group">

											<input class="form-control" name="password" id="password"
												value="${editUser.userPassword}" type="password"
												placeholder="password" required
												oninvalid="setCustomValidity('Please enter password ')"
												onchange="try{setCustomValidity('')}catch(e){}"
												autocomplete="off" /> <span class="error"
												aria-live="polite"></span>
										</div>
									</div>
								</div>
								&nbsp;
								<div class="row">
									<div class="col-md-2">Date of Birth</div>
									<div class="col-md-4">
										<input type="text" id="dateOfBirth" name="dateOfBirth"
											value="${editUser.userDob}" required
											oninvalid="setCustomValidity('Please Select Date ')"
											onchange="try{setCustomValidity('')}catch(e){}" />
									</div>
								</div>
								<div class="col-lg-12" align="center">
									<button type="submit" class="btn btn-primary" id="submit"
										name="submit"
										style="align-content: center; width: 150px; border-radius: 50px">Submit

									</button>
								</div>
							</form>
						</div>
					</div>
				</div>

				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<strong class="card-title">User List</strong>
						</div>
						<div class="card-body">
							<table id="bootstrap-data-table"
								class="table table-striped table-bordered">
								<thead>
									<tr>
										<th width="5%">Sr No</th>
										<th width="25%">User Name</th>
										<th width="20%">Contact No</th>
										<th width="25%">User Email</th>
										<th width="15%">Date of Birth</th>
										<th width="10%">Action</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach items="${userList}" var="userList" varStatus="count">
										<tr>

											<td><c:out value="${count.index+1}" /></td>

											<td><c:out value="${userList.userName}" /></td>

											<td><c:out value="${userList.userMobile}" /></td>

											<td><c:out value="${userList.userEmail}" /></td>
											<td><c:out value="${userList.userDob}" /></td>
											<td>
												<div class="fa-hover col-lg-3 col-md-6">
													<a
														href="${pageContext.request.contextPath}/editUser/${userList.userId}"><i
														class="fa fa-edit"></i> <span class="text-muted"></span></a>
												</div>

												<div class="fa-hover col-lg-3 col-md-6">
													<a
														href="${pageContext.request.contextPath}/deleteUser/${userList.userId}"
														onClick="return confirm('Are you sure want to delete this record');"><i
														class="fa fa-trash-o"></i></a>
												</div>
											</td>

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


	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		$(function() {
			$('input[id$=dateOfBirth]').datepicker({
				dateFormat : 'dd-mm-yy'
			});
		});
	</script>


	<script type="text/javascript">
		function getMobNoTocheck() {

			var contactNo = $("#contactNo").val();

			$.getJSON('${getMobileNoForAdd}', {

				contactNo : contactNo,

				ajax : 'true',

			}, function(data) {
				if (data.error == true) {
					 
						alert("Mobile No Already Exist");

				     document.getElementById("#contactNo").value = "";
					setTimeout(function() { 
					document.getElementById("#contactNo").focus(); }, 100); 
					document.getElementById("submit").disabled = true;

				} else {
					document.getElementById("submit").disabled = false;

				}
			}

			);

		}
	</script>



</body>
</html>