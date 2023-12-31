<?php
    session_start();
    if (!isset($_SESSION['loggedin']) || $_SESSION['loggedin'] != "Professor") {
        header('Location: login.php');
        exit;
    }
    $my_courses = [];

    try {

        $DATABASE_HOST = 'localhost';
        $DATABASE_USER = 'root';
        $DATABASE_PASS = 'root';
        $DATABASE_NAME = 'mytutors';

        $con = new PDO("mysql:host=$DATABASE_HOST;dbname=$DATABASE_NAME", $DATABASE_USER, $DATABASE_PASS);
        $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

         //get schedules of user
         $stmt = $con->prepare("select `courses`.`Number`, `courses`.`School`, `tutors`.`FirstName`, `tutors`.`LastName`, `tutors`.`UserName` from `schedules` inner join `Courses` on `schedules`.`Course` = `Courses`.`Number` inner join `Users` as `tutors`  on `schedules`.`Tutor` = `tutors`.`Username`  WHERE Student =:UserName");
         $stmt->bindParam(':UserName', $UserName);
         $UserName =  $_SESSION['Username']  ;
         $stmt->execute();
         $my_courses = $stmt->fetchAll(PDO::FETCH_ASSOC);

      } catch(PDOException $e) {
        echo "Database connection error: " . $e->getMessage();
      }
      $con = null;


?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tutor Evaluation by Student</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>

    </style>
</head>
<body>
<div class="row">
    <div class="col px-5 ">
        <h3 class="text-center mt-5">Tutor Evaluation by Student</h3>

    <form method="Post" action="add_student_recommendation.php">
        <div class="row">
            <div class="col-8 offset-2">
                <div class="mb-3 row">
                    <label for="staticEmail" class="col-sm-3 col-form-label">Course</label>
                    <div class="col-sm-5">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">School</th>
                                    <th scope="col">Number</th>
                                    <th scope="col">#</th>
                                </tr>
                            </thead>
                            <tbody>
                            <?php foreach ($my_courses as $key => $course) {
                                ?>
                                <tr>
                                    <td><?php echo $course['School']; ?></td>
                                    <td><?php echo $course['Number']; ?></td>
                                    <td>
                                    <div>
                                        <input class="form-check-input course-radio" onchange="changeCourse(this)" <?php if(isset($_POST['Course']) && $_POST['Course']==$course['Number'] ) echo "checked"; ?> type="radio" name="Course" value="<?php echo $course['Number']; ?>" data-tutor="<?php echo $course['UserName']; ?>" data-tutor_name="<?php echo $course['FirstName'].' '.$course['LastName']; ?>">
                                    </div>
                                    </td>
                                </tr>
                                <?php
                                }
                                ?>
                            </tbody>
                        </table>


                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-8 offset-2">
                <div class="mb-3 row">
                    <label for="staticEmail" class="col-sm-3 col-form-label">Tutor Name</label>
                    <div class="col-sm-5">
                        <input  name="ID" id="ID"   type="hidden" value="">
                        <input class="form-control" name="Name" id="Name" disabled  value="">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-8 offset-2">
                <div class="mb-3 row">
                    <label for="Description" class="col-sm-3 col-form-label">Description Evaluation</label>
                    <div class="col-sm-9">
                       <textarea class="form-control" name="Description" id="Description" rows="5"></textarea>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-8 offset-2">
                <div class="mb-3 row">
                    <label for="Description" class="col-sm-3 col-form-label">Numeric Evaluation</label>
                    <div class="col-sm-9">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="Evaluation" id="exampleRadios1" value="4" checked>
                            <label class="form-check-label" for="exampleRadios1">
                                4 Highly recommend
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="Evaluation" id="exampleRadios2" value="3">
                            <label class="form-check-label" for="exampleRadios2">
                                3 Recommend
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="Evaluation" id="exampleRadios2" value="2">
                            <label class="form-check-label" for="exampleRadios2">
                                2 Recommend with reservations
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="Evaluation" id="exampleRadios2" value="1">
                            <label class="form-check-label" for="exampleRadios2">
                                1 Do Not Recommend
                            </label>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-8 offset-2">
            <button type="submit" class="col-sm-3 btn btn-outline-success">Ok</button>
            </div>
        </div>
        </form>
    </div>
</div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script>
        function changeCourse(el) {
            $('#ID').val($(el).data('tutor'));
            $('#Name').val($(el).data('tutor_name'));
        }
    </script>
</body>
</html>
