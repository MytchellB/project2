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
            header("Location: index.php?catId=".$_GET["catId"]."&submit=".$_GET["submit"]);
        }
    }
    
    function selectCategory($catId) {
        if ($_GET["catId"] == $catId) {
            return "selected";
        }
    }
    
    function displayCategories() {
        global $dbConn;
        $sql = "SELECT * FROM sports_category";
        $stmt = $dbConn->prepare($sql);
        $stmt->execute();
        $records = $stmt->fetchAll(PDO::FETCH_ASSOC);
        
        foreach ($records as $record) {
            echo "<option value='".$record["catId"]."' ".selectCategory($record["catId"]).">".$record["catName"] . "</option>";
        }
    }
    
    function displaySportPlayers() {
        global $dbConn;
        
        switch ($_GET["catId"]) {
            case "1":
                $table = "sports_football";
                break;
            case "2":
                $table = "sports_baseball";
                break;
            case "3":
                $table = "sports_basketball";
                break;
            case "4":
                $table = "sports_golf";
                break;
            default:
                $table = "";
        }
        if (!empty($table)) {
            $sql = "SELECT * FROM $table";
            $stmt = $dbConn->prepare($sql);
            $stmt->execute();
            $records = $stmt->fetchAll(PDO::FETCH_ASSOC);
            // print_r($records);
            
            foreach ($records as $record) {
                $itemId = $record["playerId"];
                $itemCatId = $record["catId"];
                $itemName = $record["playerName"];
                $itemImage = $record["playerImage"];
                $itemPrice = $record["price"];
                echo "<tr>";
                echo "<td><a href='playerInfo.php?name=$itemName&image=".$itemImage."'>".$itemName."</a></td>";
                echo "<td><form id='add' method='POST'>
                <input type='hidden' name='itemId' value='$itemId'>
                <input type='hidden' name='itemCatId' value='$itemCatId'>
                <input type='hidden' name='itemName' value='$itemName'>
                <input type='hidden' name='itemImage' value='$itemImage'>
                <input type='hidden' name='itemPrice' value='$itemPrice'>
                <input type='submit' value='Add'>
                </form></td>";
                echo "</tr>";
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
            Sport: 
            <select name="catId">
                <option value="">- None -</option>
                <?= displayCategories() ?>
            </select>
            <input type="submit" name="submit" value="Submit">
        </form> <br>
        
        <table>
        <?php
            if (isset($_GET["submit"])) {
                displaySportPlayers();
            }
        ?>
        </table>
    </body>
</html>