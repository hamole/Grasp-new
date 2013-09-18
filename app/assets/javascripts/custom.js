function isEmpty( el ){
      return !$.trim(el.html())
}

function copyContent (){
	$('span').contents().unwrap();
	$("input[name='article[title]']").val($("#article-title").text());
	$("input[name='article[content]']").val($("#article-content").html());
	return true;
}
function insertAfter(referenceNode, newNode) {
    referenceNode.parentNode.insertBefore(newNode, referenceNode.nextSibling);
}