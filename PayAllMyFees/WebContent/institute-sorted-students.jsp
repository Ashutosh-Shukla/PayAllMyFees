<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<%@include file="user-header.jsp"%>
<div class="container">
	<div class="sidebar"></div>
	<div class="midcontent clear" role="main" style="margin-top: 10px;">
		<div class="page-header text-center" style="margin-top: 0px;">
			<h3>My Institutions</h3>
		</div>
		<s:iterator status="stat" value="%{#session.instituteSortedStudentList}">
			<div class="highlight" style="padding: 0px; overflow:hidden">
				<div class="panel-heading">
					<h3>
						<s:property value="value[0].instituteBean.InstituteName" />
					</h3>
					<s:set var="instituteStatus" value="value[0].instituteBean.isActive"/>
					<s:if test="%{#instituteStatus==0}">
						<div class="alert alert-warning pmf_txt_center" role="alert">
							This institution is temporarily unavailable on our platform
						</div>
					</s:if>
				</div>
				<div class="accordion panel-group"
					id="accordion<s:property value="value[0].instituteBean.InstituteId" />">
					<s:iterator value="value" var="student">
						<div class="accordion-group">
							<div class="">
								<div class="panel panel-default" style="width: 95%; margin:5px auto;">
									<div class="accordion-heading panel-heading" style="overflow:hidden;">
										<a class="accordion-toggle" data-toggle="collapse"
											href="#collapse<s:property value="studentId"/>">

											<div class="panel-title col-sm-6">
												<label> 
												<s:property value="FirstName" />&nbsp;<s:property
														value="LastName" />
												</label>
											</div>


											<div class="col-sm-6">
												<s:set var="instituteStatus" value="instituteBean.isActive"/>
												<s:if test="%{#instituteStatus==1}">
													<button type="button" class="btn btn-primary nofity" 
															data-toggle="modal" data-backdrop="static" 
															data-keyboard="false" onclick="shownotification(<s:property value="studentId"/>);" 
															data-target="#notification">
														Notification
													</button>
												</s:if>
												<s:else>
													<button type="button" class="btn btn-primary nofity disabled" 
															data-toggle="modal" data-backdrop="static" 
															data-keyboard="false" onclick="shownotification(<s:property value="studentId"/>);" 
															data-target="#notification">
														Notification
													</button>
												</s:else>
											</div>

										</a>

									</div>
									<div id="collapse<s:property value="studentId"/>"
										class="accordion-body collapse in">
										<div class="accordion-inner">
											<div class="panel-body">
												<div class="row">
													<div class="col-sm-6">
														<div class="col-sm-6">
															<label>Date of birth </label>
														</div>
														<div class="col-sm-6">
															<s:property value="dateOfBirth" />
														</div>
													</div>
													<div class="col-sm-6">
														<div class="col-sm-6"><label>Institution Name</label>
																</div>
														<div class="col-sm-6">	
																
																 <s:property
																value="instituteBean.InstituteName" />
													</div>
													</div>
												</div>
												<div class="row">
													<div class="col-sm-6">
														<div class="col-sm-6">
															<label>Institution Address </label>
														</div>
														<div class="col-sm-6">
															<s:property value="instituteBean.InstituteAddress" />
														</div>
													</div>
													<div class="col-sm-6">
														<div class="col-sm-6">
															
															<label>Institution Contact NO.</label>
														</div>
															 <div class="col-sm-6"><s:property
																	value="instituteBean.contactNo" />
															</div>
														</div>
													
												</div>
												<div class="row">
													<div class="col-sm-6">
														<div class="col-sm-6">
															<label>Institution Email </label>
														</div>
														<div class="col-sm-6">
															<s:property value="instituteBean.InstituteEmail" />
														</div>
													</div>
													<div class="col-sm-6">
														<div class="col-sm-6">
															<label>Fees due</label>
														</div>
														<div class="col-sm-6">
															<s:property value="feeAmountDue" />
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-sm-6">
														<div class="col-sm-6">
															<label>Due Date</label>
														</div>
														<div class="col-sm-6">
															<s:property value="dueDate" />
														</div>
													</div>
													<div class="col-sm-6">
														<div class="col-sm-6">
															<label>Fees Paid</label>
														</div>
														<div class="col-sm-6">
															<s:property value="FeePaid" />
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-sm-6">
														<div class="col-sm-6">
															<label>Late Fees</label>
														</div>
														<div class="col-sm-6">
															<s:property value="lateFeeAmount" />
														</div>
													</div>
												</div>


												<hr>
												<s:form action="paymentinfo" method="post"
													cssStyle="padding-left: 14px; width: 76px; float: left;">


													<s:textfield name="studentId" id="studentId" type="hidden"
														value="%{#student.studentId}"></s:textfield>
													<s:textfield name="test" type="hidden" value="5"></s:textfield>
													<s:set var="instituteStatus" value="instituteBean.isActive"/>
													<s:if test="%{#instituteStatus==1}">
														<s:submit cssClass="btn btn-primary" cssStyle="float:right;" value="Pay Fees"></s:submit>
													</s:if>
													<s:else>
														<s:submit cssClass="btn btn-primary disabled" cssStyle="float:right;" value="Pay Fees"></s:submit>
													</s:else>
												</s:form>
										
												<s:set var="instituteStatus" value="instituteBean.isActive"/>
												<s:if test="%{#instituteStatus==1}">
													<button type="button" class="btn btn-primary"
														style="float: right;" data-toggle="modal"
														data-backdrop="static" data-keyboard="false"
														onclick="showresult(<s:property value="studentId"/>);"
														data-target="#result">Check Result</button>
												</s:if>
												<s:else>
													<button type="button" class="btn btn-primary disabled"
														style="float: right;" data-toggle="modal"
														data-backdrop="static" data-keyboard="false"
														onclick="showresult(<s:property value="studentId"/>);"
														data-target="#result">Check Result</button>
												</s:else>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<script>
			$('#collapse<s:property value="studentId"/>').collapse({
		  	toggle: true
				});
	</script>
						<div style="margin-bottom: 20px;"></div>

					</s:iterator>
				</div>
			</div>
			<script type="text/javascript">
		$(function () {
		$('#accordion<s:property value="value[0].instituteBean.InstituteId" />').on('show.bs.collapse', function () {
		    if (active) $('#accordion<s:property value="value[0].instituteBean.InstituteId" /> .in').collapse('hide');
		});
		});
		</script>
			<div style="margin-bottom: 40px;"></div>
		</s:iterator>

	</div>
	<!-- result page Start -->

	<div class="modal fade" id="result">
		<div class="modal-dailog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">Result</h4>
				</div>
				<div class="modal-body">
					<div class="midsection">
						<div id="example_wrapper"
							class="dataTables_wrapper form-inline dt-bootstrap">

							<div class="row">
								<div class="col-sm-12 table-responsive">
									<table id="example"
										class="table table-striped table-bordered dataTable"
										cellspacing="0" width="100%" role="grid"
										aria-describedby="example_info" style="width: 100%;">
										<thead>
											<tr role="row">
												<th class="sorting_asc" tabindex="0" aria-controls="example"
													rowspan="1" colspan="1"
													aria-label="Sr No: activate to sort column descending"
													style="width: 136px;" aria-sort="ascending">Sr No</th>
												<th class="sorting" tabindex="0" aria-controls="example"
													rowspan="1" colspan="1"
													aria-label="ResultId: activate to sort column ascending"
													style="width: 215px;">ResultId</th>
												<th class="sorting" tabindex="0" aria-controls="example"
													rowspan="1" colspan="1"
													aria-label="Name: activate to sort column ascending"
													style="width: 215px;">Result</th>
												<th class="sorting" tabindex="0" aria-controls="example"
													rowspan="1" colspan="1"
													aria-label="School: activate to sort column ascending"
													style="width: 98px;">Result Link</th>
											</tr>
										</thead>

										<!-- <tfoot>
								<tr>
									<th rowspan="1" colspan="1">Sr No</th>
									<th rowspan="1" colspan="1">ResultId</th>
									<th rowspan="1" colspan="1">Result</th>
									<th rowspan="1" colspan="1">Result Link</th>
								</tr>
							</tfoot> -->

										<tbody id="result-tbody">
										</tbody>
									</table>
								</div>
							</div>
						</div>

						<div class="clear"></div>

						<!-- Main component for a primary marketing message or call to action -->
						<!-- /container -->
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success" data-dismiss="modal">Done</button>
				</div>
			</div>
		</div>
	</div>



	<!-- result page End -->


	<!-- Notification Page starts -->


	<div class="modal fade" id="notification">
		<div class="modal-dailog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">Notifications</h4>
				</div>
				<div class="modal-body">
					<div class="midsection">
						<div id="example_wrapper"
							class="dataTables_wrapper form-inline dt-bootstrap">

							<div class="row">
								<div class="col-sm-12 table-responsive">
									<table id="example"
										class="table table-striped table-bordered dataTable"
										cellspacing="0" width="100%" role="grid"
										aria-describedby="example_info" style="width: 100%;">
										<thead>
											<tr role="row">
												<th class="sorting_asc" tabindex="0" aria-controls="example"
													rowspan="1" colspan="1"
													aria-label="Sr No: activate to sort column descending"
													style="width: 136px;" aria-sort="ascending">Sr No</th>
												<th class="sorting" tabindex="0" aria-controls="example"
													rowspan="1" colspan="1"
													aria-label="ResultId: activate to sort column ascending"
													style="width: 215px;">Message</th>
												<th class="sorting" tabindex="0" aria-controls="example"
													rowspan="1" colspan="1"
													aria-label="Name: activate to sort column ascending"
													style="width: 215px;">Date</th>
											</tr>
										</thead>

										<!-- <tfoot>
								<tr>
									<th rowspan="1" colspan="1">Sr No</th>
									<th rowspan="1" colspan="1">ResultId</th>
									<th rowspan="1" colspan="1">Result</th>
									<th rowspan="1" colspan="1">Result Link</th>
								</tr>
							</tfoot> -->

										<tbody id="notification-tbody">
										</tbody>
									</table>
								</div>
							</div>
						</div>

						<div class="clear"></div>

						<!-- Main component for a primary marketing message or call to action -->
						<!-- /container -->
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success" data-dismiss="modal">Done</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Notification Page starts -->
	<%@include file="footer.jsp"%>
	<!-- Main component for a primary marketing message or call to action -->


