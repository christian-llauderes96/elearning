<?php
	$path = "../uploads/generated_exams/$academic_year_id/$examData[faculty]/$examData[subject]";
	if(!is_dir($path)){
		echo "hindi pasok";
		//$getExam = $conn->query("");
	}
	$exam_db_answer = $examData['answer_key'];
	// $json_answers = file_get_contents($exam_db_answer);
	$json_choices = file_get_contents($path."/choices.json");
	$json_questions = file_get_contents($path."/questions.json");

	if ($json_questions === false) {
	    // deal with error...
	    echo "something went wrong";
	}

	$answers = json_decode($exam_db_answer, true);
	$choices = json_decode($json_choices, true);
	$questions = json_decode($json_questions, true);
	
	// $answers = json_decode($path."/answers.json");

	for ($i=0; $i < sizeof($answers); $i++){
		?>
			<div class="carousel-item <?=(($i==0)?'active':'')?>">
                <div class="question bg-white p-3">
                  <div class="d-flex flex-row align-items-center question-title">
                    <h3 class="text-danger">Q.</h3>
                    <h5 class="mt-1 ml-2"><?=$questions[$i]?></h5>
                  </div>
                  <div class="ans ml-2">
                    <label class="radio">
                      <input type="radio" name="ask<?=$i?>" value="a" class="q1q1" required> <span><?=$choices[$i+1][0]?></span>
                    </label>    
                  </div>
                  <div class="ans ml-2">
                    <label class="radio"> 
                      <input type="radio" name="ask<?=$i?>" value="b" class="q1q1" required> <span><?=$choices[$i+1][1]?></span>
                    </label>    
                  </div>
                  <div class="ans ml-2">
                    <label class="radio"> 
                      <input type="radio" name="ask<?=$i?>" value="c" class="q1q1" required> <span><?=$choices[$i+1][2]?></span>
                    </label>    
                  </div>
                  <div class="ans ml-2">
                    <label class="radio">
                      <input type="radio" name="ask<?=$i?>" value="d" class="q1q1" required> <span><?=$choices[$i+1][3]?></span>
                    </label>    
                  </div>
                </div>
            </div>
		
		<?php
	}
