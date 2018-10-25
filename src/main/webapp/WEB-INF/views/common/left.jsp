
<aside id="left-panel" class="left-panel">
	<nav class="navbar navbar-expand-sm navbar-default">

		<div class="navbar-header">
			<button class="navbar-toggler" type="button" data-toggle="collapse"user
				data-target="#main-menu" aria-controls="main-menu"
				aria-expanded="false" aria-label="Toggle navigation">
				<i class="fa fa-bars"></i>
			</button>
			<a class="navbar-brand" href="./getLogin"> RTO Admin </a> <a
				class="navbar-brand hidden" href="./"> </a>
		</div>

		<div id="main-menu" class="main-menu collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a href="${pageContext.request.contextPath}/home"> <i
						class="menu-icon fa fa-dashboard"></i> Dashboard
				</a></li>

				<!--                     <h3 class="menu-title">UI elements</h3>/.menu-title
 -->
				<li class="menu-item-has-children dropdown"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="true"> <i class="menu-icon fa fa-table"></i>
						Masters
				</a>
					<ul class="sub-menu children dropdown-menu ">
						<li class="active"><i class="fa fa-plus-square"></i><a
							href="${pageContext.request.contextPath}/showAddUser">Add
								User</a></li>


						<li class="active"><i class="fa fa-plus-square"></i><a
							href="${pageContext.request.contextPath}/showAddCustomer">Add
								Customer</a></li>

						<%-- <li class="active"><i class="fa fa-puzzle-piece"></i><a
							href="${pageContext.request.contextPath}/showAddWorkType">Add
								WorkType</a></li> --%>
					</ul></li>

				<li class="menu-item-has-children dropdown"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="true"> <i class="menu-icon fa fa-table"></i>
						Work
				</a>
					<ul class="sub-menu children dropdown-menu ">

						<li class="active"><i class="fa fa-plus-square"></i><a
							href="${pageContext.request.contextPath}/showAddWorkHeader">Add
								Work</a></li>

						<li class="active"><i class="fa fa-eye"></i><a
							href="${pageContext.request.contextPath}/showWorkHeadList">
								View Added Work</a></li>




					</ul></li>


				<li class="menu-item-has-children dropdown"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="true"> <i class="menu-icon fa fa-table"></i>
						Update Status Work
				</a>
					<ul class="sub-menu children dropdown-menu ">


						<li class="active"><i class="fa fa-money"></i><a
							href="${pageContext.request.contextPath}/showWorkList">Add
								Work Cost</a></li>

						<li class="active"><i class="fa  fa-pencil-square-o"></i><a
							href="${pageContext.request.contextPath}/showUpdatePayment">Update
								Payment</a></li>

						<li class="active"><i class="fa fa-users"></i><a
							href="${pageContext.request.contextPath}/showUserAllocation">User
								Allocation</a></li>

						<li class="active"><i class="fa fa-book"></i><a
							href="${pageContext.request.contextPath}/showDocInOffice">
								Doc Submit to Office</a></li>

						<li class="active"><i class="fa fa-book"></i><a
							href="${pageContext.request.contextPath}/showDocSubmitAtRto">
								Doc Submit to RTO</a></li>

						<li class="active"><i class="fa fa-book"></i><a
							href="${pageContext.request.contextPath}/showActualDocToCust">
								Doc Handover</a></li>



					</ul></li>



				<li class="menu-item-has-children dropdown"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="true"> <i class="menu-icon fa fa-table"></i>
						Reports
				</a>
					<ul class="sub-menu children dropdown-menu ">
						<li class="active"><i class="fa fa-file-text"></i><a
							href="${pageContext.request.contextPath}/showReportStatuswise">Enquirywise
								Report </a></li>


						<li class="active"><i class="fa fa-file-text"></i><a
							href="${pageContext.request.contextPath}/showReportWorktypewise">Worktypewise
								Report</a></li>

						<li class="active"><i class="fa fa-file-text"></i><a
							href="${pageContext.request.contextPath}/showReportUserwise">Userwise
								Report</a></li>
					</ul></li>


				<li class="menu-item-has-children dropdown"><a
					href="${pageContext.request.contextPath}/editMyProfile/1"> <i
						class="menu-icon fa fa-user"></i> My Profile
				</a></li>



				<%-- 	
				<li class="menu-item-has-children dropdown"><a
					href="${pageContext.request.contextPath}/editHubUser/1"> <i
						class="menu-icon fa fa-table"></i> <spring:message
							code="label.userProfile" />
				</a></li> --%>

				<%-- 	<li class="menu-item-has-children dropdown"><a
					href="${pageContext.request.contextPath}/editHubUser/1"
					class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="true"> <i class="menu-icon fa fa-table"></i> <spring:message
							code="label.userProfile" /> --%>
				</a>
				<%-- 	 --%>
			</ul>

		</div>
		<!-- /.navbar-collapse -->
	</nav>
</aside>
<!-- /#left-panel -->

<!-- Left Panel -->

