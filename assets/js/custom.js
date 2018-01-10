$('a:not([type="submit"]):not([href*="mailto:"])').each(function(i,val){
	var regex = new RegExp('(^#$)|(^$)|(^\/)|('+window.location.hostname+')|(^https://uat-internetloanapplication.cudl.com/tulare/$)|(^https://tularefcu.online-cu.com)|(^http://tularefederal.org/)','ig')
	if(!regex.test($(val).attr('href'))){
		console.log('external link found ' + $(val).attr('href'))
		$(val).addClass('modal-trigger').addClass('externalLink')
		$(val).attr('data-modal-index','0')
	}
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
