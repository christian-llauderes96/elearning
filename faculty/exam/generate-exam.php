<?php if($_settings->chk_flashdata('success')): ?>
<script>
	alert_toast("<?php echo $_settings->flashdata('success') ?>",'success')
</script>
<?php endif; ?>
<?php
	if(isset($_POST['btn_generate'])){
		$title = mysqli_real_escape_string($conn, $_POST['title']);
		$items = mysqli_real_escape_string($conn, $_POST['items']);
		$subjectCode = mysqli_real_escape_string($conn, $_POST['subjectCode']);
		$num=0;

		echo "<div id='cardGenerate' class='card'>
				<div class='card-body'>
					<form id='formCreateExam' action='".base_url."faculty/?page=exam/save' method='POST'>
					<input type='hidden' name='subjectCode' value='$subjectCode'>
					<input type='hidden' name='title' value='$title'>
					<input type='hidden' name='items' value='$items'>
					<div class='text-center px-4 mx-4'>
						<h3 class='text-uppercase'>$title</h3>
					</div>
					<hr>";
		while($num < $items):
			$num++;
			?>
			<div class="row">
				<label>Question:&nbsp;<?=$num?></label>
				<input type="text" name="questions[]" class="form-control" placeholder="Question #<?=$num?>" required>
			</div>	
			<div class="row ml-3">
				<div class="col-sm-6">
					<label class="fw-bold">Choices/ Options</label>
					<input type="text" name="choices[<?=$num?>][]" class="form-control" placeholder="Choice 1" required>
					<input type="text" name="choices[<?=$num?>][]" class="form-control" placeholder="Choice 2" required>
					<input type="text" name="choices[<?=$num?>][]" class="form-control" placeholder="Choice 3" required>
					<input type="text" name="choices[<?=$num?>][]" class="form-control" placeholder="Choice 4" required>
				</div>
				<div class="col-sm-6">
					<label for="ans<?=$num?>" class="text-danger">Answer</label>
					<select name="answers[]" class="form-control" required>
						<option value="">Select Answer</option>
						<option value="a">A</option>
						<option value="b">B</option>
						<option value="c">C</option>
						<option value="d">D</option>
					</select>
				</div>
			</div>
			<hr>
			<?php
		endwhile;
		echo "<div class='text-center'>
				<button type='submit' class='btn btn-success' name='btn_create_exam'>Create Exam</button>
				</div>
				</form>
			</div>
		</div>";
	}
?>

<script type="text/javascript">
	// $("#formCreateExam").submit(function(e) {
	// 	e.preventDefault();
	// });
</script>

