<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Add New Work Type</title>
<c:url var="getEditWorkType" value="/getEditWorkType" />


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

				<div class="col-xs-12 col-sm-12">
					<div class="card">
						<div class="card-header">
							<strong> Add New WorkType</strong>
						</div>
						<div class="card-body card-block">
							<form action="${pageContext.request.contextPath}/insertWorkType"
								enctype="multipart/form-data" method="post">
								<!-- 	<input type="file" name="file" /> -->
								<div class="row">
									<div class="col-md-2">WorkType Name</div>
									<div class="col-md-4">

										<div class="form-group">

											<input class="form-control" name="workTypeName"
												id="workTypeName" type="text" placeholder="Work Type Name"
												value="${editWork.workTypeName}" required
												oninvalid="setCustomValidity('Please enter Name ')"
												onchange="try{setCustomValidity('')}catch(e){}"
												autocomplete="off" /> <span class="error"
												aria-live="polite"></span>

										</div>
									</div>
									<input type="hidden" id="url" value='${workImageUrl}' />

									<div class="col-md-2">Select Work Type</div>


									<div class="col-md-4">
										<div class="input-group">

											<select id="wType" name="wType" class="standardSelect"
												tabindex="1">
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>


											</select>

										</div>
									</div>
								</div>

								<input type="hidden" name="workTypeId" id="workTypeId"
									value="${editWork.workTypeId}"> &nbsp;
								<div class="row">
									<div class="col-md-2">
										<input type="hidden" name="prevImage1" id="prevImage1">
										Image1

									</div>
									<div class="col-md-4">
										<input type='file' id="imgInp" name="imgInp" value="" /> <img
											id="image1" name="image1" src="#" alt=""
											style="width: 100px; height: 100px" align="left" /> <span
											class="error" aria-live="polite"></span>

									</div>

									<div class="col-md-2">
										<input type="hidden" name="prevImage2" id="prevImage2">
										Image2

									</div>

									<div class="col-md-4">
										<input type='file' id="imgInp1" name="imgInp1" value="" /> <img
											id="image2" name="image2" src="#" alt=""
											style="width: 100px; height: 100px" align="right" /> <span
											class="error" aria-live="polite"></span>

									</div>
								</div>
								<div class="col-lg-12" align="center">


									<button type="submit" class="btn btn-primary"
										style="align-content: center; width: 226px; margin-left: 80px;">Submit

									</button>
								</div>
							</form>
						</div>
					</div>
				</div>

				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<strong class="card-title">Work Type List</strong>
						</div>
						<div class="card-body">
							<table id="bootstrap-data-table"
								class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>Sr No</th>
										<th>WorkType Name</th>
										<th>Image1</th>
										<th>Image2</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach items="${workList}" var="workList" varStatus="count">
										<tr>

											<td><c:out value="${count.index+1}" /></td>

											<td><c:out value="${workList.workTypeName}" /></td>
											<td style="text-align: center;">${workList.workImage1}</td>
											<td style="text-align: center;">${workList.workImage2}</td>

											<td>
												<div class="fa-hover col-lg-3 col-md-6">
													<a href="#" onclick="editWorkType(${workList.workTypeId})"><i
														class="fa fa-edit"></i> <span class="text-muted"></span></a>
													&nbsp;
												</div>

												<div class="fa-hover col-lg-3 col-md-6">
													<a
														href="${pageContext.request.contextPath}/deleteWorkType/${workList.workTypeId}"
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
		function editWorkType(workTypeId) {

			alert(workTypeId);

			$.getJSON('${getEditWorkType}', {

				workTypeId : workTypeId,

				ajax : 'true',

			},

			function(data) {

				$("#workTypeName").val(data.workTypeName);
				$("#wType").val(data.wType);
				var url = $('#url').val();
				var filePath = url + data.workImage1;

				$('#image1').attr('src', filePath);

				var url1 = $('#url').val();
				var filePath1 = url1 + data.workImage2;

				$('#image2').attr('src', filePath1);

				//hidden field catId
				$("#workTypeId").val(data.workTypeId);
				//prevImage hidden field
				$("#image1").val(data.workImage1);

				$("#image2").val(data.workImage2);

			});

		}
	</script>


	<script type="text/javascript">
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#image1').attr('src', e.target.result);
				}

				reader.readAsDataURL(input.files[0]);
			}
		}

		$("#imgInp").change(function() {
			readURL(this);
		});
	</script>

	<script type="text/javascript">
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#image2').attr('src', e.target.result);
				}

				reader.readAsDataURL(input.files[0]);
			}
		}

		$("#imgInp1").change(function() {
			readURL(this);
		});
	</script>





</body>
</html>