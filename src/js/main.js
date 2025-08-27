const nom = document.getElementById("nom");
const prenom = document.getElementById("prenom");
const email = document.getElementById("email");
const form = document.getElementById("form");



//event : interface qui représente un évènement qui se produit dans le DOM
//        il peut être déclenché par une action humaine (clic, touche), généré par des API...

form.addEventListener("submit", function (event){
    event.preventDefault();

    const nomValide = validerNom(nom.value);
    const prenomValide = validerPrenom(prenom.value);
    const emailValide = validerEmail(email.value);
    
    if (nomValide && prenomValide && emailValide) {
        alert ("Formulaire valide");
    }else{
        alert("Erreur : Vérifier votre saisie");
    }
});


/**
 * Valide un nom
 * 2 caractères minimum
 * autorise les lettres et un tiret en milieu de nom
 * @param {string} _nom 
 * @returns {Boolean} VRAI si le nom est valide, FAUX pour nom invalide
 */
function validerNom(_nom) {
    const regexNom = /^[A-Za-z]{1,40}[A-Za-z-]{1,40}$/;
    _nom = _nom.trim();

    return regexNom.test(_nom);
}


/**
 * Valide un prénom
 * 2caractères minimum
 * autorise les lettres et un tiret en milieu de prénom
 * @param {string} _prenom 
 * @returns {Boolean} VRAI si le prénom est valide, FAUX pour prénom invalide
 */
function validerPrenom(_prenom){
    const regexPrenom = /^[A-Za-z]{1,}[A-Za-z-]{1,40}$/;
    _prenom = _prenom.trim();

    return regexPrenom.test(_prenom);
}


/**
 * Valide une adresse e-mail
 * autorise les caractères alphanumériques
 * présence d'un "@" obligatoire
 * présence d'un domaine obligatoire 
 * @param {string} _email 
 * @returns {Booelan} VRAI si format : xxxx@xxxx.xx , sinon FAUX
 */
function validerEmail (_email){
    const regexEmail = /^[\w\-_\.]+@[\w]+\.[a-z]{2,3}$/;
    _email = _email.trim();

    return regexEmail.test(_email);
}