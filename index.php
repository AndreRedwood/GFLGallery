<?php
    require_once "dbconnect.php";
    require_once "filterGenerator.php";
    session_start();
    $conn = new mysqli($host,$user,$pass,$db);
    $focus = "1";
    if(!isset($_SESSION['lang']))
    {
        $_SESSION['lang'] = "en";
    }
    if(!isset($_SESSION['currentMode']))
    {
        $_SESSION['currentMode'] = "tdoll";
    }
    if(isset($_SESSION['newFocus']))
    {
        $focus = $_SESSION['newFocus'];
        //unset($_SESSION['newFocus']);
    }
    $sort = "game_id";
    $sortDirect = "ASC";
    $sortArrow = "▲";
    if(isset($_SESSION['newSort']))
    {
        $sort = $_SESSION['newSort'];
    }
    if(isset($_SESSION['newSortDirect']))
    {
        $sortDirect = $_SESSION['newSortDirect'];
        if($sortDirect == "DESC")
        {
            $sortArrow = "▼";
        }
        else
        {
            $sortArrow = "▲";
        }
    }
    if($_SESSION['lang']=="pl")
    {
        $langLabel="Polski";
        $langIcon="PLicon.png";
        require_once("localizationPL.php");
    }
    else
    {
        $langLabel="English";
        $langIcon="ENicon.png";
        require_once("localizationEN.php");
    }
    switch($_SESSION['currentMode'])
    {
        case "tdoll": $q = "SELECT * FROM `tdolls`"; break;
        case "fairy": $q = "SELECT * FROM `fairies`"; break;
        case "hoc": $q = "SELECT * FROM `hocs`"; break;
    }
    if($_SESSION['currentMode']=="tdoll")
    {
        generateFilters();
        $q = $q.$_SESSION['filters'];
    }
    $q = $q." ORDER BY $sort $sortDirect";
    $result_all = $conn -> query($q);
    switch($_SESSION['currentMode'])
    {
        case "tdoll": $q = "SELECT * FROM `tdolls` WHERE id='$focus'"; break;
        case "fairy": $q = "SELECT * FROM `fairies` WHERE id='$focus'"; break;
        case "hoc": $q = "SELECT * FROM `hocs` WHERE id='$focus'"; break;
    }
    $result_focus = $conn -> query($q);
    $result_focus = $result_focus -> fetch_assoc();
    $_SESSION['activeFocus'] = $result_focus;

    $conn->close();
    const resFolder = './res/';
?>

<!DOCTYPE html>
<html lang=<?=$_SESSION['lang']?>>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
        <link rel="stylesheet" href="style.css">
        <!--<link rel="icon" type="image/pnh" href="favicon.png"/>-->
        <?php
            $tDollImageFolder = resFolder.$result_focus['folder_name'];
            $md5 = md5_file($tDollImageFolder."/token.png");
            echo<<<END
                <link rel="icon" type="image/png" href=$tDollImageFolder/token.png?v=$md5/>
                <title>$title</title>
            END;
        ?>
    </head>
    <body>
        <div id="wrapper">
            <header class="navBarIndex">
                <div id="indexNavGroupsSpace">
                    <a class="activeNavButton" href="index.php">
                        <h1>GFL</h1>
                    </a>
                    <?php
                        $nav0 = "navButton";
                        $nav1 = "navButton";
                        $nav2 = "navButton";
                        switch($_SESSION['currentMode'])
                        {
                            case "tdoll": $nav0 = "activeNavButton"; break;
                            case "fairy": $nav1 = "activeNavButton"; break;
                            case "hoc": $nav2 = "activeNavButton"; break;
                        }
                        echo<<<END
                            <div class="indexNavGroup">
                                <a class=$nav0 href="test.php?newMode=tdoll">
                                    <h1>T-Dolls</h1>
                                </a>
                                <a class=$nav1 href="test.php?newMode=fairy">
                                    <h1>Tech. Faires</h1>
                                </a>
                                <a class=$nav2 href="test.php?newMode=hoc">
                                    <h1>HOCs</h1>
                                </a>
                            </div>
                        END;
                    ?>
                </div>
                <?php
                    echo<<<END
                        <!--<script>
                            function myFunction() {
                                document.getElementById("myDropdown").classList.toggle("show");
                            }
                        </script>
                        <a href="index.php?registerToDo">
                            <div class="registerButton">REGISTER</div>
                        </a>
                        <div class="dropdown">
                            <div class="langIcon" onClick=myFunction()><img src=$langIcon>$langLabel</div>
                            <div id="myDropdown" class="dropdown-content">
                                <a href="test.php?newLang=en"><img src="ENicon.png"> English</a>
                                <a id="lastLang" href="test.php?newLang=pl"><img src="PLicon.png"> Polish(Polski)</a>
                            </div>
                        </div>-->
                        <div class="tDollIcon" id="indexIcon"><img src="$tDollImageFolder/token.png"></div>
                    END;
                ?>
            </header>
            <div id="upPanel">
                <?php
                    //$q = "SELECT * FROM `testtable`";
                    //$q = $q.$_SESSION['filters'];
                    //echo $q;
                    $imgSource = resFolder.$result_focus['folder_name']."/sprite.png";
                    $soundSource = resFolder.$result_focus['folder_name']."/sound.mp3";
                    $headerName = $result_focus['name'];
                    $headerDescr = $result_focus['short_description'];
