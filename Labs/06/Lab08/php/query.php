<?php
    include("dbcon.php");
    $categoryName = $categoryDes = $categoryImageName ="";
    $categoryNameErr = $categoryDesErr = $categorImageErr = "";
    if(isset($_POST["addcategory"])){
        $categoryName = $_POST["cname"];
        $categoryDes = $_POST["cdes"];
        $categoryImageName = $_FILES["cimage"]["tmp_name"];
        $categorImageTmpName = $_FILES["cimage"]["tmp_name"];
        $destination = "images/".$categoryImageName;
        $extension = pathinfo(path: $categoryImageName,flags: PATHINFO_EXTENSION);
        if(empty($categoryName)){
            $categoryNameErr = "category Name is Required";
        }
        if(empty($categoryImageName)){
            $categorImageErr = "Category Image is Required";
        }
        if(empty($categoryDes)){
            $categoryDesErr = "Category Discription is Required";
        }
        else{
            $allowedExtensionArray = ["png","svg","jpg","jpeg","webp"];
            if(!in_array($extension, $allowedExtensionArray)){
                $categoryImageErr = "Invalid Extension";
            }
        }
        if(empty($categoryNameErr) && empty($categoryImageErr) && empty($categoryDesErr)){
            if(move_uploaded_file($categoryImageName, $destination)){
                $query = $pdo->prepare("insert into categories (name,des,image) values(:cName, :cDes, :cImage)");
                $query->bindParam("cName",$categoryName) ;
                $query->bindParam("cDes",$categoryDes) ;
                $query->bindParam("cImage",$categoryImageName) ;
                $query->execute();
                echo "<script>alert('category edded successfully'); location.assign('add.php')</script>";
            }
        }
    }
    // update category work
    
?>