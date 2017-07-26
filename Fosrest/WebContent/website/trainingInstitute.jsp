<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>

 <!-- <link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<link href="css/swipebox.css" rel="stylesheet">
<link href="css/owl.transitions.css" rel="stylesheet">
<link href="css/owl.carousel.css" rel="stylesheet">
<link href="css/monthly.css" rel="stylesheet"> -->




<!-- <section id="main-slider" class="no-margin">
  <div class="carousel slide">
    <div class="carousel-inner">
      <div class="item active header-bg" style="background-image: url(website/images/slider/bg1.jpg)">
        <div class="container">
          <div class="row slide-margin">
            <div class="col-sm-12">
              <div class="carousel-content">
                <h1 class="animation animated-item-1">Food Safety Regulatory Staff Training</h1>
                <h2 class="animation animated-item-2">
                  <a class="btn topbtn" href="login.fssai">Login</a>
                </h2>
              </div>
            </div>
            <div class="col-sm-6 hidden-xs animation animated-item-4">
              <div class="slider-img"> </div>
            </div>
            <div class="circle-wrap center-block">
              <ul>
                <li><a href="induction-training.html"><img src="website/images/induction.png"></a></li>
                <li><a href="refresher-training.html"><img src="website/images/refresher-training.png"></a></li>
                <li><a href="training-of-trainers.html"><img src="website/images/training-of-trainers.png"></a></li>
                <li><a href="specific-training.html"><img src="website/images/specific-training.png"></a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      /.item 
      
     
    </div>
    /.carousel-inner 
  </div>
  /.carousel 
</section> -->
<script>

	 function myFunction() {
		    var searchText = document.getElementById('myInput').value;
		    var targetTable = document.getElementById('datatablesfosrest');
		    var targetTableColCount;
		    for (var rowIndex = 0; rowIndex < targetTable.rows.length; rowIndex++) {
		        var rowData = '';

		        if (rowIndex == 0) {
		           targetTableColCount = targetTable.rows.item(rowIndex).cells.length;
		           continue;
		        }
		        for (var colIndex = 0; colIndex < targetTableColCount; colIndex++) {
		        	rowData += targetTable.rows.item(rowIndex).cells.item(colIndex).innerText.toLowerCase();
		        	 
		        }
		        if (rowData.toLowerCase().indexOf(searchText) == -1)
		            targetTable.rows.item(rowIndex).style.display = 'none';
		        else
		            targetTable.rows.item(rowIndex).style.display = 'table-row';
		    }
		}
</script>

<section>
  <div class="col-xs-12 " id="testt">
								<!-- table -->
								<div class="row">
									<div class="col-xs-12">
										
										
											<!-- <legend>State wise Training Institute</legend> --> 
											<div class="row">
                                            <h2>State Wise Training Institute</h2> 
                                            </div>
                                            
                                            <div>
                                            <span style="font-weight:bold;margin-left: 936px;">Search:</span>
                                            <input type="text" onkeyup="myFunction();this.value = this.value.toLowerCase();" id="myInput"  placeholder="Enter search text">
                                             </div>
                                             
									       <table id="datatablesfosrest"
													class="table table-bordered table-responsive">
													<thead>
														<tr class="background-open-vacancies">
															<th>S.No.</th>
															<th>State Name</th>
															 <th>Institute Name</th>
															 <th>Nodal Incharge Name</th>
															<th>Seating Capacity</th>
															<th>Address</th>
															<th>Contact No.</th>
															
														</tr>
													</thead>
													<ct:if test="${!empty trainingInstituteList}">
													<ct:forEach items="${trainingInstituteList}"
														var="trainingInstitute" varStatus="loop">
														<tr>
															<td>${loop.count}</td>
															 <td>${trainingInstitute[0]}</td>
														    <td>${trainingInstitute[1]}</td>
															<td>${trainingInstitute[3]}</td>
															<td>${trainingInstitute[2]}</td>
															<td>${trainingInstitute[4]},&nbsp${trainingInstitute[5]},&nbsp${trainingInstitute[6]},&nbsp${trainingInstitute[7]},&nbsp${trainingInstitute[0]}</td>
															<td>${trainingInstitute[8]}</td>
														</tr>
													</ct:forEach>
													</ct:if>
												</table>
											<ct:if test="${empty trainingInstituteList}">
											No Records Available.
											</ct:if>
										
										</div>
										
								</div>
								
						</div>
						
</section> 
