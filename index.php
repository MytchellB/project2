<?php
    session_start();
    include "dbConnection.php";
    $dbConn = getDatabaseConnection("sports");
    
    if (!isset($_SESSION["scart"])) {
        $_SESSION["scart"] = array();
    } else {
        $newItem = array();
        if (isset($_POST["itemName"])) {
            $found = false;
            foreach ($_SESSION["scart"] as $item) {
                if (($item["id"] == $_POST["itemId"]) && ($item["catId"] == $_POST["itemCatId"])) {
                    $found = true;
                    break;
                }
            }
            if (!$found) {
                $newItem["id"] = $_POST["itemId"];
                $newItem["catId"] = $_POST["itemCatId"];
                $newItem["name"] = $_POST["itemName"];
                $newItem["image"] = $_POST["itemImage"];
                $newItem["price"] = $_POST["itemPrice"];
                array_push($_SESSION["scart"], $newItem);
            }
            if (!empty(getCategoryId())) {
                $catId = getCategoryId();
            } else {
                $catId = $_POST["itemCatId"];
            }
            if (!empty($_GET["playerName"])) {
                $playerName = $_GET["playerName"];
            } else {
                $playerName = "";
            }
            $location = "Location: index.php?id=".$_POST["itemId"]."&playerName=$playerName&catId=$catId&submit=".$_GET["submit"];
            if (isset($_GET["orderBy"])) {
                $orderBy = $_GET["orderBy"];
                $location .= "&orderBy=$orderBy";
            }
            if (isset($_GET["team"])) {
                $team = $_GET["team"];
                $location .= "&team=$team";
            }
            header($location);
        }
    }
    
    function selectCategory($catId) {
        if ($_GET["catId"] == $catId) {
            return "selected";
        }
    }
    
    function checkRadio($orderBy) {
        if ($_GET["orderBy"] == $orderBy) {
            echo "checked";
        }
    }
    
    function checkCheckBox() {
        if ($_GET["team"] == "on") {
            echo "checked";
        }
    }
    
    function displayCategories() {
        global $dbConn;
        $sql = "SELECT * FROM sports_category";
        $stmt = $dbConn->prepare($sql);
        $stmt->execute();
        $records = $stmt->fetchAll(PDO::FETCH_ASSOC);
        
        $i = 1;
        foreach ($records as $record) {
            if (!empty(getCategoryId())) {
                if ($i == getCategoryId()) {
                    $selected = "selected";
                } else {
                    $selected = "";
                }
            } else {
                $selected = selectCategory($record["catId"]);
            }
            
            echo "<option value='".$record['catId']."' ".$selected.">".$record['catName'] . "</option>";
            $i++;
        }
    }
    
    function getCategoryId() {
        global $dbConn;
        $playerName = $_GET["playerName"];
        if (!empty($playerName)) {
            $sql = "SELECT * FROM sports_players
                    WHERE playerName = '$playerName'";
            $stmt = $dbConn->prepare($sql);
            $stmt->execute();
            $records = $stmt->fetchAll(PDO::FETCH_ASSOC);
            // echo $sql;
            // print_r($records);
            $categoryId = $records[0]["catId"];
        }
        return $categoryId;
    }
    
    function displaySportPlayers() {
        global $dbConn;
        $playerName = $_GET["playerName"];
        $catId = $_GET["catId"];
        $newCatId = getCategoryId();
        $orderBy = $_GET["orderBy"];
        
        if (!empty($playerName)) {
            $sql = "SELECT * FROM sports_players
                    WHERE playerName = '$playerName'";
        } else {
            $sql = "";
        }
        if (!empty($newCatId)) {
            $catId = $newCatId;
        }
        if (!empty($sql)) {
            if (!empty($catId)) {
                $sql .= " AND catId = $catId";
            }
            if (isset($orderBy)) {
                $sql .= " ORDER BY $orderBy";
            }
        } else {
            if (!empty($catId)) {
                $sql .= "SELECT * FROM sports_players
                    WHERE catId = $catId";
                if (isset($orderBy)) {
                    $sql .= " ORDER BY $orderBy";
                }
            }
        }
        if (!empty($sql)) {
            // echo $sql."<br>";
            $stmt = $dbConn->prepare($sql);
            $stmt->execute();
            $records = $stmt->fetchAll(PDO::FETCH_ASSOC);
            // print_r($records);
            if (empty($records)) {
                echo "<span class='error'>Player not found. Try again</span><br>";
            } else {
                foreach ($records as $record) {
                    $itemId = $record["playerId"];
                    $itemCatId = $record["catId"];
                    $itemName = $record["playerName"];
                    $itemImage = $record["playerImage"];
                    $itemTeam = $record["playerTeam"];
                    $itemPrice = $record["price"];
                    echo "<tr>";
                    echo "<td><a href='playerInfo.php?name=$itemName&image=".$itemImage."'>".$itemName."</a></td>";
                    if (isset($_GET["team"])) {
                        if (!empty($itemTeam)) {
                            echo "<td>$itemTeam</td>";
                        }
                    }
                    if ($_GET["id"] == $itemId) {
                        $class = "added";
                        $value = "Added";
                    } else {
                        $class = "";
                        $value = "Add";
                    }
                    echo "<td><form id='add' method='POST'>
                    <input type='hidden' name='itemId' value='$itemId'>
                    <input type='hidden' name='itemCatId' value='$itemCatId'>
                    <input type='hidden' name='itemName' value='$itemName'>
                    <input type='hidden' name='itemImage' value='$itemImage'>
                    <input type='hidden' name='itemPrice' value='$itemPrice'>
                    <input class='$class' type='submit' value='$value'>
                    </form></td>";
                    echo "</tr>";
                }
            }
        }
    }
?>

<!DOCTYPE html>
<html>
    <head>
        <title>Sports Cards</title>
        <link rel="stylesheet" href="css/styles.css" type="text/css" />
    </head>
    <body>
        <a href="scart.php">Cart</a> <br><br>
        <form>
            Player Name: <input type="text" name="playerName" value="<?=$_GET['playerName']?>"><br>
            Sport: 
            <select name="catId">
                <option value="">- None -</option>
                <?= displayCategories() ?>
            </select> <br>
            Order Results By: 
            <input type="radio" id="teamOrd" name="orderBy" value="playerTeam" <?=checkRadio("playerTeam")?>>
            <label for="teamOrd">Player Team</label>
            <input type="radio" id="nameOrd" name="orderBy" value="playerName" <?=checkRadio("playerName")?>>
            <label for="nameOrd">Player Name</label><br>
            <label for="team">Display player's team</label>
            <input type="checkbox" id="team" name="team" <?=checkCheckBox()?>><br><br>
            <input type="submit" name="submit" value="Submit">
        </form><br>
        
        <table>
        <?php
            if (isset($_GET["submit"])) {
                displaySportPlayers();
            }
        ?>
        </table>
    </body>
</html>