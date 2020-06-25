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
					<div class="card">workTypeId
						<div class="card-header">
							<strong> Add Work</strong>
						</div>
						<div class="card-body card-block">
							<form class="upload-form"
								action="${pageContext.request.contextPath}/insertWorkHeader"
								method="post" enctype="multipart/form-data" onsubmit="return validImage()">


								<div class="row">

									<div class="col-md-2">Select Work Type</div>
									<div class="col-md-3">
										<select id="workTypeId" name="workTypeId"  onchange="callSel()"
											class="standardSelect" tabindex="1" required>
											<c:if test="${editWorkType>0}">
											
											<option disabled value="0">Select Work Type</option>
											</c:if>
											
											<c:if test="${editWorkType==0}">
											
											<option  value="0">Select Work Type</option>
											</c:if>
											
											
											
 
									<c:choose>
									
									<c:when test="${editWorkType>0}">

										<c:forEach items="${workList}" var="workList">
											<c:choose>
											
													<c:when test="${getWork.workTypeTd==workList.wType}">
														<option selected value="${workList.wType}">${workList.workTypeName}</option>
													</c:when>
											
												<c:otherwise>
													<option disabled="disabled" value="${workList.wType}">${workList.workTypeName}</option>
												</c:otherwise>
											
											</c:choose>

										</c:forEach>
									</c:when>

								<c:otherwise>


											<c:forEach items="${workList}" var="workList">
										
										<option  value="${workList.wType}">${workList.workTypeName}</option>
										
											</c:forEach>
											</c:otherwise>
											
											</c:choose>
										</select>

									</div>
									&nbsp;
									<div class="col-md-2">Select Customer</div>
									<div class="col-md-3">
										<select id="cust_id" name="cust_id" class="standardSelect"
											tabindex="1">
											

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
										<input type='file' id="imgInp" name="imgInp" value="" data-max-size="50000" class="upload-file"
										 accept="image/*" accept=".jpg,.png,.gif,.doc,.xls,.pdf"/><div class="form-group"></div> <img
											id="image1" name="image1" src="${docUrl}${getWork.photo}"  
											style="height: 70px; width: 70px;" /> <span class="error"
											aria-live="polite"></span>

									</div>

									<div class="col-md-2">
										<input type="hidden" name="prevImage2" id="prevImage2" value="${getWork.photo1}">
										Photo2

									</div>

									<div class="col-md-4">
										<input type='file' id="imgInp1" name="imgInp1" value=""  data-max-size="50000" class="upload-file"
										accept="image/*" accept=".jpg,.png,.gif,.doc,.xls,.pdf"/><div class="form-group"></div> <img
											id="image2" name="image2" src="${docUrl}${getWork.photo1}"
											style="height: 70px;width: 70px;"/> <span class="error"
											aria-live="polite"></span>

									</div>

								</div>

								<div class="form-group"></div>
								<div class="form-group"></div>
								<div class="row">

									<div class="col-md-2">Aadhaar Card</div>
									<div class="col-md-10">
										<input type="hidden" name="prev_ac" id='prev_ac' value="${getWork.adharCard}"> <input 
											type='file' id="ac" name="doc[]" value=""  data-max-size="50000" class="upload-file"
											accept="image/*" accept=".jpg,.png,.gif,.doc,.xls,.pdf"
											required="required"/> <c:if test="${editWorkType>0}"><a href="${docUrl}${getWork.adharCard}"  style="align-content: flex-end;" target="_blank">Aadhar Card</a></c:if>
									</div>
									
									<%-- <c:if test="${editWorkType>0}">
									<div class="col-md-2"></div>
									<div class="col-md-1">
									<a href="${docUrl}${getWork.adharCard}"  style="align-content: flex-end;">File</a>
									</div>
									</c:if> --%>

								

								</div>
								<div class="form-group"></div>
								<div class="row" id="rc_book_div" style="display: none;">

									<div class="col-md-2" id="vehicle_info">RC Book</div>
									<div class="col-md-10">
										<input type="hidden" name="prev_rc" id='prev_rc' value="${getWork.rcbook}"> 
										<input
											type='file' id="rc_book" name="doc[]" value="" data-max-size="50000" class="upload-file"
										accept="image/*" accept=".jpg,.png,.gif,.doc,.xls,.pdf"/>
										<c:if test="${editWorkType>0}"><a href="${docUrl}${getWork.rcbook}"  style="align-content: flex-end;" target="_blank">
											<c:choose>
												<c:when test="${editWorkType==6}">
												Vehicle Info
												</c:when>
												 <c:otherwise>
												RC Book
												 </c:otherwise>
												</c:choose>
											</a></c:if>
									</div>
									<%-- <c:if test="${editWorkType>0}">
									<div class="col-md-2"></div>
									<div class="col-md-1">
									<a href="${docUrl}${getWork.rcbook}"  style="align-content: flex-end;">File</a>
									</div>
									</c:if> --%>
								</div>
								<div class="form-group"></div>
								<div class="row" id="puc_div" style="display: none;">
									<div class="col-md-2">PUC</div>
									<div class="col-md-10">
										<input type="hidden" name="prev_puc" id=prev_puc value="${getWork.puc}"> <input
											type='file' id="puc" name="doc[]" value="" 
											data-max-size="50000" class="upload-file"
										accept="image/*" accept=".jpg,.png,.gif,.doc,.xls,.pdf"/>
										<c:if test="${editWorkType>0}"><a href="${docUrl}${getWork.puc}"  style="align-content: flex-end;" target="_blank">PUC</a></c:if>
									</div>
									<%-- <c:if test="${editWorkType>0}">
									<div class="col-md-2"></div>
									<div class="col-md-1">
									<a href="${docUrl}${getWork.puc}"  style="align-content: flex-end;">File</a>
									</div>
									</c:if> --%>

								</div>
								<div class="form-group"></div>

								<div class="row" id="ins1_div" style="display: none;">

									<div class="col-md-2">Insurance 1</div>
									<div class="col-md-10">
										<input type="hidden" name="prev_ins1" id='prev_ins1' value="${getWork.insurance}"> <input
											type='file' id="ins1" name="doc[]" value="" 
											data-max-size="50000" class="upload-file"
										accept="image/*" accept=".jpg,.png,.gif,.doc,.xls,.pdf"/>
										<c:if test="${editWorkType>0}"><a href="${docUrl}${getWork.insurance}"  style="align-content: flex-end;" target="_blank">Insurance 1</a></c:if>
									</div>
									<%-- <c:if test="${editWorkType>0}">
									<div class="col-md-2"></div>
									<div class="col-md-1">
									<a href="${docUrl}${getWork.insurance}"  style="align-content: flex-end;">File</a>
									</div>
									</c:if> --%>
								</div>
								<div class="form-group"></div>
								<div class="row" id="ins2_div" style="display: none;">

									<div class="col-md-2">Insurance 2</div>
									<div class="col-md-10">
										<input type="hidden" name="prev_ins2" id=prev_ins2 value="${getWork.insurance1}"> <input
											type='file' id="ins2" name="doc[]" value="" data-max-size="50000" class="upload-file"
										accept="image/*" accept=".jpg,.png,.gif,.doc,.xls,.pdf"/>
										<c:if test="${editWorkType>0}"><a href="${docUrl}${getWork.insurance1}"  style="align-content: flex-end;" target="_blank">Insurance 2</a></c:if>
									</div>
									<%-- <c:if test="${editWorkType>0}">
									<div class="col-md-2"></div>
									<div class="col-md-1">
									<a href="${docUrl}${getWork.insurance1}"  style="align-content: flex-end;">File</a>
									</div>
									</c:if> --%>

								</div>
								<div class="form-group"></div>
								<div class="row" id="add_pf_div" style="display: none;">

									<div class="col-md-2">Address Proof</div>
									<div class="col-md-10">
										<input type="hidden" name="prev_add_proof" id='prev_add_proof' value="${getWork.addProof}">
										<input type='file' id="add_proof" name="doc[]" value="" data-max-size="50000" class="upload-file"
										accept="image/*" accept=".jpg,.png,.gif,.doc,.xls,.pdf"/>
										<c:if test="${editWorkType>0}"><a href="${docUrl}${getWork.addProof}"  style="align-content: flex-end;" target="_blank">Address Proof</a></c:if>
									</div>
								<%-- 	<c:if test="${editWorkType>0}">
									<div class="col-md-2"></div>
									<div class="col-md-1">
									<a href="${docUrl}${getWork.addProof}"  style="align-content: flex-end;">File</a>
									</div>
									</c:if>
								 --%></div>
								<div class="form-group"></div>

								<div class="row" id="bank_noc_div" style="display: none;">

									<div class="col-md-2">Bank NOC</div>
									<div class="col-md-10">
										<input type="hidden" name="prev_bank_noc" id='prev_bank_noc' value="${getWork.bankDocument}">
										<input type='file' id="bank_noc" name="doc[]" value="" data-max-size="50000" class="upload-file"
										accept="image/*" accept=".jpg,.png,.gif,.doc,.xls,.pdf"/>
										<c:if test="${editWorkType>0}">	<a href="${docUrl}${getWork.bankDocument}"  style="align-content: flex-end;" target="_blank">Bank NOC</a></c:if>
									</div>
									<%-- <c:if test="${editWorkType>0}">
									<div class="col-md-2"></div>
									<div class="col-md-1">
									<a href="${docUrl}${getWork.bankDocument}"  style="align-content: flex-end;">File</a>
									</div>
									</c:if> --%>


								</div>
								<div class="form-group"></div>

								<div class="row" id="bank_letter_div" style="display: none;">

									<div class="col-md-2" id="fir_doc">Bank Letter</div>
									<div class="col-md-10">
										<input type="hidden" name="prev_bank_letter" id='prev_bank_letter' value="${getWork.bankDocument}">
										<input type='file' id="bank_letter" name="doc[]" value="" data-max-size="50000" class="upload-file"
										accept="image/*" accept=".jpg,.png,.gif,.doc,.xls,.pdf"/>
										<c:if test="${editWorkType>0}">	<a href="${docUrl}${getWork.bankDocument}"  style="align-content: flex-end;" target="_blank">
										<c:choose>
												<c:when test="${editWorkType==6}">
												FIR Document

												</c:when>
												 <c:otherwise>
												 Bank Letter
												 </c:otherwise>
												</c:choose>
										</a></c:if>
									</div>
									
									<%-- <c:if test="${editWorkType>0}">
									<div class="col-md-2"></div>
									<div class="col-md-1">
									<a href="${docUrl}${getWork.bankDocument}"  style="align-content: flex-end;">File</a>
									</div>
									</c:if> --%>
									
								</div>
								<div class="form-group"></div>
								<div class="row" id="form_17_div" style="display: none;">

									<div class="col-md-2">Form No 17</div>
									<div class="col-md-10" id="">
										<input type="hidden" name="prev_form_no17" id='prev_form_no17' value="${getWork.bankDocument1}">
										<input type='file' id="form_no17" name="doc[]" value="" data-max-size="50000" class="upload-file"
										accept="image/*" accept=".jpg,.png,.gif,.doc,.xls,.pdf"/>
										<c:if test="${editWorkType>0}"><a href="${docUrl}${getWork.bankDocument1}"  style="align-content: flex-end;" target="_blank">Form No. 17</a></c:if>
									</div>
								<%-- 	
									<c:if test="${editWorkType>0}">
									<div class="col-md-2"></div>
									<div class="col-md-1">
									<a href="${docUrl}${getWork.bankDocument1}"  style="align-content: flex-end;">File</a>
									</div>
									</c:if>
 --%>
								</div>

								<div class="form-group"></div>
								<div class="row" id="orig_lic_div" style="display: none;">

									<div class="col-md-2">Original License</div>
									<div class="col-md-10">
										<input type="hidden" name="prev_orig_lic" id='prev_orig_lic' value="${getWork.orignalLicence}">
										<input type='file' id="orig_lic" name="doc[]" value=""  data-max-size="50000" class="upload-file"
										accept="image/*" accept=".jpg,.png,.gif,.doc,.xls,.pdf"/>
										<c:if test="${editWorkType>0}"><a href="${docUrl}${getWork.orignalLicence}"  style="align-content: flex-end;" target="_blank">Original License</a></c:if>
									</div>
									
									<%-- <c:if test="${editWorkType>0}">
									<div class="col-md-2"></div>
									<div class="col-md-1">
									<a href="${docUrl}${getWork.orignalLicence}"  style="align-content: flex-end;">File</a>
									</div>
									</c:if> --%>
								</div>

																<div class="form-group"></div>


								<div class="col-lg-12" align="center">


									<button type="submit" class="btn btn-primary"
										style="align-content: center; width: 226px; margin-left: 80px;">
										Submit</button>
								</div>
							</form>
							<p class="desc text-danger fontsize11">Note : Image size should not exceed 50kb.</p>
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
/* function validImage(){
	alert("here")
	  $('input[type=file][data-max-size]').each(function(){
          if(typeof this.files[0] !== 'undefined'){
              var maxSize = parseInt($(this).attr('max-size'),10),
              size = this.files[0].size;
              isOk = maxSize > size;
              return true;
          }else{
          	alert("File size exceed.")
          }
      });
} */
/* $(function(){
    $('form').submit(function(){
    	alert("Hii");
        var isOk = true;
        $('input[type=file][data-max-size]').each(function(){
            if(typeof this.files[0] !== 'undefined'){
                var maxSize = parseInt($(this).attr('max-size'),10),
                size = this.files[0].size;
                isOk = maxSize > size;
                return isOk;
            }else{
            	alert("File size exceed.")
            }
        });
        return isOk;
    });
}); */

