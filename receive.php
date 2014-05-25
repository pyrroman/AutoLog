
<?php

function get_client_ip() {
    $ipaddress = '';
    if (getenv('HTTP_CLIENT_IP'))
        $ipaddress = getenv('HTTP_CLIENT_IP');
    else if(getenv('HTTP_X_FORWARDED'))
        $ipaddress = getenv('HTTP_X_FORWARDED');
    else if(getenv('HTTP_FORWARDED_FOR'))
        $ipaddress = getenv('HTTP_FORWARDED_FOR');
    else if(getenv('HTTP_FORWARDED'))
       $ipaddress = getenv('HTTP_FORWARDED');
    else if(getenv('REMOTE_ADDR'))
        $ipaddress = getenv('REMOTE_ADDR');
    else
        $ipaddress = 'UNKNOWN';
    return $ipaddress;
}

$content = $_GET["content"];
$ip = get_client_ip();

// If the file already exist, we don't need the <h1> title anymore.
if(file_exists($ip))
{
	$pos = strrpos($content, "</h1>");
	$content = substr($content, $pos+5, strlen($content) - $pos);
}

$file = fopen($ip,"a+");
fwrite($file, $content);
fclose($file);

?>
