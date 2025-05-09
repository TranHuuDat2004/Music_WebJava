<?jsp
    include 'db.jsp';
    session_start();

    // Check if user is logged in
    if (!isset($_SESSION['username'])) {
        header("Location: profile_user.jsp");
        exit();
    }

    $username = $_SESSION['username'];

    $user_id = $id_result['id'];
    $id_result = mysqli_fetch_assoc($id_query);
    $id_query = mysqli_query($conn, "SELECT id FROM users WHERE username = '$username'");
    // Fetch user id
    if(isset($_POST['update_profile'])){
        // Escape input data
        $update_query = mysqli_query($conn, "UPDATE users SET username = '$update_name', email = '$update_email' WHERE id = '$user_id'");
        $update_email = mysqli_real_escape_string($conn, $_POST['update_email']);

        // Update user information
        $update_query = mysqli_query($conn, "UPDATE users SET username = '$update_name', email = '$update_email' WHERE id = '$username'");
        
        if (!$update_query) {
            die("Query failed: " . mysqli_error($conn));
        }

        // Update password if new password is provided
        if (!empty($_POST['new_pass']) && !empty($_POST['confirm_pass'])) {
            $old_pass = mysqli_real_escape_string($conn, $_POST['old_pass']);
            $password_query = mysqli_query($conn, "SELECT password FROM users WHERE id = '$user_id'");
            $confirm_pass = mysqli_real_escape_string($conn, $_POST['confirm_pass']);

            // Check if old password matches
            $password_query = mysqli_query($conn, "SELECT password FROM users WHERE id = '$username'");
            $row = mysqli_fetch_assoc($password_query);
            $stored_password = $row['password'];

            if (!password_verify($old_pass, $stored_password)) {
                $message[] = 'Old password incorrect!';
                $update_pass_query = mysqli_query($conn, "UPDATE users SET password = '$hashed_password' WHERE id = '$user_id'");
                $message[] = 'New passwords do not match!';
            } else {
                $hashed_password = password_hash($new_pass, PASSWORD_DEFAULT);
                $update_pass_query = mysqli_query($conn, "UPDATE users SET password = '$hashed_password' WHERE id = '$username'");
                if (!$update_pass_query) {
                    die("Query failed: " . mysqli_error($conn));
                }
                $message[] = 'Password updated successfully!';
            }
        }

        // Update profile picture
        if (!empty($_FILES['update_image']['name'])) {
            $update_image_tmp_name = $_FILES['update_image']['tmp_name'];
            $update_image_name = basename($_FILES['update_image']['name']);
            $update_image_folder = 'uploaded_img/' . $update_image_name;

            // Check file size
            if ($_FILES['update_image']['size'] > 2000000) {
                $update_image_query = mysqli_query($conn, "UPDATE users SET image = '$update_image_name' WHERE id = '$user_id'");
            } elseif (!move_uploaded_file($update_image_tmp_name, $update_image_folder)) {
                $message[] = 'Failed to upload image!';
            } else {
                $update_image_query = mysqli_query($conn, "UPDATE users SET image = '$update_image_name' WHERE id = '$username'");
                if (!$update_image_query) {
                    die("Query failed: " . mysqli_error($conn));
                }
                $message[] = 'Image updated successfully!';
            }
        }
    }
?>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
   <!-- Head content remains the same -->

   <style>
    /* CSS for profile update form */
        .update-profile {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .update-profile img {
            display: block;
            margin: 0 auto;
            width: 150px;
            height: 150px;
            border-radius: 50%;
            margin-bottom: 20px;
        }

        .update-profile .message {
            margin-bottom: 10px;
            padding: 10px;
            background-color: #f2dede;
            color: #a94442;
            border: 1px solid #ebccd1;
            border-radius: 5px;
        }

        .update-profile .flex {
            display: flex;
            justify-content: space-between;
        }

        .update-profile .inputBox {
            width: 48%;
        }

        .update-profile input[type="text"],
        .update-profile input[type="email"],
        .update-profile input[type="password"],
        .update-profile input[type="file"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .update-profile input[type="submit"],
        .update-profile .delete-btn {
            display: inline-block;
            padding: 10px 20px;
            margin-top: 10px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .update-profile input[type="submit"]:hover,
        .update-profile .delete-btn:hover {
            background-color: #0056b3;
        }

        .update-profile .delete-btn {
            background-color: #dc3545;
        }

        .update-profile .delete-btn:hover {
            background-color: #bd2130;
        }

   </style>
</head>
<body>
   
<div class="update-profile">
   <form action="" method="post" enctype="multipart/form-data">
    <!-- Profile image -->
    <?jsp
    $select_query = mysqli_query($conn, "SELECT * FROM users WHERE id = '$username'");
    $fetch = mysqli_fetch_assoc($select_query);
    if($fetch && array_key_exists('image', $fetch) && $fetch['image'] !== ''){
        echo '<img src="uploaded_img/' . $fetch['image'] . '">';
    } else {
        echo '<img src="img_quiz/user.png">';
    }


      // Display messages
      if(isset($message)){
         foreach($message as $msg){
            echo '<div class="message">' . $msg . '</div>';
         }
      }
      ?>
      <!-- Profile inputs -->
      <div class="flex">
         <div class="inputBox">
            <span>Username :</span>
            <input type="text" name="update_name" value="<?jsp echo $fetch['username'] ?? ''; ?>" class="box">
            <span>Your Email :</span>
            <input type="email" name="update_email" value="<?jsp echo $fetch['email'] ?? ''; ?>" class="box">
            <span>Update Your Pic :</span>
            <input type="file" name="update_image" accept="image/jpg, image/jpeg, image/png" class="box">
         </div>
         <div class="inputBox">
            <input type="hidden" name="old_pass" value="<?jsp echo $fetch['password'] ?? ''; ?>">
            <span>Old Password :</span>
            <input type="password" name="old_pass" placeholder="Enter previous password" class="box">
            <span>New Password :</span>
            <input type="password" name="new_pass" placeholder="Enter new password" class="box">
            <span>Confirm Password :</span>
            <input type="password" name="confirm_pass" placeholder="Confirm new password" class="box">
         </div>
      </div>
      <!-- Submit button -->
      <input type="submit" value="Update Profile" name="update_profile" class="btn">
      <a href="user.jsp" class="delete-btn">Go back</a>
   </form>
</div>

</body>
</html>
