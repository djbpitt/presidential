<?php header('Content-Type: application/xhtml+xml');
echo "<?xml version='1.0' encoding='UTF-8'?><!DOCTYPE html>";
?>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Speeches</title>
        <link rel="stylesheet" type="text/css" href="css/home.css" />
    </head>
    <body>
        <!--#include virtual="inc/navbar.html" -->
        <div id="content" class="flex-speeches">
            <!-- flex container for all items in Speeches page -->
            <div id="speechDisplay" class="mainColumn">
                <!-- flex item for where speeches are displayed -->
                <p><b>links under index do not work yet</b></p>
                <p>Lorem ipsum lacinia metus phasellus interdum curabitur semper neque ullamcorper,
                    nam non tempor cras vestibulum quam lacinia euismod, senectus duis conubia
                    mauris ut dictum cursus nam est hac pellentesque curabitur ac arcu porttitor,
                    tincidunt porttitor ultricies integer vel duis, malesuada ultricies nisi dui
                    est. Sem dapibus ad odio placerat sollicitudin nec nisi, platea mi mattis justo
                    metus urna, bibendum facilisis sapien tellus habitasse cursus sit primis
                    adipiscing vulputate rhoncus lorem.</p>
                <p>Semper aliquam gravida convallis tempus nibh sapien consectetur consequat,
                    maecenas inceptos sem id at mi dapibus leo sem lacinia et lobortis dictumst
                    venenatis egestas consectetur duis porttitor mi, risus lorem suspendisse odio
                    vestibulum dolor bibendum donec proin augue neque est, placerat tempus lacus
                    pellentesque velit rhoncus ipsum pharetra suspendisse primis. Integer platea
                    diam fames erat porttitor sem diam vitae volutpat aptent vulputate, blandit
                    tellus orci sem sit etiam ac massa gravida praesent amet at, potenti bibendum
                    mollis platea fringilla laoreet justo pellentesque dictumst posuere aliquam quam
                    mauris semper inceptos nibh amet aptent metus porttitor, at est elementum odio
                    sem pellentesque bibendum laoreet. </p>
            </div>
            <div id="speechIndex" class="flex-speechIndex">
                <!-- flex item for Index -->
                <h2>Index of Speeches</h2>
                <!-- read through speeches folder and enter values into $presidents array-->
                <?php 
                    $dir = 'data/speeches/';
                    $presidents = array();
                        foreach (glob($dir . '*.xml') as $file) {
	                       $filename = substr($file,14);
                           $dom = new DOMDocument();
                           $dom->load($file,LIBXML_NOWARNING);
                           $xpath = new DOMXPath($dom);
                           $title = $xpath->query('//title')->item(0)->nodeValue;
	                       $author = $xpath->query('//author')->item(0)->nodeValue;
	                       $date = $xpath->query('//when')->item(0)->nodeValue;
	                           if (array_key_exists($author, $presidents)) {
	                               } 
	                           else {
		                          $presidents[$author] = array(); }
	                       array_push($presidents[$author],$title . ' (' . substr($date, 0, 4) . ')');}
                ?>
                <!-- output the array values into nested lists-->
                <?php 
                foreach ($presidents as $author => $speeches) {
                    echo "<h4>$author</h4>";
                    echo "<ul>";
                        foreach ($speeches as $speech) {
                            echo "<li><a href='speeches.php'>$speech</a></li>\n";
                        }
                    echo "</ul>";
                }
                ?>
                <!-- end index display -->   
            </div>
        </div>
    </body>
</html>
