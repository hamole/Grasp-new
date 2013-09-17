function isEmpty( el ){
      return !$.trim(el.html())
}

function copyContent (){
	$('span').contents().unwrap();
	$("input[name='article[title]']").val($("#article-entry :first").text());
	var content = '';
	$("#article-entry :not(:first):not(em,b,i,li,span)").each(
	  function(){
	    if($(this).is("img") || !isEmpty($(this))){
	      content += $(this).outerHTML().replace(/&nbsp;/g,' ');
	    }
	  }
	);
	$("input[name='article[content]']").val(content);
	return true;
}
function insertAfter(referenceNode, newNode) {
    referenceNode.parentNode.insertBefore(newNode, referenceNode.nextSibling);
}