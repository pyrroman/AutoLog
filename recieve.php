<?php

$name = $_GET["name"];
$content = $_GET["content"];

// If the file already exist, we don't need the <h1> title anymore.
if(file_exists($name))
{
	$pos = strrpos($content, "</h1>");
	$content = substr($content, $pos+5, strlen($content) - $pos);
}

$file = fopen($name,"a+");
fwrite($file, $content);
fclose($file);

?>
