<?php 
require_once('config.inc.php');

class UserDB{

    private static $connection;
    private static $settings = array(
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8",
    );


    function __construct(){
        if (!isset(self::$connection)) {
            try {
                self::$connection = new PDO(
                        DBCONNSTRING,
                        DBUSER,
                        DBPASS,
                        self::$settings
                );
            } catch (PDOException $e) {
                throw new PDOException($e->getMessage(), (int) $e->getCode());
            }
        }
    }

    public static function register($firstName, $lastName, $email, $password){
        try{
            $sql = "SELECT id, firstName, lastName FROM profiles WHERE email = :email";
            $statement = self::$connection->prepare($sql);
            $statement->bindParam(':email', $email);
            $statement->execute();
            $result = $statement->fetchColumn();

            if ($result > 0) {
                // Username already exists
                echo 'Username exists, please choose another!';
            } else {
                // Username doesn't exist, insert new account
                $pass = password_hash($password, PASSWORD_BCRYPT);
                $sql = "INSERT INTO profiles (firstName, lastName, email, password) VALUES (:firstName, :lastName, :email, '$pass')";
                $statement = self::$connection->prepare($sql);

                $statement->bindParam(':firstName', $firstName);
                $statement->bindParam(':lastName', $lastName);
                $statement->bindParam(':email', $email);

                $statement->execute();
                echo 'You have successfully registered, you can now login!';
            }
        }
        catch(PDOException $e){
            echo 'Could not prepare statement!';
            die( $e->getMessage() );
        }
        finally {
            $pdo = null;
        }
    }

    public static function login($email, $password){
        try{
            $sql = "SELECT id, firstName, lastName, email, password FROM profiles WHERE email = :email";
            $statement = self::$connection->prepare($sql);
            $statement->bindParam(':email', $email);
            $statement->execute();
            $result = $statement->fetch();

            if ($result != NULL) {
                // Username already exists
                if(password_verify($password, $result['password'])){
                    // Verification success! User has logged-in!
                    // Create sessions, so we know the user is logged in, they basically act like cookies but remember the data on the server.
                    session_regenerate_id();
                    $_SESSION['id'] = $result['id'];
                    $_SESSION['firstName'] = $result['firstName'];
                    $_SESSION['lastName'] = $result['lastName'];
                    $_SESSION['email'] = $result['email'];
                    $_SESSION['loggedin'] = TRUE;
                    return 1;
                }else{
                    // echo("Incorrect username or password.");
                    return 0;
                }
                
            }else{
                // echo("Incorrect username or password.");
                return 0;
            }



        }catch(PDOException $e){
            echo("Incorrect username or password.");
            die( $e->getMessage() );
        }
        finally {
            $pdo = null;
        }
    }
}

?>