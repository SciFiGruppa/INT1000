<!DOCTYPE html>
<HTML>
	<HEAD>
		<meta charset="UTF-8">
		<meta name="keywords" content="Science, Fiction, Sci-Fi, SciFi">
		
		<link href="stylesheet.css" rel="stylesheet" type="text/css">
		
		<title>Båtførerprøven - Home</title>
	</HEAD>

	<BODY>
		<!-- MAIN CONTAINER -->
		<div id="wrapper">
		
			<!-- HEADER W. NAVBAR-->
			<header id="top">
				<h1>Discover</h1>

				<h3>Båtførerprøven</h3>
				<nav id="mainnav">
					<li><a href="index.html">Hjem</a></li>
					<li><a href="sjoveisregler.php">Sjøveisregler</a></li>
					<li><a href="Sjøvettsregler.html">Sjøvettsregler</a></li>
					<li><a href="flagg.php">Flagg</a></li>
				</nav>
			</header>
			  
			<!-- BANNER IMAGE -->
			<div class="header-container1">
    <div class="txt-container">
        
    </div>
</div>
			
			<!-- ARTICLE -->
			<article id="artikkel">
				<h2>Sjøveisregler</h2>
				

<p> 
<b>1. Hold til høyre for møtende båt</b> <br>
Når to motorbåter styrer mot hverandre, skal begge i god tid vike litt til styrbord. Båtene vil da passere hverandre på babord (venstre) side.</p>
<br>
<br>
<br>
<br>
<br>
<p> <b>2. Motorbåt viker for seilbåt</b> <br>
Når en motorbåt og en seilbåt styrer slik at det er fare for sammenstøt, skal motorbåten vike..</p>
<br>
<br>
<br>
<br>
<br>
<p> <b>3. Motorbåt og seilbåt viker for ferjer og skip</b> <br>
Når en ferje eller et skip kommer møtende har både motorbåt og seilbåt vikeplikt. Vik på siden av båten, styrbord og babord.</p>


			</article>
			
			<!-- SIDEBAR -->
			<aside id="sidebar">


				<img src="img/animasjon1.gif" width="356" height="179" title="Båtliv">
				<br>
				<img src="img/Animasjon2.gif" width="356" height="179" title="Båtliv">
				<br>

				<img src="img/Animasjon3.gif" width="356" height="179" title="Båtliv">
				
			</aside>
			
			<!-- FOOTER -->
			<footer>
				<p>Scifigruppa</p>
			</footer>
		</div> <!-- end main container -->

		<!-- QUIZ start -->
		<?php 
			require_once("php/DBApi.php"); 
			require_once("php/config.php"); 
		?>

		<div id="overlay">
			<div id="quiz_container">

				<a href="#" id="closeQuiz">Lukk</a>
				<br>
				<br>

				<form>
					<?php

					/* Printing Question HTML */
					$db = new DBApi(config());
					$questions = $db->getQuestions('quiz');

					foreach($questions as $key => $questions) {
						$currQ = $questions;
						print($currQ->getHTML());
					}
					?>

					<button type="button" id="checkAnswersButton">Sjekk svar</button>
				</form>

			</div>
		</div>

		<script src="js/jquery-1.11.2.js"></script>
		<script src="js/quiz.js"></script>
		<!-- QUIZ end -->

	</BODY>
</HTML>
