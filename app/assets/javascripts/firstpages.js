
$(document).ready(function() {
	var $main = $('.boardOuter');
	var $mainIn = $('.boardIn');
	var $homeNav = $('.homeNav');
	var $back = $('.backward');
	var working = false;

	function resizeSelect() {
		var h = $(window).height() - 101;
		$('.board').css('min-height', h + 'px');
	}

	function fetchselect(val) {
		if (working) {
			return false;
		}
		working = true;
		$.ajax({url: $(this).prop('action'), 
		        dataType: 'json', 
		        type: "POST",
		        data: {pid : val}, 
		        success: 
		  function(r) {
			var ids, lis;
			$.each(r, function(k, v) {
				ids = 'id="' + v.title + '"';
				lis += '<li '+ ids +'><p class="title">' + v.title + '</p><p class="date">' + v.date +'</p></li>';
			});
			$(lis).appendTo($mainIn);
			$mainIn.attr('id',val);
		  }
		        
		    });
		working = false;
	}
	function contentIn(val) {
		if (working) {
			return false;
		}
		working = true;
		$.ajax({url: '/firstpages/content', 
		        dataType: 'json', 
		        type: "POST",
		        data: {id : val}, 
		        success: 
		  function(r) {
			var ids, lis;
			$.each(r, function(k, v) {
				ids = 'id="' + v.title + '"';
				lis +=  '<h2 '+ ids +'>' + v.title + '</h2><p>'+ v.author +'</p><div align="left" class="content">'+ v.content +'</div>'; 
			});
			$(lis).appendTo($mainIn);
			$mainIn.attr('id',val);
		  }
		        
		    });
		working = false;
	}
	function back(val) {
		if (working) {
			return false;
		}
		working = true;
		$.ajax({url: $(this).prop('action'), 
		        dataType: 'json', 
		        type: "POST",
		        data: val, 
		        success: 
		  function(r) {
			var ids, lis;
			$.each(r, function(k, v) {
				ids = 'id="' + v.title + '"';
				lis += '<li '+ ids +'><p>' + v.title + '</p><p class="date">' + v.date +'</p></li>';
			});
			$(lis).appendTo($mainIn);
			$mainIn.attr('id',val);
		  }
		        
		    });
		working = false;
	}
	
	$(window).resize(resizeSelect);
	$homeNav.find('.unactive').live('click', function() {
		$homeNav.find('.active').addClass('unactive').removeClass('active');
		$(this).addClass('active').removeClass('unactive');
		$back.css('visibility', 'hidden');
		$mainIn.empty().hide();
		$main.fadeIn(200);
		resizeSelect();
		var id = $(this).attr('id');
		fetchselect(id);
		$mainIn.fadeIn(200);
	});
	$('.boardClose').click(function() {
		$homeNav.find('.active').addClass('unactive').removeClass('active');
		$main.hide();
	});
	$main.find('li').live('click', function() {
		var id = $(this).attr('id');
		if (id) {
			$mainIn.empty().hide();
			contentIn(id);
			$mainIn.fadeIn(200);
			resizeSelect();
			$back.css('visibility', 'visible');
		}
	});
	$back.live('click', function() {
		if (working) {
			return false;
		}
		working = true;
		var id = $mainIn.attr('id');
		$mainIn.empty().hide();
		$.ajax({url:'/firstpages/back', 
		       data:{id: id}, 
		       type:'POST',
		       dataType:'json',
		       success:
		       function(r) {
			var k = r[0];
			$back.css('visibility', 'hidden');
			back(k);
		  }	
		});
		$mainIn.fadeIn(200);
		working = false;
	});
	$('.loadIcon').ajaxStart(function() {
		$(this).show();
	}).ajaxStop(function() {
		$(this).hide();
	});
});