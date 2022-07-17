// Inject Google Translate
// This (clearly) is remotely hosted code. Google will be sent the whole
// contents of the page you are on if you run `:translate`
// From https://github.com/jeremiahlee/page-translator

let googleTranslateCallback = document.createElement("script");

googleTranslateCallback.innerHTML = "function googleTranslateElementInit(){ new google.translate.TranslateElement(); }";
document.body.insertBefore(googleTranslateCallback, document.body.firstChild);

let googleTranslateScript = document.createElement("script");

googleTranslateScript.charset = "UTF-8";
googleTranslateScript.src = "https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit&tl=&sl=&hl=";
document.body.insertBefore(googleTranslateScript, document.body.firstChild);
