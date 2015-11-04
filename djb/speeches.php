<?php header('Content-Type: application/xhtml+xml');
echo "<?xml version='1.0' encoding='UTF-8'?>";
?>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Speeches</title>
        <link rel="stylesheet" type="text/css" href="css/home.css"/>
    </head>
    <body>
        <!--#include virtual="inc/navbar.html" -->
        <div id="content" class="flex-speeches"> <!-- flex container for all items in Speeches page -->
            <div id="speechDisplay" class="flex-speechDisplay"> <!-- flex item for where speeches are displayed -->
                <p>links under index do not work yet</p>
                
            </div>
            <div id="speechIndex" class="flex-speechIndex"> <!-- flex item for Index -->
                <h2>Index of Speeches</h2>
<ul>
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
	echo "<li>Processing $author: $title</li>\n";
	if (array_key_exists($author, $presidents)) {
		echo "<li>Key exists for $author</li>\n";
	} else {
		echo "<li>Adding key for $author\n</li>";
		$presidents[$author] = array();
	}
	array_push($presidents[$author],$date . ': ' . $title);
}
?>
                </ul>
<?php
	echo "<p>";
	var_dump($presidents);
	echo "</p>\n";
?>
            </div>
        </div>
    </body>
</html>
