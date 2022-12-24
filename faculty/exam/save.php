<?php if($_settings->chk_flashdata('success')): ?>
<script>
	alert_toast("<?php echo $_settings->flashdata('success') ?>",'success')
</script>
<?php endif; ?>

<?php

	$academic_year_id= $_settings->userdata('academic_id');
	$faculty_id= $_settings->userdata('faculty_id');
	$facultyName = strtoupper($_settings->userdata('lastname').', '.$_settings->userdata('firstname').' '.$_settings->userdata('middlename'));

	if(isset($_POST['btn_create_exam'])){
		$subjectCode = mysqli_real_escape_string($conn, $_POST['subjectCode']);
		$title = mysqli_real_escape_string($conn, $_POST['title']);
		$items = mysqli_real_escape_string($conn, $_POST['items']);
		
	 	$path = "../uploads/generated_exams/$academic_year_id/$faculty_id/$subjectCode";
	 	
		
		//convert array to json
		$questions = json_encode($_POST['questions']);
		$choices = json_encode($_POST['choices']);
		$answers = json_encode($_POST['answers']);
		
		//check if directory exist and creat if dont exist
		if(!is_dir($path)){
            if(!mkdir($path,0700,true)){
            	echo "Oops! Error creating exam...<br>";
            	echo '<a href="'.base_url.'faculty/?page=exam" class="btn btn-primar">Go Back</a>';
            	exit();
            }
        }
        //save json file
        $answer_key = $answers;

        // exit();
        $query = $conn->query("INSERT INTO tblexams(`faculty`,`exam_title`,`subject`,`items`,answer_key)
        			VALUES('$faculty_id','$title','$subjectCode','$items','$answer_key');");
        if($query){
        	if (file_put_contents($path."/questions.json", $questions) && 
				file_put_contents($path."/choices.json", $choices)){
        		echo "Exam created successfully...<br>";
        		echo '<a href="'.base_url.'faculty/?page=exam" class="btn btn-primar">Go Back</a>';
        	}
			else{
			    echo "Oops! Error creating exam...<br>";
				echo '<a href="'.base_url.'faculty/?page=exam" class="btn btn-primar">Try Again</a>';
			} 
        }
	}
