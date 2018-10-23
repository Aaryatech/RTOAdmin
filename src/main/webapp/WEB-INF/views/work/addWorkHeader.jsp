<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js" lang="">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Add Work</title>
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
<body onload="onLoadCall()">

	<c:url var="getCatByDate" value="/getCatByDate"></c:url>
	<!-- Left Panel -->
	<jsp:include page="/WEB-INF/views/common/left.jsp"></jsp:include>
	<!-- Left Panel -->


	<!-- Header-->
	<!-- Header-->



	<div class="content mt-3">
		<div class="animated fadeIn">

			<div class="row">

				<div class="col-xs-12 col-sm-12">
					<div class="card">
						<div class="card-header">
							<strong> Add Work</strong>
						</div>
						<div class="card-body card-block">
							<form
								action="${pageContext.request.contextPath}/insertWorkHeader"
								method="post" enctype="multipart/form-data">


								<div class="row">

									<div class="col-md-2">Select Work Type</div>
									<div class="col-md-3">
										<select id="workTypeId" name="workTypeId"  onchange="callSel()"
											class="standardSelect" tabindex="1">
											<option value="0">Select Work Type</option>

											<c:forEach items="${workList}" var="workList">
											<c:choose>
											<c:when test="${getWork.workTypeTd==workList.wType}">
											<option selected value="${workList.wType}">${workList.workTypeName}</option>
											</c:when>
										<c:otherwise>
										<option  value="${workList.wType}">${workList.workTypeName}</option>
										</c:otherwise>
											</c:choose>

											</c:forEach>
										</select>

									</div>
									&nbsp;
									<div class="col-md-2">Select Customer</div>
									<div class="col-md-3">
										<select id="cust_id" name="cust_id" class="standardSelect"
											tabindex="1">
											<option value=""></option>


											<c:forEach items="${custList}" var="cust">
												<c:choose>
												
												<c:when test="${getWork.custId==cust.custId}">
													<option selected value="${cust.custId}">${cust.custName}</option>
												
												</c:when>
												<c:otherwise>
													<option value="${cust.custId}">${cust.custName}</option>
												
												</c:otherwise>
												</c:choose>
												

											</c:forEach>
										</select>

									</div>

								</div>
										<input type="hidden" name="workId" id="workId" value="${getWork.workId}">

								<div class="form-group"></div>
								<div class="row">

									<div class="col-md-2">Vehicle No</div>
									<div class="col-md-1">
										<input type='text' id="veh_no" name="veh_no" value="${getWork.vehicalNo}" required/>
									</div>

								</div>

								<div class="form-group"></div>
								<div class="row">
									<div class="col-md-2">
										<input type="hidden" name="prevImage1" id="prevImage1" value="${getWork.photo}">
										Photo1

									</div>
									<div class="col-md-4">
										<input type='file' id="imgInp" name="imgInp" value="" /> <img
											id="image1" name="image1" src="${docUrl}${getWork.photo}" alt=""
											style="height: 50px; width: 50px;" /> <span class="error"
											aria-live="polite"></span>

									</div>

									<div class="col-md-2">
										<input type="hidden" name="prevImage2" id="prevImage2" value="${getWork.photo1}">
										Photo2

									</div>

									<div class="col-md-4">
										<input type='file' id="imgInp1" name="imgInp1" value="" /> <img
											id="image2" name="image2" src="${docUrl}${getWork.photo1}" alt=""
											style="height: 50px; width: 50px;" /> <span class="error"
											aria-live="polite"></span>

									</div>

								</div>

								<div class="form-group"></div>
								<div class="form-group"></div>
								<div class="row">

									<div class="col-md-2">Aadhaar Card</div>
									<div class="col-md-4">
										<input type="hidden" name="prev_ac" id='prev_ac' value="${getWork.adharCard}"> <input
											type='file' id="ac" name="doc[]" value="" required="required"/>
									</div>
									
									<c:if test="${editWorkType>0}">
									<div class="col-md-2"></div>
									<div class="col-md-1">
									<a href="${docUrl}${getWork.adharCard}"  style="align-content: flex-end;">File</a>
									</div>
									</c:if>

								

								</div>
								<div class="form-group"></div>
								<div class="row" id="rc_book_div" style="display: none;">

									<div class="col-md-2">RC Book</div>
									<div class="col-md-4">
										<input type="hidden" name="prev_rc" id='prev_rc' value="${getWork.rcbook}"> <input
											type='file' id="rc_book" name="doc[]" value="" />
									</div>
									<c:if test="${editWorkType>0}">
									<div class="col-md-2"></div>
									<div class="col-md-1">
									<a href="${docUrl}${getWork.rcbook}"  style="align-content: flex-end;">File</a>
									</div>
									</c:if>
								</div>
								<div class="form-group"></div>
								<div class="row" id="puc_div" style="display: none;">
									<div class="col-md-2">PUC</div>
									<div class="col-md-4">
										<input type="hidden" name="prev_puc" id=prev_puc value="${getWork.puc}"> <input
											type='file' id="puc" name="doc[]" value="" />
									</div>
									<c:if test="${editWorkType>0}">
									<div class="col-md-2"></div>
									<div class="col-md-1">
									<a href="${docUrl}${getWork.puc}"  style="align-content: flex-end;">File</a>
									</div>
									</c:if>

								</div>
								<div class="form-group"></div>

								<div class="row" id="ins1_div" style="display: none;">

									<div class="col-md-2">Insurance 1</div>
									<div class="col-md-4">
										<input type="hidden" name="prev_ins1" id='prev_ins1' value="${getWork.insurance}"> <input
											type='file' id="ins1" name="doc[]" value="" />
									</div>
									<c:if test="${editWorkType>0}">
									<div class="col-md-2"></div>
									<div class="col-md-1">
									<a href="${docUrl}${getWork.insurance}"  style="align-content: flex-end;">File</a>
									</div>
									</c:if>
								</div>
								<div class="form-group"></div>
								<div class="row" id="ins2_div" style="display: none;">

									<div class="col-md-2">Insurance 2</div>
									<div class="col-md-4">
										<input type="hidden" name="prev_ins2" id=prev_ins2 value="${getWork.insurance1}"> <input
											type='file' id="ins2" name="doc[]" value="" />
									</div>
									<c:if test="${editWorkType>0}">
									<div class="col-md-2"></div>
									<div class="col-md-1">
									<a href="${docUrl}${getWork.insurance1}"  style="align-content: flex-end;">File</a>
									</div>
									</c:if>

								</div>
								<div class="form-group"></div>
								<div class="row" id="add_pf_div" style="display: none;">

									<div class="col-md-2">Address Proof</div>
									<div class="col-md-4">
										<input type="hidden" name="prev_add_proof" id='prev_add_proof' value="${getWork.addProof}">
										<input type='file' id="add_proof" name="doc[]" value="" />
									</div>
									<c:if test="${editWorkType>0}">
									<div class="col-md-2"></div>
									<div class="col-md-1">
									<a href="${docUrl}${getWork.addProof}"  style="align-content: flex-end;">File</a>
									</div>
									</c:if>
								</div>
								<div class="form-group"></div>

								<div class="row" id="bank_noc_div" style="display: none;">

									<div class="col-md-2">Bank NOC</div>
									<div class="col-md-4">
										<input type="hidden" name="prev_bank_noc" id='prev_bank_noc' value="${getWork.bankDocument}">
										<input type='file' id="bank_noc" name="doc[]" value="" />
									</div>
									<c:if test="${editWorkType>0}">
									<div class="col-md-2"></div>
									<div class="col-md-1">
									<a href="${docUrl}${getWork.bankDocument}"  style="align-content: flex-end;">File</a>
									</div>
									</c:if>


								</div>
								<div class="form-group"></div>

								<div class="row" id="bank_letter_div" style="display: none;">

									<div class="col-md-2">Bank Letter</div>
									<div class="col-md-4">
										<input type="hidden" name="prev_bank_letter" id='prev_bank_letter' value="${getWork.bankDocument}">
										<input type='file' id="bank_letter" name="doc[]" value="" />
									</div>
									
									<c:if test="${editWorkType>0}">
									<div class="col-md-2"></div>
									<div class="col-md-1">
									<a href="${docUrl}${getWork.bankDocument}"  style="align-content: flex-end;">File</a>
									</div>
									</c:if>
									
								</div>
								<div class="form-group"></div>
								<div class="row" id="form_17_div" style="display: none;">

									<div class="col-md-2">Form No 17</div>
									<div class="col-md-4">
										<input type="hidden" name="prev_form_no17" id='prev_form_no17' value="${getWork.bankDocument1}">
										<input type='file' id="form_no17" name="doc[]" value="" />
									</div>
									
									<c:if test="${editWorkType>0}">
									<div class="col-md-2"></div>
									<div class="col-md-1">
									<a href="${docUrl}${getWork.bankDocument1}"  style="align-content: flex-end;">File</a>
									</div>
									</c:if>

								</div>

								<div class="form-group"></div>
								<div class="row" id="orig_lic_div" style="display: none;">

									<div class="col-md-2">Original License</div>
									<div class="col-md-4">
										<input type="hidden" name="prev_orig_lic" id='prev_orig_lic' value="${getWork.orignalLicence}">
										<input type='file' id="orig_lic" name="doc[]" value="" />
									</div>
									
									<c:if test="${editWorkType>0}">
									<div class="col-md-2"></div>
									<div class="col-md-1">
									<a href="${docUrl}${getWork.orignalLicence}"  style="align-content: flex-end;">File</a>
									</div>
									</c:if>
								</div>

																<div class="form-group"></div>


								<div class="col-lg-12" align="center">


									<button type="submit" class="btn btn-primary"
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


	<!-- .animated -->
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


	<!-- 	<script type="text/javascript">
	
	function editMsUser(msId){
		
		//alert(catId);
		
		$.getJSON('${getEditMsUser}',{
			
			msId : msId,
			
			ajax : 'true',

		},
		
		function(data){
			document.getElementById('addDiv').style.display = "block";
			$("#usrname_mr").val(data.msMarName);
			$("#usrname_eng").val(data.msEngName);
        	
			//hidden field msId
			$("#ms_id").val(data.msId);
			
			$("#contact_no").val(data.msContactNo);
			 document.getElementById("contact_no").readOnly = true; 
			$("#usr_pass").val(data.msPwd); 
			$("#conf_pass").val(data.msPwd); 
			document.getElementById("usr_role").options.selectedIndex =data.isAdmin;
			$("#usr_role").trigger("chosen:updated");
			var temp=new Array();
			
			temp=(data.hubIds).split(",");
			//alert(temp);
			$("#sel_hub").val(temp); 
			$("#sel_hub").trigger("chosen:updated");

			//$('#sel_hub').formcontrol('refresh');
	 		document.getElementById('submitButton').disabled = false;


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

<script type="text/javascript">

function callSel() {
	//alert("Call me");
	var workType = document.getElementById("workTypeId").value;
	if(workType==1){
		//alert("In work Type  " +workType);
		document.getElementById('rc_book_div').style.display = "flow-root";
		document.getElementById('ins1_div').style.display = "flow-root";
		document.getElementById('ins2_div').style.display = "flow-root";
		document.getElementById('puc_div').style.display = "flow-root";
		document.getElementById('add_pf_div').style.display = "flow-root";
	
		document.getElementById('bank_noc_div').style = "display:none";
		document.getElementById('bank_letter_div').style = "display:none";
		document.getElementById('form_17_div').style = "display:none";
		document.getElementById('orig_lic_div').style = "display:none";

	}
	
	else if(workType==2){
		//alert("In work Type  " +workType);
		document.getElementById('rc_book_div').style.display = "flow-root";
		document.getElementById('ins1_div').style.display = "flow-root";
		document.getElementById('ins2_div').style.display = "flow-root";
		document.getElementById('puc_div').style.display = "flow-root";
		document.getElementById('bank_noc_div').style = "flow_root";

		document.getElementById('add_pf_div').style.display = "display:none";
	
		document.getElementById('bank_letter_div').style = "display:none";
		document.getElementById('form_17_div').style = "display:none";
		document.getElementById('orig_lic_div').style = "display:none";

	}

else if(workType==3){
	//alert("In work Type  " +workType);
	document.getElementById('rc_book_div').style.display = "flow-root";
	document.getElementById('ins1_div').style.display = "flow-root";
	document.getElementById('ins2_div').style.display = "flow-root";
	document.getElementById('puc_div').style.display = "flow-root";
	document.getElementById('bank_letter_div').style = "flow_root";
	document.getElementById('form_17_div').style = "flow_root";

	document.getElementById('add_pf_div').style.display = "display:none";
	document.getElementById('orig_lic_div').style = "display:none";
	document.getElementById('bank_noc_div').style =  "display:none";

}else if(workType==4){
	//alert("In work Type  " +workType);
	document.getElementById('rc_book_div').style.display = "flow-root";
	document.getElementById('ins1_div').style.display = "flow-root";
	document.getElementById('ins2_div').style.display = "flow-root";
	document.getElementById('puc_div').style.display = "flow-root";
	document.getElementById('add_pf_div').style.display = "flow-root";

	document.getElementById('bank_noc_div').style = "display:none";
	document.getElementById('bank_letter_div').style = "display:none";
	document.getElementById('form_17_div').style = "display:none";
	document.getElementById('orig_lic_div').style = "display:none";

}

else if(workType==5){
	document.getElementById('rc_book_div').style.display = "display:none";
	document.getElementById('ins1_div').style.display = "display:none";
	document.getElementById('ins2_div').style.display = "display:none";
	document.getElementById('puc_div').style.display = "display:none";
	document.getElementById('bank_noc_div').style = "display:none";

	document.getElementById('add_pf_div').style.display = "display:none";

	document.getElementById('bank_letter_div').style = "display:none";
	document.getElementById('form_17_div').style = "display:none";
	document.getElementById('orig_lic_div').style = "flow-root";

}

}
</script>
<script type="text/javascript">
function onLoadCall() {
	//alert("onload Call")
	var workType=${getWork.workTypeTd};
	
	document.getElementById("ac").required = false;
	if(workType==1){
		//alert("In work Type  " +workType);
		document.getElementById('rc_book_div').style.display = "flow-root";
		document.getElementById('ins1_div').style.display = "flow-root";
		document.getElementById('ins2_div').style.display = "flow-root";
		document.getElementById('puc_div').style.display = "flow-root";
		document.getElementById('add_pf_div').style.display = "flow-root";
	
		document.getElementById('bank_noc_div').style = "display:none";
		document.getElementById('bank_letter_div').style = "display:none";
		document.getElementById('form_17_div').style = "display:none";
		document.getElementById('orig_lic_div').style = "display:none";

	}
	
	else if(workType==2){
		//alert("In work Type  " +workType);
		document.getElementById('rc_book_div').style.display = "flow-root";
		document.getElementById('ins1_div').style.display = "flow-root";
		document.getElementById('ins2_div').style.display = "flow-root";
		document.getElementById('puc_div').style.display = "flow-root";
		document.getElementById('bank_noc_div').style = "flow_root";

		document.getElementById('add_pf_div').style.display = "display:none";
	
		document.getElementById('bank_letter_div').style = "display:none";
		document.getElementById('form_17_div').style = "display:none";
		document.getElementById('orig_lic_div').style = "display:none";

	}

else if(workType==3){
	//alert("In work Type  " +workType);
	document.getElementById('rc_book_div').style.display = "flow-root";
	document.getElementById('ins1_div').style.display = "flow-root";
	document.getElementById('ins2_div').style.display = "flow-root";
	document.getElementById('puc_div').style.display = "flow-root";
	document.getElementById('bank_letter_div').style = "flow_root";
	document.getElementById('form_17_div').style = "flow_root";

	document.getElementById('add_pf_div').style.display = "display:none";
	document.getElementById('orig_lic_div').style = "display:none";
	document.getElementById('bank_noc_div').style =  "display:none";

}else if(workType==4){
	//alert("In work Type  " +workType);
	document.getElementById('rc_book_div').style.display = "flow-root";
	document.getElementById('ins1_div').style.display = "flow-root";
	document.getElementById('ins2_div').style.display = "flow-root";
	document.getElementById('puc_div').style.display = "flow-root";
	document.getElementById('add_pf_div').style.display = "flow-root";

	document.getElementById('bank_noc_div').style = "display:none";
	document.getElementById('bank_letter_div').style = "display:none";
	document.getElementById('form_17_div').style = "display:none";
	document.getElementById('orig_lic_div').style = "display:none";

}

else if(workType==5){
	document.getElementById('rc_book_div').style.display = "display:none";
	document.getElementById('ins1_div').style.display = "display:none";
	document.getElementById('ins2_div').style.display = "display:none";
	document.getElementById('puc_div').style.display = "display:none";
	document.getElementById('bank_noc_div').style = "display:none";

	document.getElementById('add_pf_div').style.display = "display:none";

	document.getElementById('bank_letter_div').style = "display:none";
	document.getElementById('form_17_div').style = "display:none";
	document.getElementById('orig_lic_div').style = "flow-root";

}

}

</script>
<!-- 	<script type="text/javascript">
$(document).ready(function() { 
	$('#workTypeId').change(
			function() {
				//alert("Hi");
				
				var workType = document.getElementById("workTypeId").value;
				if(workType==1){
					
					document.getElementById('rc_book_div').style.display = "flow-root";
					document.getElementById('ins1_div').style.display = "flow-root";
					document.getElementById('ins2_div').style.display = "flow-root";
					document.getElementById('puc_div').style.display = "flow-root";
					document.getElementById('add_pf_div').style.display = "flow-root";
				
					document.getElementById('bank_noc_div').style = "display:none";
					document.getElementById('bank_letter_div').style = "display:none";
					document.getElementById('form_17_div').style = "display:none";
					document.getElementById('orig_lic_div').style = "display:none";

				}
				
			if(workType==2){
					
					document.getElementById('rc_book_div').style.display = "flow-root";
					document.getElementById('ins1_div').style.display = "flow-root";
					document.getElementById('ins2_div').style.display = "flow-root";
					document.getElementById('puc_div').style.display = "flow-root";
					document.getElementById('bank_noc_div').style = "flow_root";

					document.getElementById('add_pf_div').style.display = "display:none";
				
					document.getElementById('bank_letter_div').style = "display:none";
					document.getElementById('form_17_div').style = "display:none";
					document.getElementById('orig_lic_div').style = "display:none";

				}
			
			if(workType==3){
				
				document.getElementById('rc_book_div').style.display = "flow-root";
				document.getElementById('ins1_div').style.display = "flow-root";
				document.getElementById('ins2_div').style.display = "flow-root";
				document.getElementById('puc_div').style.display = "flow-root";
				document.getElementById('bank_letter_div').style = "flow_root";
				document.getElementById('form_17_div').style = "flow_root";

				document.getElementById('add_pf_div').style.display = "display:none";
				document.getElementById('orig_lic_div').style = "display:none";
				document.getElementById('bank_noc_div').style =  "display:none";

			}if(workType==4){
				
				document.getElementById('rc_book_div').style.display = "flow-root";
				document.getElementById('ins1_div').style.display = "flow-root";
				document.getElementById('ins2_div').style.display = "flow-root";
				document.getElementById('puc_div').style.display = "flow-root";
				document.getElementById('add_pf_div').style.display = "flow-root";
			
				document.getElementById('bank_noc_div').style = "display:none";
				document.getElementById('bank_letter_div').style = "display:none";
				document.getElementById('form_17_div').style = "display:none";
				document.getElementById('orig_lic_div').style = "display:none";

			}

if(workType==5	){
				
				document.getElementById('rc_book_div').style.display = "display:none";
				document.getElementById('ins1_div').style.display = "display:none";
				document.getElementById('ins2_div').style.display ="display:none";
				document.getElementById('puc_div').style.display = "display:none";
				document.getElementById('add_pf_div').style.display = "display:none";
			
				document.getElementById('bank_noc_div').style = "display:none";
				document.getElementById('bank_letter_div').style = "display:none";
				document.getElementById('form_17_div').style = "display:none";
				document.getElementById('orig_lic_div').style = "flow-root";

			}

			});
});

</script> -->



</body>
</html>