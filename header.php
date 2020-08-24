<div class="menu-container">

    <input type="checkbox" id="openmenu" class="hamburger-checkbox">

    <div class="hamburger-icon">
      <label for="openmenu" id="hamburger-label">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
      </label>
    </div>

    <div class="menu-pane">
<?php
if (isset($_SESSION['login']) == true){
    if ($_SESSION['id'] == 1337 || $_SESSION['permission'] == 1 ){
?>

      <nav>
        <ul class="menu-links">
            <li><a href="index.php">Home</a><span id="QC-info"> </span>
            <li><a href="topic.php">Topics<span id="QC-info"></span></a></li>
            <li><a href="membres.php">Member<span id="QC-info"></span></a></li>
            <li><a href="disconnect.php">Log out<span id=""></span></a></li>
            <li><a href="administrator.php">Administrator.php<span id=""></span></a></li>


        </ul>
      </nav>

        <?php
          }
    else
    {
        ?>
        <nav>
            <ul class="menu-links">
                <li><a href="index.php">Home</a><span id="QC-info"> </span></li>
                <li><a href="topic.php">Topics<span id="QC-info"></span></a></li>
                <li><a href="disconnect.php">Log out<span id=""></span></a></li>

            </ul>
        </nav>
        <?php
    }

  }
    else{
        ?>
        <nav>
            <ul class="menu-links">
                <li><a href="index.php">Home</a><span id="QC-info"> </span></li>
                <li><a href="connexion.php">Sign In<span id="QC-info"></span></a>
                <li><a href="inscription.php">Sign Up <span id="QC-info"></span></a> </li>
            </ul>
        </nav>
        <?php
    }
?>


    </div>