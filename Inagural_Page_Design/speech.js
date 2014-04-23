window.addEventListener("load", function () {
    var titlecodes = document.getElementsByClassName("titlecode");
    for (var i = 0; i < titlecodes.length; i++) {
        titlecodes[i].addEventListener("mouseover", function () {
            var titletooltip = this.getElementsByClassName("titletooltip")[0];
            titletooltip.removeAttribute("style");
        });
        titlecodes[i].addEventListener("mouseout", function () {
            var titletooltip = this.getElementsByClassName("titletooltip")[0];
            titletooltip.style.display = "none";
        });
    }
});