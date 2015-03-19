
<html>
<head>
<meta charset="UTF-8">
<style>
#div1, #div2, #div3, #div4, #div5
{clear:both; width:50px; height:50px; margin:10px;padding:10px;border:1px solid #aaaaaa;}
#flagg {height:54px;}
#drag1, #drag2, #drag3, #drag4, #drag5 
{
	width:50px; height:50px;
}

</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<script>
function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
}

function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    ev.target.appendChild(document.getElementById(data));
}

function check() {
	var svar = 0;
	if($('#div1').find('#drag1').length == 1){ svar++; }
	if($('#div2').find('#drag2').length == 1){ svar++; }
	if($('#div3').find('#drag3').length == 1){ svar++; }
	if($('#div4').find('#drag4').length == 1){ svar++; }
	if($('#div5').find('#drag5').length == 1){ svar++; }

	if (svar < 3) {
		var svarsum = ("Ikke bra.. Du har bare " + svar + "/" + "5 riktig");
	};
	if (svar >= 3) {
		var svarsum = ("Du har " + svar + "/" + "5 riktig");
	};
	if (svar == 5) {
		var svarsum = ("Kjempe bra! " + svar + "/" + "5 riktig");
	};
	
	document.getElementById("svar").innerHTML = svarsum;
}

</script>
</head>
<body>
<h3>Plasser flaggene på riktig sted.</h3>
<p id="flagg">
<?php 
$servername = "localhost";
$username = "root";
$password = "scifi";
$dbname = "885666";

$con=mysqli_connect($servername, $username, $password, $dbname);
if (mysqli_connect_errno()) {
 	echo "Failed to connect to MySQL: " . mysqli_connect_error();
	}

while ($count <= 5) {
	$rnd = rand(1,25);
	if (!in_array($rnd, $quiz)) 
		{
	    	$quiz[] = $rnd;
			$count++;
		}
}

$result = mysqli_query($con,"SELECT flaggnr, flaggnavn, beskrivelse
                            FROM flagg
                            Where (flagg.flaggnr=$quiz[0] OR flagg.flaggnr=$quiz[1] OR flagg.flaggnr=$quiz[2] OR flagg.flaggnr=$quiz[3] OR flagg.flaggnr=$quiz[4])");

 while($row = mysqli_fetch_array($result)) 
                    {
                    	$flaggnr[] = $row['flaggnr'];
                    	$flaggnavn[] = $row['flaggnavn'];
                    	$beskrivelse[] = $row['beskrivelse'];
                    }

echo "<img src='img/flagg/$flaggnavn[0]' draggable='true' ondragstart='drag(event)' id='drag1'>";
echo "<img src='img/flagg/$flaggnavn[1]' draggable='true' ondragstart='drag(event)' id='drag2'>";
echo "<img src='img/flagg/$flaggnavn[2]' draggable='true' ondragstart='drag(event)' id='drag3'>";
echo "<img src='img/flagg/$flaggnavn[3]' draggable='true' ondragstart='drag(event)' id='drag4'>";
echo "<img src='img/flagg/$flaggnavn[4]' draggable='true' ondragstart='drag(event)' id='drag5'>";
echo "</p><p>";

echo "<table>";
echo "<tr><td id='spm1'>$beskrivelse[0]</td><td><div id='div1' ondrop='drop(event)' ondragover='allowDrop(event)'></div></td></tr>";
echo "<tr><td id='spm2'>$beskrivelse[1]</td><td><div id='div2' ondrop='drop(event)' ondragover='allowDrop(event)'></div></td></tr>";
echo "<tr><td id='spm3'>$beskrivelse[2]</td><td><div id='div3' ondrop='drop(event)' ondragover='allowDrop(event)'></div></td></tr>";
echo "<tr><td id='spm4'>$beskrivelse[3]</td><td><div id='div4' ondrop='drop(event)' ondragover='allowDrop(event)'></div></td></tr>";
echo "<tr><td id='spm5'>$beskrivelse[4]</td><td><div id='div5' ondrop='drop(event)' ondragover='allowDrop(event)'></div></td></tr>";

?>
<tr><td><input type="button" value="Reload Page" onClick="window.location.reload()"></td><td align="center"><input type="button" value="Submit" onclick="check()"></td></tr>

</table>

</p>


<p>
	<a id="svar"></a>
</p>



</body>
</html>