</div>
<!-- /container -->


<!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="js/ie10-viewport-bug-workaround.js"></script>
<script>

//window.setInterval("actionCounter()",10000);

function setActionCounter(response){
       
		if (ajaxRequest.readyState==4 && ajaxRequest.status==200)
   	{
   		var res = ajaxRequest.responseText;
   		if(res>0)
   			res = ("+"+res);
			var element = document.getElementById("result-tbody");
			element.innerHTML = res;
		}	
}	

function payfees(id) {
	document.forms[0].action = "paymentinfo?studentId=" +id;
	document.forms[0].submit();
}

function showresult(id){
	//var id = document.getElementById("studentId").value;
	var url = "student-result?studentId=" +id;
	ajaxRequest=new XMLHttpRequest();
	ajaxRequest.open("POST",url,true);
	ajaxRequest.send();
	ajaxRequest.onreadystatechange = setActionCounter;
}

function shownotification(id){
	var url = "showNotification?studentId=" +id;
	ajaxRequest=new XMLHttpRequest();
	ajaxRequest.open("POST",url,true);
	ajaxRequest.send();
	ajaxRequest.onreadystatechange = setActionCounterNotification;
}

function setActionCounterNotification(response){
    
	if (ajaxRequest.readyState==4 && ajaxRequest.status==200)
	{
		var res = ajaxRequest.responseText;
		if(res>0)
			res = ("+"+res);
		var element = document.getElementById("notification-tbody");
		element.innerHTML = res;
	}	
}
$(function () {
var options = {
	    "backdrop" : "static"
	}
$('#basicModal').modal(options);


});
</script>
</body>
</html>