function init() {
    var speechLinks = document.querySelectorAll('#speechIndex span');
    var speechLinksLength = speechLinks.length;
    for (var i = 0; i < speechLinksLength; i++) {
        speechLinks[i].addEventListener('click', ajax, false);
    }
}
function ajax() {
    var displayLocation = document.getElementById('speechDisplay');
    var newContent = this.id;
    var xmlhttp = new XMLHttpRequest();
    console.log('target: ' + displayLocation);
    console.log('newContent: ' + newContent);
    xmlhttp.open('GET',newContent,true);
    xmlhttp.send();
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) 
            displayLocation.innerHTML = xmlhttp.responseText;
    }
}
window.addEventListener('load', init, false);