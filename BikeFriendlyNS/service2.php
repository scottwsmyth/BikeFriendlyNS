<?php

    //Connect to the database
    
    $connect = mysqli_connect("localhost","scottws1","Ha1992;;","scottws1_news");
    
    if (mysqli_connect_errno())
    {
        echo "Failed to connect to MySQL: " . mysqli_connect_error();
    }
    
    //After connecting to the database we need to query it
    
    $query = "SELECT * FROM blog_post";
    
    //Execute the query
    
    $result = mysqli_query($connect, $sql);
    
    //Retrieve the data after executing the query
    
    if ($result = mysqli_query($connect, $query))
    {
        // If so, then create a results array and a temporary one
        // to hold the data
        $resultArray = array();
        $tempArray = array();
        
        // Loop through each row in the result set
        while($row = $result->fetch_object())
        {
            // Add each row into our results array
            $tempArray = $row;
            array_push($resultArray, $tempArray);
        }
        
        // Finally, encode the array to JSON and output the results
        echo json_encode($resultArray);
    }
    
    //Convert to JSON
    
    echo json_encode($resultArray);
    
    mysqli_close($connect)
    
?>
