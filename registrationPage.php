<?php
    session_start();
    require_once "dbconnect.php";
    $helo = "";
    $regValid = 0;
    if(isset($_POST['userName']))
    {
        $regValid = 1;
        $newUserName = $_POST['userName'];
        $newPassword0 = $_POST['password0'];
        $newPassword1 = $_POST['password1'];
        if($newUserName == null)
        {
            $nameOutput = "Enter Usermame!";
            $regValid = -1;
        }
        elseif(strlen($newUserName)<3 || strlen($newUserName)>10)
        {
            $nameOutput = "Username must be 3 to 10 characters long!";
            $regValid = -1;
        }
        elseif(!ctype_alnum($newUserName))
        {
            $nameOutput = "Only alphanumeric characters are allowed!";
            $regValid = -1;
        }
        if($newPassword0 == null)
        {
            $pass0Output = "Enter Password!";
            $regValid = -1;
        }
        elseif(strlen($newPassword0)<3 || strlen($newPassword0)>10)
        {
            $pass0Output = "Password must be 3 to 10 characters long!";
            $regValid = -1;
        }
        elseif(!ctype_alnum($newPassword0))
        {
            $pass0Output = "Only alphanumeric characters are allowed!";
            $regValid = -1;
        }
        if($newPassword1 == null)
        {
            $pass1Output = "Enter Password!";
            $regValid = -1;
        }
        elseif($newPassword1 != $newPassword0)
        {
            $pass1Output = "Passwords didn't match!";
            $regValid = -1;
        }
        if(!isset($_POST['terms']))
        {
            $termsOutput = "Must accept terms of use!";
            $regValid = -1;
        }
        if($regValid > 1)
        {
            $conn = new mysqli($host,$user,$pass,$db);
            $q = "SELECT * FROM `users` WHERE username=$newUserName";
            $check = $conn -> query($q);
            $check = $check -> num_rows;
            if(!empty($check))
            {
                $nameOutput = "Username already registered!";
                $regValid = -1;
            }
            $conn -> close();
        }
    }
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <!--<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">-->
        <link rel="stylesheet" href="style.css">
        <!--<link rel="icon" type="image/pnh" href="favicon.png"/>-->
        <link rel="icon" type="image/pnh" href="favicon.png"/>
        <title>GFL Gallery</title>
    </head>
    <body>
        <div id="wrapper">
            <header class="navBar">
                <a class="navButton" href="index.php">
                    <h1>Back</h1>
                </a>
            </header>
            <div id="registrationPanel">
                <h1>Registration Form</h1>
                <hr><br><br>
                <form method="POST">
                    
                    <?php 
                        if(isset($newUserName))
                        {
                            echo<<<END
                                <input class="registerField" type="text" name="userName" placeholder="username" value=$newUserName>
                            END;
                        }
                        else
                        {
                            echo '<input class="registerField" type="text" name="userName" placeholder="username">';
                        }
                        if(isset($nameOutput))
                        {
                            echo<<<END
                                <span class="errorText">$nameOutput</span><br>
                            END;
                        }
                    ?>
                    <?php 
                        if(isset($newPassword0))
                        {
                            echo<<<END
                                <input class="registerField" type="password" name="password0" placeholder="password" value=$newPassword0>
                            END;
                        }
                        else
                        {
                            echo '<input class="registerField" type="password" name="password0" placeholder="password">';
                        } 
                        if(isset($pass0Output))
                        {
                            echo<<<END
                                <span class="errorText">$pass0Output</span><br>
                            END;
                        }
                    ?>
                    <input class="registerField" type="password" name="password1" placeholder="repeat password">
                    <?php  
                        if(isset($pass1Output))
                        {
                            echo<<<END
                                <span class="errorText">$pass1Output</span><br>
                            END;
                        }
                    ?>
                    <input class="registerCheckbox" type="checkbox" name="terms"> I accept the terms of use<br>
                    <?php  
                        if(isset($termsOutput))
                        {
                            echo<<<END
                                <span class="errorText">$termsOutput</span><br>
                            END;
                        }
                    ?>
                    <input class="registerSubmit" type="submit" value="Register account">
                </form>
                <?php
                    echo $helo;
                ?>
            </div>
            <footer>
                created by: Kacper Jasiński
            </footer>
        </div>
    </body>
</html>