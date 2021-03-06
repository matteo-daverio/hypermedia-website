<?php
/*
* Shared class to handle in a secure way the connection and the query to the db with php
*/

class SecureDB {
        // The database connection
        protected static $connection;
        protected static $debug = false;

        /**
        * Enable debug echos 
        * 
        */
        public function enableDebug(){
            self::$debug = true;
            return null;
        }
        /**
         * Connect to the database
         * 
         * @return bool false on failure / mysqli MySQLi object instance on success
         */
        public function connect() {    
            // Try and connect to the database
            if(!isset(self::$connection)) {
                // Load configuration as an array. Use the actual location of your configuration file
                $config = parse_ini_file('dbcredential.ini'); 
                
                if(self::$debug === true){
                    echo "<br>username: " . $config['username'];
                    echo "<br>password: " . $config['password'];
                    echo "<br>dbname: " . $config['dbname'];   
                }
                self::$connection = new mysqli('localhost',$config['username'],$config['password'],$config['dbname']);
                //set UFT-8 to allow special char set
                self::$connection -> query('SET CHARACTER SET utf8');
            }

            // If connection was not successful, handle the error
            if(self::$connection === false) {
                if(self::$debug ===  true){
                    die("<br>Connection failed: " . $conn->connect_error);
                }
                return false;
            } 
            else if(self::$debug ===  true){
                    echo "<br>Db connected<br>";
            }
            return self::$connection;
        }

        /**
         * Query the database
         *
         * @param $query The query string
         * @return mixed The result of the mysqli::query() function
         */
        public function query($query) {
            // Connect to the database
            $connection = $this -> connect();
            // Query the database
            $result = $connection -> query($query);
 
            //we must set this header to allow to retrive data cross domain (otherwise it doesn't work with phonegap)
            header('Access-Control-Allow-Origin: *');
            return $result;
        }

        /**
         * Fetch rows from the database (SELECT query)
         *
         * @param $query The query string
         * @return bool False on failure / array Database rows on success
         */
        public function select($query) {
            $rows = array();
            $result = $this -> query($query);
            if($result === false) {
                return false;
            }
            while ($row = $result -> fetch_assoc()) {
                $rows[] = $row;
            }
            return $rows;
        }

        /**
         * Fetch the last error from the database
         * 
         * @return string Database error message
         */
        public function error() {
            $connection = $this -> connect();
            return $connection -> error;
        }

        /**
         * Quote and escape value for use in a database query
         *
         * @param string $value The value to be quoted and escaped
         * @return string The quoted and escaped string
         */
        public function quote($value) {
            $connection = $this -> connect();
            return "'" . $connection -> real_escape_string($value) . "'";
        }
    }
?>
