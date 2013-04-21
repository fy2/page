function artemis_args_are_okay (selectedData) {
	
	var msg = document.getElementById('msg_box');
	msg.innerHTML='';
	
	var sanger_id_array = selectedData.split("checkbox=");
	sanger_id_array.shift(); //first element is empty
	if (sanger_id_array.length > 1) {

		msg.innerHTML='<div class="msg">Too many genomes selected. Please choose a single genome for Artemis.</div>';
		window.setTimeout(function(){msg.innerHTML='';},3000);
		return false;
	} 
	
	return true;		
}

function act_args_are_okay (selectedData) {
	
	var msg = document.getElementById('msg_box');
	msg.innerHTML='';
	
	var sanger_id_array = selectedData.split("checkbox=");
	sanger_id_array.shift(); //first element is empty
	if (sanger_id_array.length < 2 || sanger_id_array.length > 10) {
		msg.innerHTML='<div class="msg">Please select at least two (max = 10) genomes for Act.</div>';
		window.setTimeout(function(){msg.innerHTML='';},3000);
		return false;
	}

	return true;
}
