function isEmpty( el ){
      return !$.trim(el.html())
}

function setSelectionRange(input, selectionStart, selectionEnd) {
  if (input.setSelectionRange) {
    input.focus();
    input.setSelectionRange(selectionStart, selectionEnd);
  }
  else if (input.createTextRange) {
    var range = input.createTextRange();
    range.collapse(true);
    range.moveEnd('character', selectionEnd);
    range.moveStart('character', selectionStart);
    range.select();
  }
}

function setCaretToPos (input, pos) {
  setSelectionRange(input, pos, pos);
}

function copyContent (){
	$('span').contents().unwrap();
	var title = $("<input>").attr("type", "hidden").attr("name","article[title]");
	title.val($("#article-title").text());
	$('#article-form').append($(title));
	var content = $("<input>").attr("type", "hidden").attr("name","article[content]");
	content.val($("#article-content").html());
	$('#article-form').append($(content));
	return true;
}
function insertAfter(referenceNode, newNode) {
    referenceNode.parentNode.insertBefore(newNode, referenceNode.nextSibling);
}

var nonInput = [16,9,27,8,17,18,20,144,37,38,39
		,40,45,46,36,35,33,34,112,113,114,115,116,
		117,118,119,120,121,122,123,224,91,92,93];