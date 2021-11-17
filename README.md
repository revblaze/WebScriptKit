# WebScriptKit
Starter iOS and macOS code for Swift–JavaScript communication through WebKit

### Under heavy development.

**Possible better print JS.function concept**: https://stackoverflow.com/a/11279959/1234120
**v2**: https://stackoverflow.com/a/63652542/1234120

Note: Parse JavaScript code and stringify all functions as such:
```js
function getAllFunctions() { 
  var allfunctions=[];
  for (var i in window) {
    if((typeof window[i]).toString()=="function" && window[i].toString().indexOf("native")==-1) {
      allfunctions.push(window[i].name);
    }
  }
} getAllFunctions();

// jsFiddle demo: https://stackoverflow.com/a/11279639/1234120
// A simplified alternative: https://stackoverflow.com/a/34912116/1234120
```
