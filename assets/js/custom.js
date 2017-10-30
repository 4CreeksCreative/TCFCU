$('a').each(function(i,val){
	var regex = new RegExp('(^#$)|(^$)|(^\/)|('+window.location.hostname+')|(^https://uat-internetloanapplication.cudl.com/tulare/$)|(^https://tularefcu.online-cu.com)','ig')
	if(!regex.test($(val).attr('href'))){
		console.log('external link found ' + $(val).attr('href'))
		$(val).addClass('modal-trigger')
		$(val).attr('data-modal-index','0')
	}
})
$('.modal-trigger').on('click',function(e){
	var a = document.createElement('a')
	a.href = $(this).attr('href')
	var hostname = a.hostname
	console.log($(this).attr('href'))
	$('#now-leaving.modal-content .website-link').attr('href', $(this).attr('href'))
	$('#now-leaving.modal-content .website-name').html(hostname)
})
