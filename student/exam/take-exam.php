<?php if($_settings->chk_flashdata('success')): ?>
<script>
  alert_toast("<?php echo $_settings->flashdata('success') ?>",'success')
</script>
<?php endif; ?>
<?php
	$academic_year_id= $_settings->userdata('academic_id');
  	$student_id= $_settings->userdata('student_id');

  	$class_id = $conn->query("SELECT * FROM student_class where academic_year_id = {$academic_year_id} and student_id = '{$student_id}' ");
  	if($class_id->num_rows > 0):

	  	$class_id = $class_id->fetch_array()['class_id'];

	  	$qry = $conn->query("SELECT l.*,s.subject_code,s.description FROM lessons l inner join subjects s on s.id = l.subject_id where l.academic_year_id = '{$academic_year_id}' and l.id in (SELECT lesson_id from lesson_class where class_id = '{$class_id}') GROUP BY s.subject_code");
	  	if(isset($_POST['btn_take_exam'])){

	  		$examID = trim(mysqli_real_escape_string($conn, $_POST['examID']));
	  		$exams = $conn->query("SELECT * FROM tblexams WHERE exam_id=$examID");

	  		if($exams->num_rows > 0):
	  			$examData = $exams->fetch_assoc();
	  			include_once('exam-template.php');
	  		endif;
	  	}
		

	endif;