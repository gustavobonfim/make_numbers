
function cpf(){

  $.getJSON('/make_numbers/cpf', function(data){
    var p = '';
    $.each(data.cpf, function(i, c){
      p = '<p>' + c.cpf + '</p>';
    });
    $('#new_cpf').html(p);
  });
}
