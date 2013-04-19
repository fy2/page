function artemis_args_are_okay (selectedData) {
	
	var msg = document.getElementById('msg_box');
	msg.innerHTML='';
	
	var sanger_id_array = selectedData.split("checkbox=");
	sanger_id_array.shift(); //first element is empty
	if (sanger_id_array.length > 1) {

		msg.innerHTML='<div class="msg">Too few or too many genomes selected. Please choose a single genome for Artemis.</div>';
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
	if (sanger_id_array.length < 2 || sanger_id_array.length > 5) {
		msg.innerHTML='<div class="msg">Too few or too many genomes selected. Please select at least 2 (max = 5) for Act.</div>';
		window.setTimeout(function(){msg.innerHTML='';},3000);
		return false;
	}

	return true;
}