$(function(){
    var fileInput = $('.upload-file');
    var maxSize = fileInput.data('max-size');
    $('.upload-form').submit(function(e){
        if(fileInput.get(0).files.length){
            var fileSize = fileInput.get(0).files[0].size; // in bytes
            if(fileSize>maxSize){
               // alert('file size is more then' + maxSize + ' bytes');
               alert('Attachment size exceeds the allowable limit')
                return false;
            }else{
               // alert('file size is correct- '+fileSize+' bytes');
            }
        }
        
    });
}); 
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
		function readURL2(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#image2').attr('src', e.target.result);
				}

				reader.readAsDataURL(input.files[0]);
			}
		}

		$("#imgInp1").change(function() {
			readURL2(this);
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
	//alert("workType " +workType)
	$('#rc_book_div').hide();
	$('#ins1_div').hide();
	$('#ins2_div').hide();
	$('#puc_div').hide();
	$('#bank_noc_div').hide();

	$('#add_pf_div').hide();

	$('#bank_letter_div').hide();
	$('#form_17_div').hide();
	document.getElementById('orig_lic_div').style.display = "flow-root";

}
	
else if(workType==6){
	//alert("workType " +workType)
	document.getElementById('bank_letter_div').style.display = "flow-root";
	document.getElementById('rc_book_div').style.display = "flow-root";
	document.getElementById('ins1_div').style.display = "flow-root";
	document.getElementById('ins2_div').style.display = "flow-root";
	document.getElementById('puc_div').style.display = "flow-root";
	
	$('#bank_noc_div').hide();

	$('#add_pf_div').hide();

	
	$('#form_17_div').hide();

		
	document.getElementById('fir_doc').innerText="FIR Document";
	document.getElementById('vehicle_info').innerText="Vehicle Info";
	
}

}
</script>
<script type="text/javascript">
function onLoadCall() {
	//alert("onload Call")
	var workType=${getWork.workTypeTd};
	//$('#workTypeId').prop('readoly', true);
	 //document.getElementById("pets").options[2].disabled = true;
	
	document.getElementById('workTypeId').disabled = false;
	document.getElementById('ac').style.color = 'white';
	
	document.getElementById('imgInp').style.color = 'white';
	document.getElementById('imgInp1').style.color = 'white';
	
	document.getElementById('rc_book').style.color = 'white';
	document.getElementById('puc').style.color = 'white';
	document.getElementById('ins1').style.color = 'white';
	document.getElementById('ins2').style.color = 'white';
	document.getElementById('add_proof').style.color = 'white';
	document.getElementById('bank_noc').style.color = 'white';
	document.getElementById('bank_letter').style.color = 'white';
	document.getElementById('form_no17').style.color = 'white';
	document.getElementById('orig_lic').style.color = 'white';
	

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

else if(workType==6){
	document.getElementById('fir_doc').innerText="FIR Document";
	document.getElementById('vehicle_info').innerText="Vehicle Info";

	document.getElementById('bank_letter_div').style.display = "flow-root";
	document.getElementById('rc_book_div').style.display = "flow-root";
	document.getElementById('ins1_div').style.display = "flow-root";
	document.getElementById('ins2_div').style.display = "flow-root";
	document.getElementById('puc_div').style.display = "flow-root";
	document.getElementById('add_pf_div').style = "display:none";

	document.getElementById('bank_noc_div').style = "display:none";

	document.getElementById('form_17_div').style = "display:none";
	document.getElementById('orig_lic_div').style = "display:none";
	
	
}

}

