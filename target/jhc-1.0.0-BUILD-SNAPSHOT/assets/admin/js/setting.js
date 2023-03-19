function openCity(evt, cityName) {
    var i, x, tablinks;
    x = document.getElementsByClassName("city");
    for (i = 0; i < x.length; i++) {
        x[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablink");
    for (i = 0; i < x.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" w3-red", " ");
    }
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " w3-red";
}

function openFaq(evt, faq_num) {
    var i, x;
    var faqNum = document.getElementById(faq_num);

    if (faqNum.style.display == 'block') {
        faqNum.style.display = 'none';
    } else {
        x = document.getElementsByClassName("faq-content");
        for (i = 0; i < x.length; i++) {
            x[i].style.display = 'none';
        }
        open(evt, faqNum);
    }
}

const open = (evt, faqNum) => {

    var faqLinks = document.getElementsByClassName("faq-link");
    for (i = 0; i < faqLinks.length; i++) {
        faqLinks[i].className = faqLinks[i].className.replace(" w3-grey", " ");
    }
    console.log(faqNum.style.display);
    faqNum.style.display = "block";
    evt.currentTarget.className += " w3-grey";
};