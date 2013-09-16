function isEmpty( el ){
      return !$.trim(el.html())
}

function copyContent (){
	$("input[name='article[title]']").val($("#article-entry :first").text());
	var content = '';
	$("#article-entry :not(:first)").each(
	  function(){
	    if(!isEmpty($(this))){
	      content += $(this).outerHTML();
	    }
	  }
	);
	$("input[name='article[content]']").val(content);
	return true;
}