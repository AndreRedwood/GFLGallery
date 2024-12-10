<?php
    require_once "dbconnect.php";
    session_start();
    $conn = new mysqli($host,$user,$pass,$db);
    if(!isset($_SESSION['activeFocus'])||!isset($_SESSION['activeShow']))
    {
        header("Location:index.php");
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

    const imagesPath = "./res/images/";

    $tDoll = $_SESSION['activeFocus'];

    $refreshId = $tDoll['id'];
    switch($_SESSION['currentMode'])
    {
        case "tdoll": $q = "SELECT * FROM `tdolls` WHERE id=$refreshId"; break;
        case "fairy": header("Location:index.php"); break;
        case "hoc": header("Location:index.php"); break;
    }
    $tDoll = $conn -> query($q);
    $tDoll = $tDoll -> fetch_assoc();

    $tDollName = $tDoll['name'];
    $tDollFullName = $tDoll['full_name'];
    $tDollCountry = $tDoll['origin_country'];
    $tDollID = $tDoll['game_id'];
    $tDollDescr = $tDoll['description'];
    $tDollSkills = $tDoll['skills_description'];
    $tDollTrivia = $tDoll['trivia'];

    $tDollMod = $tDoll['modded'];
    $tDollModButtonStyle = "modButton";
    $tDollModButtonLabel = "Show MOD3";

    $tDollProfile = "./res/".$tDoll['folder_name']."/profile.png";
    $tDollImageFolder = "./res/".$tDoll['folder_name'];
    if($tDoll['new_img_system'])
    {
        $tDollImage = imagesPath."/Nagant_Revolver.png";
        $tDollImageCaption = "";
    }
    else
    {
        $tDollImage = $tDollImageFolder."/sprite.png";
    }
    
    $modView = false;
    if(isset($_SESSION['newModView']))
    {
        $modView = $_SESSION['newModView'];
    }

    $tDollStarLabel = "?????";
    if($modView)
    {
        $tDollProfile = "./res/".$tDoll['folder_name']."/profile2.png";
        $tDollModButtonStyle = "modButtonActive";
        $tDollModButtonLabel = "Hide MOD3";
        switch($tDoll['star_rating'])
        {
            case 2: $tDollStarLabel = "★★★★"; break;
            case 3: $tDollStarLabel = "★★★★"; break;
            case 4: $tDollStarLabel = "★★★★★"; break;
            case 5: $tDollStarLabel = "★★★★★★"; break;
            case 8: $tDollStarLabel = "Fairy"; break;
            case 9: $tDollStarLabel = "HOC"; break;
        }
    }
    else
    {
        switch($tDoll['star_rating'])
        {
            case 2: $tDollStarLabel = "★★"; break;
            case 3: $tDollStarLabel = "★★★"; break;
            case 4: $tDollStarLabel = "★★★★"; break;
            case 5: $tDollStarLabel = "★★★★★"; break;
            case 8: $tDollStarLabel = "Fairy"; break;
            case 9: $tDollStarLabel = "HOC"; break;
        }
    }
    $tDollTypeLabel = $tDoll['type'];

    $vaId = $tDoll['voice_actor_id'];
    $q = "SELECT * FROM `voice_actors` WHERE id=$vaId";
    $voiceActor = $conn -> query($q);
    $voiceActor = $voiceActor -> fetch_assoc();
    $voiceActor = $voiceActor['name'];

    $aId = $tDoll['artist_id'];
    $q = "SELECT * FROM `artists` WHERE id=$aId";
    $artist = $conn -> query($q);
    $artist = $artist -> fetch_assoc();
    $artist = $artist['name'];

    $tDollSkillIconId = $tDoll['skill_icon_id'];
    $q = "SELECT * FROM `illustration_table` WHERE id=$tDollSkillIconId";
    $tDollSkillIcon = $conn -> query($q);
    $tDollSkillIcon = $tDollSkillIcon -> fetch_assoc();

    $qID = $tDoll['id'];
    switch($_SESSION['currentMode'])
    {
        case "tdoll": $q="SELECT * FROM `illustrations_tdolls` WHERE owner_id=$qID"; break;
        case "fairy": $q="SELECT * FROM `illustrations_fairies` WHERE owner_id=$qID"; break;
        case "hoc": $q="SELECT * FROM `illustrations_hocs` WHERE owner_id=$qID"; break;
    }
    $galleryResult['main'] = $conn -> query($q." AND (sprite_set = 'Main' OR sprite_set='MainMod') ORDER BY sprite_set, sprite_type");
    $galleryResult['skins'] = $conn -> query($q." AND sprite_set != 'Main' AND sprite_set!='MainMod' AND category='Sprite' ORDER BY sprite_set, sprite_type");
    $galleryResult['offArt'] = $conn -> query($q." AND category = 'OfficialArt'");
    $galleryResult['unOffArt'] = $conn -> query($q." AND category = 'UnofficialArt'");

    if($tDoll['new_img_system'])
    {
        $galleryResult['main'] = $conn -> query("SELECT * FROM `illustration_table` WHERE id= ANY (SELECT `image_id` FROM `illustration_connections_tdolls` WHERE tdoll_id=$qID) AND category = 'Sprite' AND (sprite_set = 'Main' OR sprite_set='MainMod') ORDER BY sprite_set, sprite_type, sort_order");
        $galleryResult['skins'] = $conn -> query("SELECT * FROM `illustration_table` WHERE id= ANY (SELECT `image_id` FROM `illustration_connections_tdolls` WHERE tdoll_id=$qID) AND category = 'Sprite' AND sprite_set != 'Main' AND sprite_set!='MainMod' ORDER BY sprite_set, sprite_type");
        $galleryResult['offArt'] = $conn -> query("SELECT * FROM `illustration_table` WHERE id= ANY (SELECT `image_id` FROM `illustration_connections_tdolls` WHERE tdoll_id=$qID) AND category = 'OfficialArt' ORDER BY sort_order");
        $galleryResult['unOffArt'] = $conn -> query("SELECT * FROM `illustration_table` WHERE id= ANY (SELECT `image_id` FROM `illustration_connections_tdolls` WHERE tdoll_id=$qID) AND category = 'UnofficialArt' ORDER BY sort_order");
    }

    $def = $conn -> query($q." AND sprite_set = 'Main' AND sprite_type = 'Regular'");
    $def = $def -> fetch_assoc();
    $_SESSION['defultCaption'] = $def['image_name'];
    unset($def);

    $soundsResult['general'] = $conn -> query("SELECT * FROM `sounds_table` WHERE id= ANY (SELECT `sound_id` FROM `sounds_connections` WHERE tdoll_id=$qID) AND category='general'");
    $soundsResult['combat'] = $conn -> query("SELECT * FROM `sounds_table` WHERE id= ANY (SELECT `sound_id` FROM `sounds_connections` WHERE tdoll_id=$qID) AND category='combat'");
    $soundsResult['event'] = $conn -> query("SELECT * FROM `sounds_table` WHERE id= ANY (SELECT `sound_id` FROM `sounds_connections` WHERE tdoll_id=$qID) AND category='event'");
    $soundsResult['misc.'] = $conn -> query("SELECT * FROM `sounds_table` WHERE id= ANY (SELECT `sound_id` FROM `sounds_connections` WHERE tdoll_id=$qID) AND category='misc.'");

    $conn -> close();
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="style.css">
        <link rel="icon" type="image/png" href="favicon.png"/>
        <?php
            echo<<<END
                <link rel="icon" type="image/png" href=$tDollImageFolder/token.png?v=<?php echo md5_file($tDollImageFolder/token.png)"/>
            END;
        ?>
        <title>Test image gallery showcase</title>
    </head>
    <body>
        <div id="wrapper">
            <header class="navBar">
                <?php
                    $nav0="navButton";
                    $nav1="navButton";
                    $nav2="navButton";
                    switch($_SESSION['activeShow'])
                    {
                        case "overview": $nav0 = "activeNavButton"; break;
                        case "gallery": $nav1 = "activeNavButton"; break;
                        case "quotes": $nav2 = "activeNavButton"; break;
                    }
                    echo<<<END
                        <a class="navButton" href="index.php">
                            <h1>$backLabel</h1>
                        </a>
                    END;
                    if($nav0=="activeNavButton")
                    {
                        echo<<<END
                        <div class="tDollIcon"><img src="$tDollImageFolder/token.png"></div>
                        END;
                    }
                    echo<<<END
                        <a class=$nav0 href="showcaseNavigator.php?showcaseDest=overview">
                            <h1>$overviewLabel</h1>
                        </a>
                    END;
                    if($nav1=="activeNavButton")
                    {
                        echo<<<END
                        <div class="tDollIcon"><img src="$tDollImageFolder/token.png"></div>
                        END;
                    }
                    echo<<<END
                        <a class=$nav1 href="showcaseNavigator.php?showcaseDest=gallery">
                            <h1>$galleryLabel</h1>
                        </a>
                    END;
                    if($nav2=="activeNavButton")
                    {
                        echo<<<END
                        <div class="tDollIcon"><img src="$tDollImageFolder/token.png"></div>
                        END;
                    }
                    echo<<<END
                        <a class=$nav2 href="showcaseNavigator.php?showcaseDest=quotes">
                            <h1>$quatesLabel</h1>
                        </a>
                        <!--<script>
                            function myFunction() {
                                document.getElementById("myDropdown").classList.toggle("show");
                            }
                        </script>
                        <div class="dropdownShow">
                            <div class="langIcon" onClick=myFunction()><img src=$langIcon>$langLabel</div>
                            <div id="myDropdown" class="dropdown-content">
                                <a href="showcaseNavigator.php?newLang=en"><img src="ENicon.png"> English</a>
                                <a id="lastLang" href="showcaseNavigator.php?newLang=pl"><img src="PLicon.png"> Polish(Polski)</a>
                            </div>
                        </div>-->
                    END;
                ?>
            </header>
            <div class="showcaseBody">
                <?php
                    if($_SESSION['activeShow']=="overview")
                    {
                        $mode = $_SESSION['currentMode'];
                        if($tDoll['skill_icon_id']!=0)
                        {
                            $iconSrc = imagesPath.$tDollSkillIcon['image_src'];
                            $iconAlt = $tDollSkillIcon['alt'];
                        }
                        echo<<<END
                            <div id="leftSide">
                                <h1>$tDollName</h1>
                                <hr>
                                <br><br>
                                $tDollDescr
                                <br>
                                <br>
                                <h3>$skillsLabel</h3>
                                <hr>
                        END;
                        if($tDoll['skill_icon_id']!=0)
                        {
                            echo<<<END
                                <img id="skillIcon" src=$iconSrc alt="$iconAlt">
                            END;
                        }
                        echo<<<END
                                <br>
                                $tDollSkills
                                <br>
                                <br>
                                <h3>$triviaLabel</h3>
                                <hr>
                                <br>
                                $tDollTrivia
                            </div>
                            <div id="rightSide">
                        END;
                        if($tDollMod)
                        {
                            echo<<<END
                                <a class=$tDollModButtonStyle href="showcaseNavigator.php?modSwitch=true">
                                    $tDollModButtonLabel
                                </a>
                            END;
                        }
                        echo<<<END
                            <div id="portrait">
                                <div id="up">$tDollTypeLabel <h2>$tDollStarLabel</h2></div>
                                <img src="$tDollProfile" alt="$tDollName profile image">
                                <div id="down">
                                <h2>$tDollName</h2>
                                <div><b>ID</b> $tDollID</div>
                                </div>
                            </div>
                            <br>
                            <div><b>$fullnameLabel:</b><br>$tDollFullName</div>
                            <br>
                        END;
                            if($mode != "fairy") 
                            {
                                echo<<<END
                                    <div><b>$countryLabel:</b><br>$tDollCountry</div><br>
                                END;
                            }
                            echo<<<END
                                <div><b>$voiceActorLabel:</b> $voiceActor</div>
                                <div><b>$artistLabel:</b> $artist</div>
                            </div>
                        END;
                    }
                    elseif ($_SESSION['activeShow']=="gallery")
                    {
                        if(isset($_SESSION['newShow'])&&isset($_SESSION['newCaption']))
                        {
                            if($tDoll['new_img_system'])
                            {
                                $tDollImage = imagesPath.$_SESSION['newShow'];
                            }
                            else
                            {
                                $tDollImage = $tDollImageFolder.$_SESSION['newShow'];
                            }
                            $tDollImageCaption = $_SESSION['newCaption'];
                        }
                        echo<<<END
                            <div id="leftSideGal">
                                <h1>$tDollName</h1>
                                <br>
                                <h3>$galleryLabel0</h3>
                                <hr>
                                <div class="galleryGroup">
                        END;

                        while($row = $galleryResult['main']->fetch_assoc())
                        {
                            if($tDoll['new_img_system'])
                            {
                                $value = $row['image_src'];
                                $imgName = $row['description'];
                                $imgNameEncoded = urlencode($row['description']);
                                $imgSource = imagesPath.$value;
                            }
                            else
                            {
                                $value = $row['image'];
                                $imgName = $row['image_name'];
                                $imgNameEncoded = urlencode($row['image_name']);
                                $imgSource = $tDollImageFolder.$value;
                            }
                            echo<<<END
                                <a href="showcaseNavigator.php?newShow=$value&newCaption=$imgNameEncoded"><div class="galleryBox"><img class="galleryButton" src="$imgSource" alt="$tDollName base artwork, click will show image on sidebar"></div>$imgName</a>
                            END;
                        }
                        if(!empty($galleryResult['skins']->num_rows))
                        {
                            echo<<<END
                                </div><h3>$galleryLabel1</h3><hr><div class="galleryGroup">
                            END;
                            while($row = $galleryResult['skins']->fetch_assoc())
                            {
                                
                                if($tDoll['new_img_system'])
                                {
                                    $value = $row['image_src'];
                                    $imgName = $row['description'];
                                    $imgNameEncoded = urlencode($row['description']);
                                    $imgSource = imagesPath.$value;
                                }
                                else
                                {
                                    $value = $row['image'];
                                    $imgName = $row['image_name'];
                                    $imgNameEncoded = urlencode($row['image_name']);
                                    $imgSource = $tDollImageFolder.$value;
                                }
                                //var_dump($imgName);
                                $imgSource = $tDollImageFolder.$value;
                                echo<<<END
                                    <a href="showcaseNavigator.php?newShow=$value&newCaption=$imgNameEncoded"><div class="galleryBox"><img class="galleryButton" src="$imgSource" alt="$tDollName costume artwork, click will show image on sidebar"></div>$imgName</a>
                                END;
                            }
                        }
                        if(!empty($galleryResult['offArt']->num_rows))
                        {
                            echo<<<END
                                </div><h3>$galleryLabel2</h3><hr><div class="galleryGroup">
                            END;
                            while($row = $galleryResult['offArt']->fetch_assoc())
                            {
                                if($tDoll['new_img_system'])
                                {
                                    $value = $row['image_src'];
                                    $imgName = $row['description'];
                                    $imgNameEncoded = urlencode($row['description']);
                                    $imgSource = imagesPath.$value;
                                }
                                else
                                {
                                    $value = $row['image'];
                                    $imgName = $row['image_name'];
                                    $imgNameEncoded = urlencode($row['image_name']);
                                    $imgSource = $tDollImageFolder.$value;
                                }
                                echo<<<END
                                    <a href="showcaseNavigator.php?newShow=$value&newCaption=$imgNameEncoded"><div class="galleryBox"><img class="galleryButton" src="$imgSource" alt="$tDollName official artwork, click will show image on sidebar"></div>$imgName</a>
                                END;
                            }
                        }
                        if(!empty($galleryResult['unOffArt']->num_rows))
                        {
                            echo<<<END
                                </div><h3>$galleryLabel3</h3><hr><div class="galleryGroup">
                            END;
                            while($row = $galleryResult['unOffArt']->fetch_assoc())
                            {
                                if($tDoll['new_img_system'])
                                {
                                    $value = $row['image_src'];
                                    $imgName = $row['description'];
                                    $imgNameEncoded = urlencode($row['description']);
                                    $imgSource = imagesPath.$value;
                                }
                                else
                                {
                                    $value = $row['image'];
                                    $imgName = $row['image_name'];
                                    $imgNameEncoded = urlencode($row['image_name']);
                                    $imgSource = $tDollImageFolder.$value;
                                }
                                echo<<<END
                                    <a href="showcaseNavigator.php?newShow=$value&newCaption=$imgNameEncoded"><div class="galleryBox"><img class="galleryButton" src="$imgSource" alt="$tDollName unofficial artwork, click will show image on sidebar"></div>$imgName</a>
                                END;
                            }
                        }
                        echo<<<END
                            </div></div>
                            <div id="rightSideGal">
                                <div id="imageShowcase">
                                    <img id="showcasedImage" src="$tDollImage" alt="$tDollName showcased artwork">
                                </div>
                                <div class="underLabel">
                                    <div>
                                        <span id="showcaseCaption">$tDollImageCaption</span>
                                    </div>
                                    <div class="inactive" id="enlargeButton">
                                        $enlargeLabel
                                    </div>
                                </div>
                                <div id="myModal" class="modal">
                                    <span class="close">&times;</span>
                                    <img class="modal-content" id="img01">
                                    <div id="caption"></div>
                                </div>
                                <script>
                                    // Get the modal
                                    var modal = document.getElementById("myModal");

                                    // Get the image and insert it inside the modal - use its "alt" text as a caption
                                    var button = document.getElementById("enlargeButton");
                                    var img = document.getElementById("showcasedImage");
                                    var modalImg = document.getElementById("img01");
                                    var captionText = document.getElementById("caption");
                                    button.onclick = function(){
                                    modal.style.display = "block";
                                    modalImg.src = img.src;
                                    captionText.innerHTML = document.getElementById("showcaseCaption").innerHTML;
                                    }

                                    // Get the <span> element that closes the modal
                                    var span = document.getElementsByClassName("close")[0];

                                    // When the user clicks on <span> (x), close the modal
                                    span.onclick = function() { 
                                    modal.style.display = "none";
                                    }
                                    </script>
                            </div>
                        END;
                    }
                    elseif($_SESSION['activeShow']=="quotes")
                    {
                        echo<<<END
                            <div id="quotesBody">
                                <h1>$soundsLabel0</h1>
                                <hr>
                                <br>
                                <div class="outerTable">
                                    <table class="quotesTable">
                                        <tr>
                                            <th class="firstCol">$dialogueLabel</th>
                                            <th>$jpLabel</th>
                                            <th>$translationLabel</th>
                                        </tr>
                        END;
                        while($row = $soundsResult['general']->fetch_assoc())
                        {
                            $dialogeAudio = "/res/audio".$row['sound_src'];
                            $dialoge_text = $row['text_JP'];
                            $dialoge_label = $row['dialoge_name'];
                            $dialoge_translation = $row['translation'];
                            echo<<<END
                                <tr>
                                    <td class=firstCol>$dialoge_label</td>
                                    <td>$dialoge_text <img class="audioButton" src="image.png" height=10px width=10px onclick="playAudio($dialogeAudio)"></td>
                                    <td>$dialoge_translation</td>
                                </tr>
                            END;
                        }
                        echo<<<END
                                    </table>
                                </div>
                                <br>
                                <h1>$soundsLabel1</h1>
                                <hr>
                                <div class="outerTable">
                                    <table class="quotesTable">
                                        <tr>
                                            <th class=firstCol>$dialogueLabel</th>
                                            <th>$jpLabel</th>
                                            <th>$translationLabel</th>
                                        </tr>
                        END;
                        while($row = $soundsResult['combat']->fetch_assoc())
                        {
                            $dialogeAudio = "/res/audio".$row['sound_src'];
                            $dialoge_label = $row['dialoge_name'];
                            $dialoge_text = $row['text_JP'];
                            $dialoge_translation = $row['translation'];
                            echo<<<END
                                <tr>
                                    <td class=firstCol>$dialoge_label</td>
                                    <td>$dialoge_text <img class="audioButton" src="image.png" height=10px width=10px onclick="playAudio($dialogeAudio)"></td>
                                    <td>$dialoge_translation</td>
                                </tr>
                            END;
                        }
                        echo<<<END
                                    </table>
                                </div>
                                <br>
                                <h1>$soundsLabel2</h1>
                                <hr>
                                <script>
                                    function playAudio(url) {
                                        new Audio(url).play();
                                    }
                                </script>
                                <div class="outerTable">
                                    <table class="quotesTable">
                                        <tr>
                                            <th class=firstCol>$dialogueLabel</th>
                                            <th>$jpLabel</th>
                                            <th>$translationLabel</th>
                                        </tr>
                        END;
                        while($row = $soundsResult['event']->fetch_assoc())
                        {
                            $dialogeAudio = "/res/audio".$row['sound_src'];
                            $dialoge_label = $row['dialoge_name'];
                            $dialoge_text = $row['text_JP'];
                            $dialoge_translation = $row['translation'];
                            echo<<<END
                                <tr>
                                    <td class=firstCol>$dialoge_label</td>
                                    <td>$dialoge_text <img class="audioButton" src="image.png" height=10px width=10px onclick="playAudio($dialogeAudio)"></td>
                                    <td>$dialoge_translation</td>
                                </tr>
                            END;
                        }
                        echo<<<END
                                    </table>
                                </div>
                                <br>
                                <h1>$soundsLabel3</h1>
                                <hr>
                                <div class="outerTable">
                                    <table class="quotesTable">
                                        <tr>
                                            <th class=firstCol>$dialogueLabel</th>
                                            <th>$jpLabel</th>
                                            <th>$translationLabel</th>
                                        </tr>
                            END;
                            while($row = $soundsResult['misc.']->fetch_assoc())
                            {
                                $dialogeAudio = "/res/audio".$row['sound_src'];
                                $dialoge_label = $row['dialoge_name'];
                                $dialoge_text = $row['text_JP'];
                                $dialoge_translation = $row['translation'];
                                echo<<<END
                                    <tr>
                                        <td class=firstCol>$dialoge_label</td>
                                        <td>$dialoge_text <img class="audioButton" src="image.png" height=10px width=10px onclick="playAudio($dialogeAudio)"></td>
                                        <td>$dialoge_translation</td>
                                    </tr>
                                END;
                            }
                            echo<<<END
                                    </table>
                                </div>
                            </div>
                        END;
                    }
                ?>
            </div>
            <!-- to do later <div id="commentSection">
                comment<br>
                <form action="galleryShowcase.php" method="GET">
                    comment: <input type="text" name="commentName" placeholder="comment something" required><br>
                    <input class="submitButton" type="submit" value="post commnet">
                </form>
            </div>-->
            <footer>
                created by: Kacper Jasiński
            </footer>
        </div>
    </body>
</html>