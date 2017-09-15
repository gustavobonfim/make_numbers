
function cnpj(){

  $.getJSON('/make_numbers/cnpj', function(data){
    var p = '';
    $.each(data.cnpj, function(i, c){
      p = '<p>' + c.cnpj + '</p>';
    });
    $('#new_cnpj').html(p);
  });
}
