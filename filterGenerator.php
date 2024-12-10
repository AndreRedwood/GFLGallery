<?php
    //session_start();
    function generateFilters()
    {
        if(!isset($_SESSION['flag2star']))
        {
            $_SESSION['flag2star'] = false;
        }
        if(!isset($_SESSION['flag3star']))
        {
            $_SESSION['flag3star'] = false;
        }
        if(!isset($_SESSION['flag4star']))
        {
            $_SESSION['flag4star'] = false;
        }
        if(!isset($_SESSION['flag5star']))
        {
            $_SESSION['flag5star'] = false;
        }

        if(!isset($_SESSION['flagHG']))
        {
            $_SESSION['flagHG'] = false;
        }
        if(!isset($_SESSION['flagAR']))
        {
            $_SESSION['flagAR'] = false;
        }
        if(!isset($_SESSION['flagSMG']))
        {
            $_SESSION['flagSMG'] = false;
        }
        if(!isset($_SESSION['flagRF']))
        {
            $_SESSION['flagRF'] = false;
        }
        if(!isset($_SESSION['flagMG']))
        {
            $_SESSION['flagMG'] = false;
        }
        if(!isset($_SESSION['flagSG']))
        {
            $_SESSION['flagSG'] = false;
        }


        $filters = "";
        $maincounter = 0;
        $subcounter = 0;

        if($_SESSION['flag2star'])
        {
            if($maincounter == 0)
            {
                $filters = " WHERE (star_rating=2";
                $maincounter ++;
                $subcounter ++;
            }
            else
            {
                $filters = $filters." OR star_rating=2";
                $maincounter ++;
                $subcounter ++;
            }
        }
        if($_SESSION['flag3star'])
        {
            if($maincounter == 0)
            {
                $filters = " WHERE (star_rating=3";
                $maincounter ++;
                $subcounter ++;
            }
            else
            {
                $filters = $filters." OR star_rating=3";
                $maincounter ++;
                $subcounter ++;
            }
        }
        if($_SESSION['flag4star'])
        {
            if($maincounter == 0)
            {
                $filters = " WHERE (star_rating=4";
                $maincounter ++;
                $subcounter ++;
            }
            else
            {
                $filters = $filters." OR star_rating=4";
                $maincounter ++;
                $subcounter ++;
            }
        }
        if($_SESSION['flag5star'])
        {
            if($maincounter == 0)
            {
                $filters = " WHERE (star_rating=5";
                $maincounter ++;
                $subcounter ++;
            }
            else
            {
                $filters = $filters." OR star_rating=5";
                $maincounter ++;
                $subcounter ++;
            }
        }
        if($subcounter>0)
        {
            $filters = $filters.")";
            $subcounter = 0;
        }
        if($_SESSION['flagHG'])
        {
            if($maincounter == 0)
            {
                $filters = " WHERE (type='HG'";
                $maincounter ++;
                $subcounter ++;
            }
            elseif($subcounter == 0)
            {
                $filters = $filters." AND (type='HG'";
                $maincounter ++;
                $subcounter ++;
            }
            else
            {
                $filters = $filters." OR type='HG'";
                $maincounter ++;
                $subcounter ++;
            }
        }
        if($_SESSION['flagAR'])
        {
            if($maincounter == 0)
            {
                $filters = " WHERE (type='AR'";
                $maincounter ++;
                $subcounter ++;
            }
            elseif($subcounter == 0)
            {
                $filters = $filters." AND (type='AR'";
                $maincounter ++;
                $subcounter ++;
            }
            else
            {
                $filters = $filters." OR type='AR'";
                $maincounter ++;
                $subcounter ++;
            }
        }
        if($_SESSION['flagSMG'])
        {
            if($maincounter == 0)
            {
                $filters = " WHERE (type='SMG'";
                $maincounter ++;
                $subcounter ++;
            }
            elseif($subcounter == 0)
            {
                $filters = $filters." AND (type='SMG'";
                $maincounter ++;
                $subcounter ++;
            }
            else
            {
                $filters = $filters." OR type='SMG'";
                $maincounter ++;
                $subcounter ++;
            }
        }
        if($_SESSION['flagRF'])
        {
            if($maincounter == 0)
            {
                $filters = " WHERE (type='RF'";
                $maincounter ++;
                $subcounter ++;
            }
            elseif($subcounter == 0)
            {
                $filters = $filters." AND (type='RF'";
                $maincounter ++;
                $subcounter ++;
            }
            else
            {
                $filters = $filters." OR type='RF'";
                $maincounter ++;
                $subcounter ++;
            }
        }
        if($_SESSION['flagMG'])
        {
            if($maincounter == 0)
            {
                $filters = " WHERE (type='MG'";
                $maincounter ++;
                $subcounter ++;
            }
            elseif($subcounter == 0)
            {
                $filters = $filters." AND (type='MG'";
                $maincounter ++;
                $subcounter ++;
            }
            else
            {
                $filters = $filters." OR type='MG'";
                $maincounter ++;
                $subcounter ++;
            }
        }
        if($_SESSION['flagSG'])
        {
            if($maincounter == 0)
            {
                $filters = " WHERE (type='SG'";
                $maincounter ++;
                $subcounter ++;
            }
            elseif($subcounter == 0)
            {
                $filters = $filters." AND (type='SG'";
                $maincounter ++;
                $subcounter ++;
            }
            else
            {
                $filters = $filters." OR type='SG'";
                $maincounter ++;
                $subcounter ++;
            }
        }
        if($subcounter>0)
        {
            $filters = $filters.")";
            $subcounter = 0;
        }
        $_SESSION['filters'] = $filters;
    }
?>