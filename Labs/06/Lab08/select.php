<!doctype html>
<html lang="en">
  <head>
    <title>Title</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  </head>
  <body>
    <div class="container">
        <table class="table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Description</th>
                <th>Action</th>

            </tr>
        </thead>
        <tbody>
            <?php $query = $pdo->query("select * from category");
             $alCatagories = $query->fetchAll(PDO::FETCH_ASSOC);
             foreach ($alCatagories as $Catagories) {
                ?>
                 <try>
                    <td><?php echo $category['id']?></td>
                    <td><?php echo $category['name']?></td>
                    <td><?php echo $category['des']?></td>
                    <td><img height="100px" src="images/"<?php echo $category['image'] ?>alt=""></td>
                    <td>
                        <a href="editCategory.php?cId=<?php echo $category['id']?>">Edit</a>
                    </td>

                 </try>
                 <?php
             }
            ?>
            <tr>
                <td scope="row"></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td scope="row"></td>
                <td></td>
                <td></td>
            </tr>
        </tbody>
    </table>
    </div>
      
  </body>
</html>