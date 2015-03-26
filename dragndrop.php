
<a href="#close" id="btn-close" onClick="closepopup()">×</a>
<h3>Plasser flaggene riktig sted.</h3>

<?php 
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "106241";

$con=mysqli_connect($servername, $username, $password, $dbname);
if (mysqli_connect_errno()) { echo "Failed to connect to MySQL: " . mysqli_connect_error();}

while ($count <= 5) { $rnd = rand(1,25); if (!in_array($rnd, $quiz)) { $quiz[] = $rnd; $count++; }}

$result = mysqli_query($con,"SELECT flaggnr, flaggnavn, beskrivelse FROM flagg Where (flagg.flaggnr=$quiz[0] OR flagg.flaggnr=$quiz[1] OR flagg.flaggnr=$quiz[2] OR flagg.flaggnr=$quiz[3] OR flagg.flaggnr=$quiz[4])");

 while($row = mysqli_fetch_array($result)) 
                    {
                    	$test = utf8_encode($row['beskrivelse']);
                    	$flaggnr[] = $row['flaggnr'];
                    	$flaggnavn[] = $row['flaggnavn'];
                    	$beskrivelse[] = $test;
                    }
echo "<table id='dragndrop'><tr>";
echo "<td><div id='img1' ondrop='drop(event)' ondragover='allowDrop(event)'><img src='img/flagg/$flaggnavn[0]' draggable='true' ondragstart='drag(event)' id='drag1'></div></td>";
echo "<td><div id='img2' ondrop='drop(event)' ondragover='allowDrop(event)'><img src='img/flagg/$flaggnavn[1]' draggable='true' ondragstart='drag(event)' id='drag2'></div></td>";
echo "<td><div id='img3' ondrop='drop(event)' ondragover='allowDrop(event)'><img src='img/flagg/$flaggnavn[2]' draggable='true' ondragstart='drag(event)' id='drag3'></div></td>";
echo "<td><div id='img4' ondrop='drop(event)' ondragover='allowDrop(event)'><img src='img/flagg/$flaggnavn[3]' draggable='true' ondragstart='drag(event)' id='drag4'></div></td>";
echo "<td><div id='img5' ondrop='drop(event)' ondragover='allowDrop(event)'><img src='img/flagg/$flaggnavn[4]' draggable='true' ondragstart='drag(event)' id='drag5'></div></td>";
echo "</tr></table>";
echo "<table id='dragndrop'>";
echo "<tr><td id='spm1'>$beskrivelse[2]</td><td><div id='div3' ondrop='drop(event)' ondragover='allowDrop(event)'></div></td></tr>";
echo "<tr><td id='spm2'>$beskrivelse[1]</td><td><div id='div2' ondrop='drop(event)' ondragover='allowDrop(event)'></div></td></tr>";
echo "<tr><td id='spm3'>$beskrivelse[4]</td><td><div id='div5' ondrop='drop(event)' ondragover='allowDrop(event)'></div></td></tr>";
echo "<tr><td id='spm4'>$beskrivelse[3]</td><td><div id='div4' ondrop='drop(event)' ondragover='allowDrop(event)'></div></td></tr>";
echo "<tr><td id='spm5'>$beskrivelse[0]</td><td><div id='div1' ondrop='drop(event)' ondragover='allowDrop(event)'></div></td></tr>";
?>
</table>
<div><input type="button" value="Svar" onclick="check()"></div>
<div id="svar_container"><a href="#close" id="btn-close" onClick="closesvar()">×</a><br><a id="svar"></a><p><input type="button" value="Ny Quiz" onclick="taquiz()"></p></div>
<div id="overlaysvar"></div>


