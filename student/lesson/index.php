<?php if($_settings->chk_flashdata('success')): ?>
<script>
	alert_toast("<?php echo $_settings->flashdata('success') ?>",'success')
</script>
<?php endif; ?>

<div id="accordion">
	<?php
	$academic_year_id= $_settings->userdata('academic_id');
	$student_id= $_settings->userdata('student_id');
	$class_id = $conn->query("SELECT * FROM student_class where academic_year_id = {$academic_year_id} and student_id = '{$student_id}' ");
	if($class_id->num_rows > 0):
	$class_id = $class_id->fetch_array()['class_id'];
	$qry = $conn->query("SELECT l.*,s.subject_code,s.description FROM lessons l inner join subjects s on s.id = l.subject_id where l.academic_year_id = '{$academic_year_id}' and l.id in (SELECT lesson_id from lesson_class where class_id = '{$class_id}') GROUP BY s.subject_code");
	$nums = 0;
	while($row=$qry->fetch_assoc()):
		$nums++;
	?>
  	<div class="card mb-1">
	    <div class="card-header" id="heading<?=$nums?>">
	      	<h5 class="mb-0">
	        	<button class="btn btn-link" data-toggle="collapse" data-target="#collapse<?=$nums?>" aria-expanded="true" aria-controls="collapse<?=$nums?>">
	          		<?=strtoupper($row['description'])?>
	        	</button>
	      	</h5>
	    </div>

    	<div id="collapse<?=$nums?>" class="collapse" aria-labelledby="heading<?=$nums?>" data-parent="#accordion">
	      	<div class="card-body">
	      		<div class="table-responsive">
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
								<th>Title</th>
								<th>Subject</th>
								<th>Description</th>
								<th>Posted</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<?php 
							$i =1;
							
							$qry1 = $conn->query("SELECT l.*,s.subject_code FROM lessons l inner join subjects s on s.id = l.subject_id WHERE l.academic_year_id = '{$academic_year_id}' AND l.id in (SELECT lesson_id from lesson_class where class_id = '{$class_id}') AND s.subject_code='$row[subject_code]'");

							while($data=$qry1->fetch_assoc()){
								$desc = html_entity_decode($data['description']);
								$desc = stripslashes($desc);
								$desc = strip_tags($desc);
							?>
							
							<tr>
								<td><?php echo $i++ ?></td>
								<td><?php echo $data['title'] ?></td>
								<td><?php echo $data['subject_code'] ?></td>
								<td><span class="truncate"><?php echo $desc ?></span></td>
								<td><?=date('Y-m-d', strtotime($row['date_created']))?></td>
								<td class="text-center">
									<div class="btn-group">
					                    <button type="button" class="btn btn-default btn-block btn-flat dropdown-toggle dropdown-hover dropdown-icon" data-toggle="dropdown" aria-expanded="false">
					                    	Action
					                      <span class="sr-only">Toggle Dropdown</span>
					                    </button>
					                    <div class="dropdown-menu" role="menu" style="">
				                    	 <a class="dropdown-item action_load" href="./?page=lesson/view_lesson&id=<?php echo $data['id'] ?>">View Lesson</a>
					                    </div>
					                </div>
								</td>	
							</tr>
							<?php } ?>
						</tbody>
					</table>
				</div>
	      	</div>
    	</div>
  	</div>

<?php endwhile; endif; ?>

  
</div>
<!-- END ACCORDION -->

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
</script>