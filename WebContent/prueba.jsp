<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        
    </head>
    <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/bootstrap.min.js"></script>
   
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet"/>
    <link href="css/starrr.css" rel=stylesheet/>
    <script src="js/starrr.js"></script>
    
<style>
body {
  margin-top: 50px;
  font-family: sans-serif;
  background: #f1f1f1;
}

table {
  margin: 0 auto;
  text-align: center;
  border-collapse: collapse;
  border: 1px solid #d4d4d4;
  font-size: 20px;
  background: #fff;
}

table th, 
table tr:nth-child(2n+2) {
  background: #e7e7e7;
}
 
table th, 
table td {
  padding: 20px 50px;
}
 
table th {
  border-bottom: 1px solid #d4d4d4;
}     

.stars-outer {
  display: inline-block;
  position: relative;
  font-family: FontAwesome;
}

.stars-outer::before {
  content: "\f006 \f006 \f006 \f006 \f006";
}

.stars-inner {
  position: absolute;
  top: 0;
  left: 0;
  white-space: nowrap;
  overflow: hidden;
  width: 0;
}

.stars-inner::before {
  content: "\f005 \f005 \f005 \f005 \f005";
  color: #f8ce0b;
}
</style>
    
<body>
    <div class="container-fluid">
        <div class="col-md-6" style="margin-left: 17px;">
            <hr/>
            Calificar: <span id="Estrellas"></span>
            <hr/> 
        </div>
    <div class="col-md-2"></div>
    </div>
    
    
	<script>
   $('#Estrellas').starrr({
       rating:3,
       change:function(e,valor){
           alert(valor);
           
       }
       
   });
    
    </script>


<table>
  <thead>
    <tr>
      <th>Hotel</th>
      <th>Rating</th>
    </tr>
  </thead>
  <tbody>
    <tr class="hotel_a">
      <td>Hotel A</td>
      <td>
        <div class="stars-outer">
          <div class="stars-inner"></div>
        </div>
      </td>
    </tr>
    <tr class="hotel_b">
      <td>Hotel B</td>
      <td>
        <div class="stars-outer">
          <div class="stars-inner"></div>
        </div>
      </td>
    </tr>
    <tr class="hotel_c">
      <td>Hotel C</td>
      <td>
        <div class="stars-outer">
          <div class="stars-inner"></div>
        </div>
      </td>
    </tr>
    <tr class="hotel_d">
      <td>Hotel D</td>
      <td>
        <div class="stars-outer">
          <div class="stars-inner"></div>
        </div>
      </td>
    </tr>
    <tr class="hotel_e">
      <td>Hotel E</td>
      <td>
        <div class="stars-outer">
          <div class="stars-inner"></div>
        </div>
      </td>
    </tr>
  </tbody>
</table>

<script type="text/javascript">
const ratings = {
		  hotel_a : 2.8,
		  hotel_b : 3.3,
		  hotel_c : 1.9,
		  hotel_d : 4.3,
		  hotel_e : 4.74
		};

		// total number of stars
		const starTotal = 5;

		for(const rating in ratings) {  
		  const starPercentage = (ratings[rating] / starTotal) * 100;
		  const starPercentageRounded = `${(Math.round(starPercentage / 10) * 10)}%`;
		  document.querySelector(`.${rating} .stars-inner`).style.width = starPercentageRounded; 
		}

</script>
    
</body>
</html>