</script>

<script type="text/javascript">
  $(function() {
   
    	// document.getElementById('ac').style.color = 'black';
    	 var workType=${getWork.workTypeTd};
    	 if(workType!=null){
    	  $('#ac').change(function(){
    		  document.getElementById('ac').style.color = 'black';
    	  });
    	  
    	  $('#imgInp').change(function(){
    		  document.getElementById('imgInp').style.color = 'black';
    	  });
    	  
    	  $('#imgInp1').change(function(){
    		  document.getElementById('imgInp1').style.color = 'black';
    	  });
    	  
    	  $('#rc_book').change(function(){
    		  document.getElementById('rc_book').style.color = 'black';
    	  });
    	  
    	  $('#puc').change(function(){
    		  document.getElementById('puc').style.color = 'black';
    	  });
    	  
    	  $('#ins1').change(function(){
    		  document.getElementById('ins1').style.color = 'black';
    	  });
    	  
    	  $('#ins2').change(function(){
    		  document.getElementById('ins2').style.color = 'black';
    	  });
    	  
    	  $('#add_proof').change(function(){
    		  document.getElementById('add_proof').style.color = 'black';
    	  });
    	  
    	  $('#bank_noc').change(function(){
    		  document.getElementById('bank_noc').style.color = 'black';
    	  });
    	  
    	  
    	  $('#bank_letter').change(function(){
    		  document.getElementById('bank_letter').style.color = 'black';
    	  });
    	  
    	  
    	  $('#form_no17').change(function(){
    		  document.getElementById('form_no17').style.color = 'black';
    	  });
    	  
    	  $('#orig_lic').change(function(){
    		  document.getElementById('orig_lic').style.color = 'black';
    	  });
    	  
    	  
    	 }//end Of if
    	 
     
  });
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