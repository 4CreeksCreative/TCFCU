$('a:not([type="submit"]):not([href*="mailto:"]):not(.ignore)').each(function(i,val){
	var regex2 = new RegExp('(^\/+(?!pdf))','ig')
	var regex = new RegExp('(^#)|(^#$)|(^$)|(^\/)|('+window.location.hostname+')|(^https://my.tularefcu.org/)|(^https://tularefcu.symapp.jhahosted.com/)|(^https://internetloanapplication.cudl.com/tulare/)|(^http://tularefederal.org/)','ig')
	//var regex3 = new RegExp('(^https://my.tularefcu.org/)')
	if(!regex.test($(val).attr('href'))){
		console.log('external link found ' + $(val).attr('href'))
		$(val).addClass('modal-trigger').addClass('externalLink')
		$(val).attr('data-modal-index','0')
	}
	if (!regex2.test($(val).attr('href'))) {
		$(val).attr('target','_blank')
	}
	//if($(val).attr('href').indexOf('https://tularefcu.online-cu.com') != -1){
	// if($(val).attr('href').indexOf('https://my.tularefcu.org/') != -1){
	// 	console.log('Banking link found ' + $(val).attr('href'))
	// 	$(val).addClass('modal-trigger')
	// 	$(val).attr('data-modal-index','2')
	// }
})
$(document).on('mousedown','.modal-trigger.externalLink',function(e){
	function openModal(elem){
		var a = document.createElement('a')
		a.href = $(elem).attr('href')
		var hostname = a.hostname
		console.log($(elem).attr('href'))
		$('#now-leaving.modal-content .website-link').attr('href', $(elem).attr('href'))
		$('#now-leaving.modal-content .website-name').html(hostname)
	}
	if( e.which <= 2 ){
		e.preventDefault();
		openModal(this);
	}
	return true
})

$('.website-link').click(function(){
	mr.modals.closeActiveModal()
})

$(document).ready(function(){
	var headerHeight = $('#menu2').innerHeight()
	var test = /#+\w+(?:-?\w+)+/ig.exec(window.location.href);
	if(/#+\w+(?:-?\w+)+/ig.test(window.location.href)){
		$('html, body').stop().animate({
			scrollTop: $(test[0]).offset().top -headerHeight,
			easing: 'swing'
		},500)
	}
})