echo<<<END
                    <div id="imageBox">
                        <div class="frame">
                            <img src=$imgSource alt="$headerName base in game image">
                        </div>
                    </div>
                    <div id="descriptionBox">
                        <h1>$headerName</h1>
                        <p>$headerDescr</p>
                        <!--<audio id="mainAudio" controls preload="auto"> 
                            <source id="mainSound" src=$soundSource />
                        </audio>-->
                        <a class="inactive" href=showcaseNavigator.php?showcaseDest=overview>$details</a>
                    </div>
END;
                ?>
            </div>
            <div id="sortBar">
                <h2><?=$sortLabel?></h2>
                <?php
                    $sort0css="inactive";
                    $sort1css="inactive";
                    $sort2css="inactive";
                    $sort3css="inactive";
                    if(isset($sort))
                    {
                        switch($sort)
                        {
                            case "game_id": $sort0css = "active"; break;
                            case "name": $sort1css = "active"; break;
                            case "star_rating": $sort2css = "active"; break;
                            case "type": $sort3css = "active"; break;
                        }
                    }
                    if($_SESSION['currentMode']=="tdoll")
                    {
                    echo<<<END
                        <a class=$sort0css href='test.php?newSort=game_id'>$sortSublabel0</a>
                        <a class=$sort1css href='test.php?newSort=name'>$sortSublabel1</a>
                        <a class=$sort2css href='test.php?newSort=star_rating'>$sortSublabel2</a>
                        <a class=$sort3css href='test.php?newSort=type'>$sortSublabel3</a>
                        <a class="active" href='test.php?newSortDirect=x'>$sortArrow</a>
                    END;
                    }
                    else
                    {
                        echo<<<END
                        <a class=$sort0css href='test.php?newSort=game_id'>$sortSublabel0</a>
                        <a class=$sort1css href='test.php?newSort=name'>$sortSublabel1</a>
                        <a class=$sort3css href='test.php?newSort=type'>$sortSublabel3</a>
                        <a class="active" href='test.php?newSortDirect=x'>$sortArrow</a>
                    END;
                    }
                    if($_SESSION['currentMode']=="tdoll")
                    {
                     echo "<h2>$filterLabel</h2>";
                        if($_SESSION['flag2star'])
                        {
                            $star2css = "active";
                        }
                        else
                        {
                            $star2css="inactive";
                        }

                        if($_SESSION['flag3star'])
                        {
                            $star3css = "active";
                        }
                        else
                        {
                            $star3css="inactive";
                        }

                        if($_SESSION['flag4star'])
                        {
                            $star4css = "active";
                        }
                        else
                        {
                            $star4css="inactive";
                        }

                        if($_SESSION['flag5star'])
                        {
                            $star5css = "active";
                        }
                        else
                        {
                            $star5css="inactive";
                        }
                        /**$star3css="inactive";
                        $star4css="inactive";
                        $star5css="inactive";
                        if(isset($starFilter))
                        {
                            switch($starFilter)
                            {
                                case 2: $star2css = "active"; break;
                                case 3: $star3css = "active"; break;
                                case 4: $star4css = "active"; break;
                                case 5: $star5css = "active"; break;
                            }
                        }**/
                        echo<<<END
                            <a class=$star2css href='test.php?starFilter=2'>2★</a>
                            <a class=$star3css href='test.php?starFilter=3'>3★</a>
                            <a class=$star4css href='test.php?starFilter=4'>4★</a>
                            <a class=$star5css href='test.php?starFilter=5'>5★</a>
                            <br>
                        END;
                        if($_SESSION['flagHG'])
                        {
                            $type0css = "active";
                        }
                        else
                        {
                            $type0css="inactive";
                        }

                        if($_SESSION['flagAR'])
                        {
                            $type1css = "active";
                        }
                        else
                        {
                            $type1css="inactive";
                        }

                        if($_SESSION['flagSMG'])
                        {
                            $type2css = "active";
                        }
                        else
                        {
                            $type2css="inactive";
                        }

                        if($_SESSION['flagRF'])
                        {
                            $type3css = "active";
                        }
                        else
                        {
                            $type3css="inactive";
                        }

                        if($_SESSION['flagMG'])
                        {
                            $type4css = "active";
                        }
                        else
                        {
                            $type4css="inactive";
                        }

                        if($_SESSION['flagSG'])
                        {
                            $type5css = "active";
                        }
                        else
                        {
                            $type5css="inactive";
                        }
                        /**$type0css="inactive";
                        $type1css="inactive";
                        $type2css="inactive";
                        $type3css="inactive";
                        $type4css="inactive";
                        $type5css="inactive";
                        if(isset($typeFilter))
                        {
                            switch($typeFilter)
                            {
                                case '1': $type0css = "active"; break;
                                case '2': $type1css = "active"; break;
                                case '3': $type2css = "active"; break;
                                case '4': $type3css = "active"; break;
                                case '5': $type4css = "active"; break;
                                case '6': $type5css = "active"; break;
                            }
                        }**/
                        echo<<<END
                            <a class=$type0css href='test.php?typeFilter=1'>HG</a>
                            <a class=$type1css href='test.php?typeFilter=2'>AR</a>
                            <a class=$type2css href='test.php?typeFilter=3'>SMG</a>
                            <a class=$type3css href='test.php?typeFilter=4'>RF</a>
                            <a class=$type4css href='test.php?typeFilter=5'>MG</a>
                            <a class=$type5css href='test.php?typeFilter=6'>SG</a>
                        END;
                    }
                ?>
            </div>
            <div id="boxContainer">
                <?php
                    
                    while($row = $result_all->fetch_assoc())
                    {
                        if($row['id']==$result_focus['id'])
                        {
                            $imgSource = resFolder.$result_focus['folder_name']."/profile.png";
                            $value = $result_focus['name'];
                            $valueType = $result_focus['type'];
                            if($_SESSION['currentMode'] == "hoc") {$valueType = "HOC";}
                            $valueID = $result_focus['id'];
                            $valueGameID = $result_focus['game_id'];
                            echo<<<END
                                    <a href="test.php?newFocus=$valueID"><div id="fBox" class="smallBox">$value<br><img class="button" src="$imgSource" alt="$value profile image, click will show a short description"><div class="smallBoxID">$valueType<br>$valueGameID</div></div></a>
                            END;
                            continue;
                        }
                        $value = $row['name'];
                        $valueType = $row['type'];
                        if($_SESSION['currentMode'] == "hoc") {$valueType = "HOC";}
                        $valueID = $row['id'];
                        $valueGameID = $row['game_id'];
                        $imgSource = resFolder.$row['folder_name']."/profile.png";
                        echo<<<END
                                <a href="test.php?newFocus=$valueID"><div class="smallBox">$value<br><img class="button" src="$imgSource" alt="$value profile image, click will show a short description"><div class="smallBoxID">$valueType<br>$valueGameID</div></div></a>
                        END;
                    }
                    unset($result_all);
                    unset($result_focus);
                ?>
            </div>
            <footer>
                created by: Kacper Jasiński
            </footer>
        </div>
    </body>
</html>