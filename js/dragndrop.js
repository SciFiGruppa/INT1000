function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
    ev.dataTransfer.setData("image", ev.target.id);
}

function drop(ev) {
    ev.preventDefault();
    var id = ev.target.id;
    var stuff = ev.target.childNodes.length;
	if(stuff == "1"){ return; }
	if(id == "drag1"){ return; }
	if(id == "drag2"){ return; }
	if(id == "drag3"){ return; }
	if(id == "drag4"){ return; }
	if(id == "drag5"){ return; }
    var data = ev.dataTransfer.getData("image");
    ev.target.appendChild(document.getElementById(data));
}

function closepopup() {
			document.getElementById("overlay2").style.visibility = "hidden";
			document.getElementById("quiz_container2").style.visibility = "hidden";
		}
function closesvar() {
			document.getElementById("svar_container").style.visibility = "hidden";
			document.getElementById("overlaysvar").style.visibility = "hidden";
		}
function taquiz() {
			$("#quiz_container2").load("dragndrop.php");
			document.getElementById("overlay2").style.visibility = "visible";
			document.getElementById("quiz_container2").style.visibility = "visible";
		}






function check () {
		if($('#img1').find('img').length == 1 || $('#img2').find('img').length == 1 || $('#img3').find('img').length == 1 || $('#img4').find('img').length == 1 || $('#img5').find('img').length == 1){ 
				document.getElementById("overlaysvar").style.visibility = "visible";
				document.getElementById("svar_container").style.visibility = "visible";
				document.getElementById("svar").innerHTML = "Du må sette på plass alle flaggene!";
			}
			else {
				check2();
			}
		}
function check2() {
		var svar = 0;
		if($('#div1').find('#drag1').length == 1){ 
			svar++; 
			document.getElementById('div1').style.backgroundColor = "green";
		}
		else {
			document.getElementById('div1').style.backgroundColor = "red";
		}
		if($('#div2').find('#drag2').length == 1){ 
			svar++; 
			document.getElementById('div2').style.backgroundColor = "green";
		}
		else {
			document.getElementById('div2').style.backgroundColor = "red";
		}
		if($('#div3').find('#drag3').length == 1){ 
			svar++; 
			document.getElementById('div3').style.backgroundColor = "green";
		}
		else {
			document.getElementById('div3').style.backgroundColor = "red";
		}
		if($('#div4').find('#drag4').length == 1){ 
			svar++; 
			document.getElementById('div4').style.backgroundColor = "green";
		}
		else {
			document.getElementById('div4').style.backgroundColor = "red";
		}
		if($('#div5').find('#drag5').length == 1){ 
			svar++; 
			document.getElementById('div5').style.backgroundColor = "green";
		}
		else {
			document.getElementById('div5').style.backgroundColor = "red";
		}
		if (svar < 3) {var svarsum = ("Ikke bra.. Du har bare " + svar + "/" + "5 riktig");}
		if (svar >= 3) {var svarsum = ("Du har " + svar + "/" + "5 riktig");}
		if (svar == 5) {var svarsum = ("Kjempe bra! " + svar + "/" + "5 riktig");}
		document.getElementById("overlaysvar").style.visibility = "visible";
		document.getElementById("svar_container").style.visibility = "visible";
		document.getElementById("svar").innerHTML = svarsum;
}
