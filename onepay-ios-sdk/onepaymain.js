function showAndroidToast(toast) {
        
    // Set the css variable on the whole document
    document.documentElement.style.setProperty( '--custom-theme-color', "#6c0" );

}

function setTheme(colorCode){
        document.documentElement.style.setProperty( '--custom-theme-color', colorCode);
   }

function openAndroidDialog() {
    //document.documentElement.style.setProperty( '--custom-theme-color', "#6c0" );
    window.webkit.messageHandlers.test.postMessage("Hello000--------!");

}

function callIOS() {
    window.webkit.messageHandlers.test.postMessage("Hello this is a message from JS to Swift--------!");
}


function callFromActivity(msg) {
     alert(msg)
}

function callMpgs(msg) {
     AndroidFunction.callMpgs();

}
