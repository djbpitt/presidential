<?php header('Content-Type: application/xhtml+xml');
echo "<?xml version='1.0' encoding='UTF-8'?><!DOCTYPE html>";
?>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Speeches</title>
        <link rel="stylesheet" type="text/css" href="css/home.css" />
        <script type="text/javascript" src="js/speeches.js">/**/</script>
    </head>
    <body>
        <?php virtual("inc/navbar.html"); ?>
        <div id="content" class="flex-speeches">
            <!-- flex container for all items in Speeches page -->
            <div id="speechDisplay" class="mainColumn">
                <!-- flex item for where speeches are displayed -->
                <a href="http://www.ourdocuments.gov/content.php?page=milestone" target="new">
                <img src="img/image-<?php echo rand(1,6); ?>.jpg" alt="Milestone Documents" width="100%" height="100%"/>
                </a>
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
	                       array_push($presidents[$author],'<span id="data/speeches/html/' . $filename . '">' . $title . ' (' . substr($date, 0, 4) . ')</span>');}
                ?>
                <!-- output the array values into nested lists-->
                <?php 
                foreach ($presidents as $author => $speeches) {
                    echo "<h4>$author</h4>";
                    echo "<ul>";
                        foreach ($speeches as $speech) {
                            echo "<li>$speech</li>\n";
                        }
                    echo "</ul>";
                }
                ?>
                <!-- end index display -->   
            </div>
        </div>
    </body>
</html>
