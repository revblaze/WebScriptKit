# WebScriptKit
Starter iOS and macOS code for Swift–JavaScript communication through WebKit

### Under heavy development.

Note: Parse JavaScript code and stringify all functions as such:
```js
function getAllFunctions() { 
  var allfunctions=[];
  for (var i in window) {
    if((typeof window[i]).toString()=="function"){
      allfunctions.push(window[i].name);
    }
  }
} getAllFunctions();

// jsFiddle demo: https://stackoverflow.com/a/11279639/1234120
```
