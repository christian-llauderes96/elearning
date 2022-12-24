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
              <?php
                $qry1 = $conn->query("SELECT * FROM tblexams WHERE subject='$row[subject_code]'");
                if($qry1->num_rows > 0):
                $data = $qry1->fetch_assoc();
              ?>
              <div class="d-flex justify-content-between">
                <form action="./?page=exam/take-exam" method="POST">
                  <input type="hidden" name="examID" value="<?=$data['exam_id']?>">
                  <button type="submit" class="btn btn-success" name="btn_take_exam">Take Exam</button>
                </form>
                <!-- <a href="./?page=exam/take-exam" class="btn btn-success">Take Exam</a> -->
                <h4><?=$data['items']?> Items</h4>
              </div>
              <?php
                endif;
              ?>
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