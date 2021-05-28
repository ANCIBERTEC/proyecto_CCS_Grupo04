$(document).ready(function(){
	$('select[name=area]').on('change',function(){
		$.ajax({
			type:'GET',
			url:'/paginas/ServletCargo',
			data:'idarea='+$('select[name=area]').val(),
			satatusCode:{
				404:function(){
					alert('Pagina no encontrada');
				},
				500:function(){
					alert('Error no servidor');
				}
			},
			success:function(dados){
				console.log(dados);
			}
		});	
		
	})
});