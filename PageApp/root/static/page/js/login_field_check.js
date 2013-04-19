//check the value completeness at /login action
function notEmpty( username, password ) {

	if (!username.value.length || 
		!password.value.length) 
	{
		
		var msg = document.getElementById('msg_box');
        msg.innerHTML='<div class="msg">Please complete the required fields.</div>';
        window.setTimeout(function(){msg.innerHTML='';},3000);
		return false;
	}
	return true;

}