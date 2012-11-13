function getDDValue( id ) {

  var e=document.getElementById(id);
  return e.options[e.selectedIndex].value;
}

//check the value completeness at /login action
function notEmpty( username, password ) {

	if (!username.value.length && 
		!password.value.length) 
	{
		
		var msg = document.getElementById('msg_box');
        msg.innerHTML='<div class="msg">Please complete the required fields.</div>';
        window.setTimeout(function(){msg.innerHTML='';},3000);
		return false;
	}
	return true;

}

if( document.forms.actform ) {
	
  document.getElementById('act_1').onclick = 
  document.getElementById('act_2').onclick =
  document.getElementById('act_3').onclick =
  document.getElementById('act_4').onclick =
  document.getElementById('act_5').onclick = function() {
     var msg = document.getElementById('msg_box');
     msg.innerHTML='';
  };

  document.forms.actform.onsubmit = function(){

	var genomes = new Array();
	var msg = document.getElementById('msg_box'); 

	genomes[0] = getDDValue( 'act_1' );
    genomes[1] = getDDValue( 'act_2' );
    genomes[2] = getDDValue( 'act_3' );
    genomes[3] = getDDValue( 'act_4' );
    genomes[4] = getDDValue( 'act_5' );
    
    msg.innerHTML='';
    
    var number_of_selected = 0;
    
    for (var i = 0; i < genomes.length; i++ ) {
    	if (genomes[i] !== '') {
    		number_of_selected++;    		
    	}
    }
    
    if (number_of_selected < 2 ) {
        msg.innerHTML='<div class="msg">You must select two genomes</div>';
        window.setTimeout(function(){msg.innerHTML='';},3000);
        return false;
    }
    return true;
  };
  
}

if( document.forms.artemisform ) {
  document.getElementById('artemis_1').onclick = function() {
    var msg = document.getElementById('msg_box');
    msg.innerHTML='';
  };

  document.forms.artemisform.onsubmit = function(){
    var msg = document.getElementById('msg_box'), g = getDDValue( 'artemis_1' );
    msg.innerHTML='';
    if( g === '' ) {
      msg.innerHTML='<div class="msg">You must select a genome</div>';
      window.setTimeout(function(){msg.innerHTML='';},3000);
      return false;
    }
    return true;
  };
}
