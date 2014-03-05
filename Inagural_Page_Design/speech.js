function overlay(id,text,url) {
   
    if (document.getElementById(id)) return; // don't create a popup if there's already one open for this id
    var overlay = document.createElement("div");
    var XMousePos = window.event.clientX;
    var Ypos = window.event.clientY;
    var windowWidth = window.innerWidth;
    if (windowWidth - XMousePos > 300) {
        var Xpos = XMousePos
    } else {
        var Xpos = windowWidth - 310
    };
    overlay.setAttribute("id", id);
    overlay.setAttribute("style", "z-index: 10; background-color: #BCC0CC; position: absolute; left: " + Xpos + "px; top: " + Ypos + "px; border: 2px solid #2a2a2b; width: 300px; padding: 2px; margin: 0;")
    overlay.setAttribute("onclick", "document.body.removeChild(document.getElementById('" + id + "'))");
    overlay.setAttribute("class", "overlay");
    overlay.innerHTML = "<div>" + text + ": <a href='" + url + "'>" + url + "</a></div>";
    document.body.appendChild(overlay);
}
