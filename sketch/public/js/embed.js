var app = Elm.Main.init({ node: document.querySelector('main') });
/*
var app = Elm.Main.fullscreen(localStorage.session || null);

app.ports.setDocTitle.subscribe(function(title) {
    document.title = title;
});

app.ports.storeSession.subscribe(function(session) {
    localStorage.session = session;
});

window.addEventListener("storage", function(event) {
    if (event.storageArea === localStorage && event.key === "session") {
        app.ports.onSessionChange.send(event.newValue);
    }
}, false);
*/
