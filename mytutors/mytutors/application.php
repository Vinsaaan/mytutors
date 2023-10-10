<?php
session_start();




try {
  $semester = "Fall";
$year = date('Y');
if(date('Y-m-d h:i:s')>date('Y').'06-21 00:00:00' && date('Y-m-d h:i:s')<date('Y').'09-20 23:59:59')
    $semester = "Summer";
else if(date('Y-m-d h:i:s')>date('Y').'03-21 00:00:00' && date('Y-m-d h:i:s')<date('Y').'06-20 23:59:59')
    $semester = "Spring";

    $DATABASE_HOST = 'localhost';
    $DATABASE_USER = 'root';
    $DATABASE_PASS = 'root';
    $DATABASE_NAME = 'mytutors';

    $con = new PDO("mysql:host=$DATABASE_HOST;dbname=$DATABASE_NAME", $DATABASE_USER, $DATABASE_PASS);
    $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    //update user infos
    $stmt = $con->prepare("Update  `users` set FirstName=:FirstName , LastName=:LastName , Email=:Email , Phone=:Phone , GPA=:GPA , Gradulate=:Graduation  WHERE Username =:UserName");
    $stmt->bindParam(':FirstName', $FirstName);
    $FirstName = $_POST['FirstName'] ;
    $stmt->bindParam(':LastName', $LastName);
    $LastName = $_POST['LastName'] ;
    $stmt->bindParam(':Email', $Email);
    $Email = $_POST['Email'] ;
    $stmt->bindParam(':Phone', $Phone);
    $Phone = $_POST['Phone'] ;
    $GPA = $_POST['GPA'] ;
    $stmt->bindParam(':GPA', $GPA);
    $Graduation = $_POST['Graduation'] ;
    $stmt->bindParam(':Graduation', $Graduation);
    $UserName = $_SESSION['Username'] ;
    $stmt->bindParam(':UserName', $UserName);
    $stmt->execute();

    //delete all gta courses
     $stmt = $con->prepare("Delete From `gta`  WHERE Tutor =:UserName");
     $UserName = $_SESSION['Username'] ;
     $stmt->bindParam(':UserName', $UserName);
     $stmt->execute();

    //attach new gta courses
    foreach ($_POST['Courses'] as $key => $course) {
        $stmt = $con->prepare("INSERT INTO `gta` (`Course`, `Tutor`, `Year`, `Semester`) VALUES ( :course,:UserName,:year,:semester)");
        $UserName = $_SESSION['Username'] ;
        $stmt->bindParam(':UserName', $UserName);
        $stmt->bindParam(':course', $course);
        $stmt->bindParam(':year', $year);
        $stmt->bindParam(':semester', $semester);
        $stmt->execute();
    }

    //delete all availabilites day time
    $stmt = $con->prepare("Delete From `availabilities`  WHERE Tutor =:UserName");
    $UserName = $_SESSION['Username'] ;
    $stmt->bindParam(':UserName', $UserName);
    $stmt->execute();

    //attach all availabilites day time
    foreach ($_POST['availability'] as $key_day => $day) {
      foreach ($day as $key => $hour) {
        $stmt = $con->prepare("INSERT INTO `availabilities` (`day`,`time`, `Tutor`) VALUES ( :key_day,:hour,:UserName)");
        $UserName = $_SESSION['Username'] ;
        $stmt->bindParam(':UserName', $UserName);
        $stmt->bindParam(':key_day', $key_day);
        $stmt->bindParam(':hour', $hour);
        $stmt->execute();
      }


    }

  //redirect to main menu
  header('Location: home.php');



  } catch(PDOException $e) {
    echo "Database connection error: " . $e->getMessage();
  }
  $con = null;

?>
