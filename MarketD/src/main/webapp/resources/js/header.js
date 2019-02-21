/**
 * 2019-02-21
 * 이덕현
 * header
 * 상단 바
 * <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
 */
	$(function(){

		$("ul.dropdown li").hover(function(){
		
			$(this).addClass("hover");
			$('ul:first',this).css('visibility', 'visible');
		
		}, function(){
		
			$(this).removeClass("hover");
			$('ul:first',this).css('visibility', 'hidden');
		
		});
		
		$("ul.dropdown li ul li:has(ul)").find("a:first").append(" » ");

	});	
