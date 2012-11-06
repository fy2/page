function getDDValue( id ) {
  var e=document.getElementById(id);
  return e.options[e.selectedIndex].value;
}

if( document.forms.actform ) { 
  document.getElementById('act_gb').onclick =
  document.getElementById('act_ga').onclick = function() {
    var msg = document.getElementById('msg_box');
    msg.innerHTML='';
  };

  document.forms.actform.onsubmit = function(){
    var msg = document.getElementById('msg_box'), ga = getDDValue( 'act_ga' ), gb = getDDValue( 'act_gb' );
    msg.innerHTML='';
    if( ga === gb || ga === '' || gb === '' ) {
      msg.innerHTML='<div class="msg">You must select two different genomes</div>';
      window.setTimeout(function(){msg.innerHTML='';},3000);
      return false;
    }
    return true;
  };
}

if( document.forms.artemisform ) {
  document.getElementById('artemis').onclick = function() {
    var msg = document.getElementById('msg_box');
    msg.innerHTML='';
  };

  document.forms.artemisform.onsubmit = function(){
    var msg = document.getElementById('msg_box'), g = getDDValue( 'artemis' );
    msg.innerHTML='';
    if( g === '' ) {
      msg.innerHTML='<div class="msg">You must select a genome</div>';
      window.setTimeout(function(){msg.innerHTML='';},3000);
      return false;
    }
    return true;
  };
}
