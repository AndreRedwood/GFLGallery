<?php
session_start();

if(isset($_GET['newFocus']))
{
    $_SESSION['newFocus']=$_GET['newFocus'];
    header("Location:index.php");
}
elseif (isset($_GET['newSort']))
{
    $_SESSION['newSort']=$_GET['newSort'];
    header("Location:index.php");
}
elseif (isset($_GET['newSortDirect']))
{
    if(isset($_SESSION['newSortDirect']))
    {
        if($_SESSION['newSortDirect'] == "ASC")
        {
            $_SESSION['newSortDirect'] = "DESC";
        }
        else
        {
            $_SESSION['newSortDirect'] = "ASC";
        }
    }
    else
    {
        $_SESSION['newSortDirect'] = "DESC";
    }
    header("Location:index.php");
}
elseif (isset($_GET['starFilter']))
{
    /**if(isset($_SESSION['starFilter']))
    {
        if($_SESSION['starFilter']==$_GET['starFilter'])
        {
            echo $_SESSION['starFilter']." ".$_GET['starFilter'];
            unset($_SESSION['starFilter']);
            header("Location:index.php");
        }
        else
        {
            $_SESSION['starFilter'] = $_GET['starFilter'];
            header("Location:index.php");
        }
    }
    else
    {
        $_SESSION['starFilter'] = $_GET['starFilter'];
        header("Location:index.php");
    }**/
    switch($_GET['starFilter'])
    {
        case '2': $_SESSION['flag2star'] = !$_SESSION['flag2star'];break;
        case '3': $_SESSION['flag3star'] = !$_SESSION['flag3star'];break;
        case '4': $_SESSION['flag4star'] = !$_SESSION['flag4star'];break;
        case '5': $_SESSION['flag5star'] = !$_SESSION['flag5star'];break;
    }
    header("Location:index.php");
}
elseif (isset($_GET['typeFilter']))
{
    /**if(isset($_SESSION['typeFilter']))
    {
        if($_SESSION['typeFilter']==$_GET['typeFilter'])
        {
            echo $_SESSION['typeFilter']." ".$_GET['typeFilter'];
            unset($_SESSION['typeFilter']);
            header("Location:index.php");
        }
        else
        {
            $_SESSION['typeFilter'] = $_GET['typeFilter'];
            header("Location:index.php");
        }
    }
    else
    {
        $_SESSION['typeFilter'] = $_GET['typeFilter'];
        header("Location:index.php");
    }**/
    switch($_GET['typeFilter'])
    {
        case '1': $_SESSION['flagHG'] = !$_SESSION['flagHG'];break;
        case '2': $_SESSION['flagAR'] = !$_SESSION['flagAR'];break;
        case '3': $_SESSION['flagSMG'] = !$_SESSION['flagSMG'];break;
        case '4': $_SESSION['flagRF'] = !$_SESSION['flagRF'];break;
        case '5': $_SESSION['flagMG'] = !$_SESSION['flagMG'];break;
        case '6': $_SESSION['flagSG'] = !$_SESSION['flagSG'];break;
    }
    header("Location:index.php");
}
elseif(isset($_GET['newMode']))
{
    $_SESSION['currentMode'] = $_GET['newMode'];
    $_SESSION['newFocus'] = "1";
    header("Location:index.php");
}
elseif(isset($_GET['newLang']))
{
    $_SESSION['lang'] = $_GET['newLang'];
    header("Location:index.php");
}
?>