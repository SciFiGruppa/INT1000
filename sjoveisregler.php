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
					<li><a href="Flagg.html">Flagg</a></li>
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
				
				<p>Velkommen til Båtførerprøven.no! Her har du muligheten til å lære og teste diverse om båt, slik at du stiller sterkest mulig når du befinner deg ute på havet. Vet du hva de diverse flaggene betyr? Kan du grunnlegende kunnskaper når det gjelder å ferdes på havets blå bølger? Lær og test her!</p>
				</article>
			
			<!-- SIDEBAR -->
			<aside id="sidebar">
				<img src="img/lys.jpg" width="356" height="179" title="Båtliv">
				
			</aside>
			
			<!-- FOOTER -->
			<footer>
				<p>Scifigruppa</p>
			</footer>
		</div> <!-- end main container -->

		<!-- QUIZ start -->
		<button type="button" id="startQuizButton">Start Quiz</button>

		<?php require_once("php/DBApi.php"); ?>

		<div id="overlay">
			<div id="quiz_container">

				<a href="#" id="closeQuiz">Lukk</a>
				<br>
				<br>

				<form>
					<?php

					/* Printing Question HTML */
					$db = new DBApi();
					$questions = $db->getQuestions();

					for($i = 0; $i < count($questions); $i++) {
						$currQ = $questions[$i];
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
