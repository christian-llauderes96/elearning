<style type="text/css">
  label.radio {
  cursor: pointer;
}

label.radio input {
  position: absolute;
  top: 0; 
  left: 0;
  visibility: hidden;
  pointer-events: none;
}

label.radio span {
  padding: 4px 0px;
  border: 1px solid red;
  display: inline-block;
  color: red;
  width: 210px;
  text-align: center;
  border-radius: 3px;
  margin-top: 7px;
  text-transform: uppercase;
}

label.radio input:checked + span {
  border-color: red;
  background-color: red;
  color: #fff;
}

.ans {
  margin-left: 36px !important;
}

.btn:focus {
  outline: 0 !important;
  box-shadow: none !important;
}

.btn:active {
  outline: 0 !important;
  box-shadow: none !important;
}

</style>

<div class="d-flex justify-content-center">
  <div class="col-sm-10">
    <div class="alert alert-info text-center">
      <h4><?=$examData['exam_title']?></h4>
    </div>
    <!-- DITO magstart ng clone -->
    
    <div class="card" style="min-height: 590px;">

      <div class="card-header">
        <div class="d-flex justify-content-between">
          <h3 id="exam-title" class="my-auto"><?=$examData['subject']?></h3>
          <label id="exam-items" class="my-auto">1/2</label>
        </div>
      </div>
      <div class="card-body">
        <div id="carouselExams" class="carousel slide" data-interval="false" data-wrap="false">
          <div class="carousel-inner">
            <form id="exam-form" action="#" method="POST">
              <input id="exam_id" type="hidden" name="exam_id" value="<?=$examData['exam_id']?>">
              <input id="std_id" type="hidden" name="std_id" value="<?=$student_id?>">
              <input id="section" type="hidden" name="section" value="<?=$class_id?>">
              <input id="sub_code" type="hidden" name="sub_code" value="<?=$examData['subject']?>">
              <input id="faculty" type="hidden" name="faculty" value="<?=$examData['faculty']?>">
              <?php include_once('exam-content.php')?>
              <div class="carousel-item">
                  <div class="question bg-white p-3">
                    <div class="text-center">
              
                      <div id="msg-error" class="alert alert-danger" style="display: none">Some items don't have answers</div>
                      <a id="goback" class="btn btn-danger" href="#carouselExams" role="button" data-slide="prev">GO BACK</a>
                      <button type="submit" class="btn btn-success">FINISH</button>
                    </div>
                  </div>
              </div>
          </form>
          <?php //include_once('exam-result.php') ?>
          </div>
        </div>

      </div>
      <div class="card-footer text-muted">
        <div id="btnMenuExam" class="d-flex justify-content-between">
          <a id="prevExam" class="btn btn-danger" href="#carouselExams" role="button" data-slide="prev">
            <i class="fa fa-angle-left mr-2"></i>PREV
          </a>
          <a id="nextExam" class="btn btn-success" href="#carouselExams" role="button" data-slide="next">
            NEXT<i class="fa fa-angle-right ml-2"></i>
          </a>
        </div>
      </div>
    </div> <!-- END OF CARD -->

    <script type="text/javascript">
      const answer = [];
      var counter=1;
      var examSize = <?=sizeof($questions)?>;
      $("#exam-items").text(counter + "/" + examSize);

      // counter if next is click
      $("#nextExam").click(function(){

        var to_find = "input[name='ask"+(counter-1)+"']:checked";
        answer[counter-1] = $(".ans").find(to_find).val();

        // console.log(to_find)
        // console.log($(".ans").find(to_find).val())

        if(counter != examSize+1){
          counter++;
        }

        if(counter == examSize+1){
          $("#prevExam").hide();
          $("#nextExam").hide();
          $("#exam-items").hide();
          console.log(answer);
        }

        
        $("#exam-items").text(counter + "/" + examSize);
      });

      // counter if prev is click
      $("#prevExam").click(function(){
        if(counter != 1)
          counter--;

        $("#exam-items").text(counter + "/" + examSize);
      });

      $("#goback").click(function(){

        $("#msg-error").css("display","none");
        if(counter != 1)
          counter--;

        $("#exam-items").show();
        $("#exam-items").text(counter + "/" + examSize);
      });

      $(document).ready(function() {
        $("#exam-form").on("submit", function(e) {
          

          var notAnswer=0;
          var validAnswer=0;
          for (let i = 0; i < examSize; i++) {

            if(answer[i] == undefined){
              notAnswer++;
            }
            else{
              validAnswer++;
            }

          }

          if(notAnswer > 0){
            e.preventDefault();
            $("#msg-error").css("display","block");
          }
          else{
            e.preventDefault()
            start_loader()
            if($('.err_msg').length > 0)
              $('.err_msg').remove()
            $.ajax({
              url:_base_url_+'classes/Master.php?f=save_score',
              method: "POST",
              data: {
                dvData: JSON.stringify(answer),
                exam_id: $("#exam_id").val(),
                std_id: $("#std_id").val(),
                section: $("#section").val(),
                sub_code: $("#sub_code").val(),
                faculty: $("#faculty").val(),
              },
                cache: false,
              error:err=>{
                console.log(err)
              },
              success:function(resp){
                console.log(resp);
              if(resp == 1){
                window.open(_base_url_+"student/?page=exam");
              }else{
                alert_toast("An error occured.",'error');
              }
                end_loader()
              }
            })
          }

        });

        $("#goback").click(function() {
          $("#prevExam").show();
          $("#nextExam").show();
        });
      });

    </script>
    
    <!-- <div id="carouselExampleControls" class="carousel slide">
      <div class="carousel-inner">

        <div class="carousel-item active">
          <img src="exam/sample.jpg" class="d-block w-100" alt="sample 1">
        </div>
        <div class="carousel-item">
          <img src="exam/sample.jpg" class="d-block w-100" alt="sample 2">
        </div>
        <div class="carousel-item">
          <img src="exam/sample.jpg" class="d-block w-100" alt="sample 3">
        </div>

      </div>
      <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
 -->

  </div>
</div>
<script type="text/javascript">
  $("#nextid").click(function() {
    // let answer = $(".ans").find('input').val()
    // input[name="name_of_your_radiobutton"]:checked
    let answer = $(".ans").find('input[name="questions"]:checked').val()
    alert(answer);
  });


</script>