<html lang="it">
    
  <?php include "includes/head.php" ?>
    
  <body>
  	
  	<?php include "includes/header.php" ?>

	<!-- Start main content -->
	<main>
		<!-- Start About -->
		<section id="mu-about">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="mu-about-area">
							<!-- Start Feature Content -->
							<div class="row">
								<div class="col-md-6">
									<div class="mu-about-left">
										<img class="" src="assets/images/about-us-img.jpg" alt="img">
									</div>
								</div>
								<div class="col-md-6">
									<div class="mu-about-right">
										<h2>La nostra storia</h2>
										<p>Questa impresa è stata fondata nel 1974 da Giorgio Borghetti, un noto imprenditore Milanese. Inizialmente egli si occupava della vendita dei biglietti per visitare il Duomo di Milano; nel corso degli anni Giorgio ampliò e migliorò questa impresa fino a giungere alla situazione attuale.</p>

										<p>Il sito internet è stato realizzato nel 2008 in seguito alla rimozione dei punti di vendita fisici, a causa dell'elevato costo del loro mantenimento.</p>
									</div>
								</div>
							</div>
							<!-- End Feature Content -->

						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End About -->				

		<!-- Start Video -->
		<section id="mu-video">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="mu-video-area">
							<h2>Guarda il nostro video informativo!</h2>

							<!-- Start Video content -->
							<div class="mu-video-content">		
								<iframe width="900" height="506" src="https://www.youtube.com/embed/myzzfwB-9Cc" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>							
							</div>
							<!-- End Video content -->

						</div>
					</div>
				</div>
			</div>	
		</section>
		<!-- End Video -->

		<!-- Musei -->
		<section id="mu-featured-tours">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="mu-featured-tours-area">
							<h2>I nostri musei</h2>
							<p class="mu-title-content">Qui di seguito potete trovare la lista dei musei che aderiscono al nostro sito</p>

							
							<div class="mu-featured-tours-content">
								<div class="row">
                                                                        
                                                                    <?php include "includes/stampa_musei.php";?>

								</div>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- Musei -->

		<!-- Start Client Testimonials -->
		<section id="mu-testimonials">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="mu-testimonials-area">
							<h2>Ultime recensioni:</h2>

							<div class="mu-testimonials-block">
								<ul class="mu-testimonial-slide">

									<?php include "includes/stampa_recensioni.php"?>

								</ul>
							</div>

						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End Client Testimonials -->
                
		<!-- Recensioni -->
		<section id="mu-contact">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="mu-contact-area">
							<h2>Lascia una recensione anche tu!</h2>							
							
							
							<div class="mu-contact-content">
								<div class="row">

									<div class="col-md-12">
										<div class="mu-contact-form-area">
                                                                                <div id="form-messages"></div>
                                                                                
                                                                                <!--Area recensioni-->
                                                                                <form method="post" action="parts/recensioni_script.php" class="mu-contact-form">
                                                                                    <div class="row">
                                                                                        <div class="col-md-6">
                                                                                            <div class="form-group">                
                                                                                                <input type="text" class="form-control" placeholder="Nome" name="nome" required>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="col-md-6">
                                                                                            <div class="form-group">                
                                                                                                <input type="email" class="form-control" placeholder="Email" name="mail" required>
                                                                                            </div>    
                                                                                        </div>          
                                                                                    </div>
                                                                                    <div class="form-group">                
                                                                                        <input type="text" class="form-control" placeholder="Museo visitato" name="museo" required>
                                                                                    </div>
                                                                                    <div class="form-group">
                                                                                        <textarea class="form-control" placeholder="Recensione" name="recensione" required></textarea>
                                                                                    </div>
                                                                                    <button type="submit" class="mu-send-msg-btn"><span>Invia recensione</span></button>
								        	</form>
                                                                                <!--Fine area recensioni-->
										</div>
									</div>

								</div>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- Recensioni -->

		<!-- Start Google Map -->

		<div id="mu-google-map">
			<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d89547.07313713756!2d9.107692389824255!3d45.46283285008072!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4786c1493f1275e7%3A0x3cffcd13c6740e8d!2sMilano%20MI!5e0!3m2!1sit!2sit!4v1579166785684!5m2!1sit!2sit" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
		</div>

		<!-- End Google Map -->
                
        </main>
	<!-- End main content -->	
			
	<!-- JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
            <!-- Slick slider -->
        <script type="text/javascript" src="assets/js/slick.min.js"></script>
        <!-- Ajax contact form  -->
        <script type="text/javascript" src="assets/js/app.js"></script>



        <!-- Custom js -->
	<script type="text/javascript" src="assets/js/custom.js"></script>
        
	<?php
        include "includes/footer.php";
        ?>
	<!-- End footer -->
  </body>
</html>