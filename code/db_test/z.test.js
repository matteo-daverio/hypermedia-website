//$(function() {
//  $(".user").on("click",function(e) {
//    e.preventDefault(); // cancel the link itself
//    var att=this.get
//    $.ajax({
//        method:"POST",
//        url:"z.test.php",
//        crossDomain: true,
//        data:{user:}
//    }});
//      
//    $.post(this.href,function(data) {
//      $("#someContainer").html(data);
//    });
//  });
//});

function postUser(userVar)
{
    $.ajax({
        method:"POST",
        url:"z.test.php",
        crossDomain: true,
        data:{user:userVar}
        success: function(data) {
        $(".the-return").html(
          "iduser: " + data["iduser"] + "<br />Fisrtname: " + data["Firstname"] + "<br />Last name: " + data["Lastname"] 
        );
        alert("Form submitted successfully.\nReturned json: " + data["json"]);
      }
    });
}
