<?php if($_settings->chk_flashdata('success')): ?>
<script>
	alert_toast("<?php echo $_settings->flashdata('success') ?>",'success')
</script>
<?php endif; ?>
<div id="accordion">
<?php 
$ii =1;
$academic_year_id= $_settings->userdata('academic_id');
$faculty_id= $_settings->userdata('faculty_id');
$fid= $_settings->userdata('id');

$qry = $conn->query("SELECT l.*,s.subject_code,s.description as subdes FROM lessons l inner join subjects s on s.id = l.subject_id where l.academic_year_id = '{$academic_year_id}' and l.faculty_id = '{$faculty_id}' GROUP BY s.subject_code ORDER BY s.subject_code ASC");
while($row=$qry->fetch_assoc()):
	$ii++;
	$desc = html_entity_decode($row['description']);
	$desc = stripslashes($desc);
	$desc = strip_tags($desc);
?>

<div class="card mb-1">
	    <div class="card-header" id="heading<?=$ii?>">
	      	<h5 class="mb-0">
	      		<input type="hidden" value="<?=$row['subject_code']?>">
	        	<button class="btn btn-link accords" data-toggle="collapse" data-target="#collapse<?=$ii?>" aria-expanded="true" aria-controls="collapse<?=$ii?>">
	          		<?=strtoupper($row['subdes'])?>
	        	</button>
	      	</h5>
	    </div>

    	<div id="collapse<?=$ii?>" class="collapse" aria-labelledby="heading<?=$ii?>" data-parent="#accordion">
	      	<div class="card-body">
	      		<div class="table-responsive">
	      			<!-- <button type="button" class="btn btn-secondary my-4">Create Exam</button> -->
	      			<!-- Button trigger modal -->
			      	<?php
			      		$qrySub = $conn->query("SELECT * FROM tblexams WHERE faculty='$faculty_id' AND subject='$row[subject_code]'");
			      		if($qrySub->num_rows <= 0):
			      	?>
							<button type="button" class="btn btn-secondary my-4" data-toggle="modal" data-target="#createExam">
							  	Create Exam
							</button>
						<?php endif;?>
		        	<table class="table table-bordered table-compact table-stripped">
								<colgroup>
									<col width="5%">
									<col width="20%">
									<col width="20%">
									<col width="30%">
									<col width="10%">
									<col width="15%">
								</colgroup>
								<thead>
									<tr>
										<th>#</th>
										<th>Subject</th>
										<th>Title</th>
										<th class="text-center"># of<br>Items</th>
										<th>Posted</th>
										<th class="text-center">Action</th>
									</tr>
								</thead>
								<tbody>
									<?php
										$i=0;
										$academic_year_id= $_settings->userdata('academic_id');
										while($rows=$qrySub->fetch_assoc()):
											$i++;
									?>
									<tr>
										<td><?=$i?></td>
										<td><?=$rows['subject']?></td>
										<td><?=strtoupper($rows['exam_title'])?></td>
										<td class="text-center"><?=$rows['items']?></td>
										<td><?=$rows['date_created']?></td>
										<td class="text-center">---</td>
									</tr>
									<?php endwhile; ?>
								</tbody>
							</table>
						</div>
	      	</div>
    	</div>
  	</div>
<?php endwhile; ?>
</div>
<!-- END ACCORDION -->
<div class="card card-outline cardprimary w-fluid">
	<div class="card-header">
		<div class="text-center"><h2>STUDENTS SCORE</h2></div>
	<div class="card-body">
		<table class="table table-bordered table-compact table-stripped">
			<colgroup>
				<col width="5%">
				<col width="20%">
				<col width="20%">
				<col width="25%">
				<col width="10%">
				<col width="5%">
				<col width="15%">
			</colgroup>
			<thead>
			
				<tr>
					<th>#</th>
					<th>Name</th>
					<th>Section</th>
					<th>Subject</th>
					<th>Date</th>
					<th class="text-center"># of<br>items</th>
					<th>Score</th>
				</tr>
			</thead>
			<tbody>
				<?php 
				$i =1;
				$academic_year_id= $_settings->userdata('academic_id');

				$qry = $conn->query("SELECT *,concat(b.lastname,', ',b.firstname,' ',b.middlename) as names,c.section as st_section 
					FROM tblscores a 
					INNER JOIN students b ON a.student_id=b.student_id 
					INNER JOIN class c ON a.section=c.id WHERE faculty='$faculty_id'");
				while($row=$qry->fetch_assoc()):
				?>	
				<tr>
					<td><?php echo $i++ ?></td>
					<td><?php echo strtoupper($row['names']) ?></td>
					<td><?php echo $row['st_section'] ?></td>
					<td><?php echo $row['subject_code'] ?></td>
					<td><?=date('Y-m-d', strtotime($row['date_applied']))?></td>
					<td class="text-center">
						<?php echo $row['items'] ?>
					</td>	
					<td class="text-center">
						<?php echo $row['score'] ?>
					</td>	
				</tr>
				<?php endwhile; ?>
			</tbody>
		</table>
	</div>
</div>


<!-- Modal -->
<div class="modal fade" id="createExam" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    	<form action="<?php echo base_url ?>faculty/?page=exam/generate-exam" method="POST">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Create Exam for<br><label id="accordsModal"></label></h5>
	        <input id="subjectCode" type="hidden" name="subjectCode" value="">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      	<div class="modal-body">
	      		<input type="hidden" name="subjCode" value="">
	      		<label for="title">Title</label>
		    		<input id="title" class="form-control" type="text" name="title">
		    		<label for="items">Number of Items</label>
		    		<input id="items" class="form-control" type="number" name="items">
	      	</div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="submit" class="btn btn-primary" name="btn_generate">Generate Exam</button>
	      </div>
      </form>
    </div>
  </div>
</div>
<script>
	$(document).ready(function(){
		$('.new_lesson').click(function(){
			location.href = "./?page=lesson/manage_lesson";
		})
		$('.action_edit').click(function(){
			uni_modal("Edit lesson","./lesson/manage_lesson.php?id="+$(this).attr('data-id'));
		})
	
		$('.action_delete').click(function(){
		_conf("Are you sure to delete lesson?","delete_lesson",[$(this).attr('data-id')])
		})
		$('table').dataTable();
	})
	function delete_lesson($id){
		start_loader()
		$.ajax({
			url:_base_url_+'lessones/Master.php?f=delete_lesson',
			method:'POST',
			data:{id:$id},
			success:function(resp){
				if(resp==1){
					location.reload()
				}
			}
		})
	}
	$(".accords").click(function() {
		$("#accordsModal").text($(this).text());
		let subCode = $(this).parent().find('input').val();
		$("#subjectCode").val(subCode);
	});
</script>