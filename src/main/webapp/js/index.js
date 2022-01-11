//vérification du mail:
var email = document.querySelector("#email");
var regexMail = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,6})+$/;

email.addEventListener("keyup", function () {
    if (!regexMail.test(email.value) ){
        email.focus();
        document.querySelector("#errorEmail").innerHTML = '<p style="color:red">Merci de saisir une adresse mail correcte</p>';
        return false;
    }else {
        document.querySelector("#errorEmail").innerHTML = '';
    }
})