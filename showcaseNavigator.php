<?php
    session_start();
    if(isset($_GET['showcaseDest']))
    {
        $_SESSION['activeShow'] = $_GET['showcaseDest'];
        if($_SESSION['activeShow'] == "overview")
        {
            $_SESSION['newModView'] = false;
        }
        elseif($_SESSION['activeShow'] == "gallery")
        {
            unset($_SESSION['newShow']);
            unset($_SESSION['newCaption']);
        }
        header("Location:galleryShowcase.php");
    }
    elseif(isset($_GET['newShow'])&&isset($_GET['newCaption']))
    {
        $_SESSION['newShow'] = $_GET['newShow'];
        $_SESSION['newCaption'] = $_GET['newCaption'];
        header("Location:galleryShowcase.php");
    }
    elseif(isset($_GET['modSwitch']))
    {
        $_SESSION['newModView'] = !$_SESSION['newModView'];
        header("Location:galleryShowcase.php");
    }
    elseif(isset($_GET['newLang']))
    {
        $_SESSION['lang'] = $_GET['newLang'];
        header("Location:galleryShowcase.php");
    }
    else
    {
        header("Location:index.php");
    }
?>