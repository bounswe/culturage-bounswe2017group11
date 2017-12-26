// Copyright (c) 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/**
 * Get the current URL.
 *
 * @param {function(string)} callback called when the URL of the current tab
 *   is found.
 */
function getCurrentTabTitle(callback) {
  // Query filter to be passed to chrome.tabs.query - see
  // https://developer.chrome.com/extensions/tabs#method-query
  var queryInfo = {
    active: true,
    currentWindow: true
  };

  chrome.tabs.query(queryInfo, (tabs) => {
    // chrome.tabs.query invokes the callback with a list of tabs that match the
    // query. When the popup is opened, there is certainly a window and at least
    // one tab, so we can safely assume that |tabs| is a non-empty array.
    // A window can only have one active tab at a time, so the array consists of
    // exactly one tab.
    var tab = tabs[0];

    // A tab is a plain object that provides information about the tab.
    // See https://developer.chrome.com/extensions/tabs#type-Tab
    var title = tab.title;

    // tab.url is only available if the "activeTab" permission is declared.
    // If you want to see the URL of other tabs (e.g. after removing active:true
    // from |queryInfo|), then the "tabs" permission is required to see their
    // "url" properties.
   
    callback(tab);
  });

  // Most methods of the Chrome extension APIs are asynchronous. This means that
  // you CANNOT do something like this:
  //
  // var url;
  // chrome.tabs.query(queryInfo, (tabs) => {
  //   url = tabs[0].url;
  // });
  // alert(url); // Shows "undefined", because chrome.tabs.query is async.
}

/**
 * Change the background color of the current page.
 *
 * @param {string} color The new background color.
 */
function changeBackgroundColor(color) {
  var script = 'document.body.style.backgroundColor="' + color + '";';
  // See https://developer.chrome.com/extensions/tabs#method-executeScript.
  // chrome.tabs.executeScript allows us to programmatically inject JavaScript
  // into a page. Since we omit the optional first argument "tabId", the script
  // is inserted into the active tab of the current window, which serves as the
  // default.
  chrome.tabs.executeScript({
    code: script
  });
}

/**
 * Gets the saved background color for url.
 *
 * @param {string} url URL whose background color is to be retrieved.
 * @param {function(string)} callback called with the saved background color for
 *     the given url on success, or a falsy value if no color is retrieved.
 */
function getSavedBackgroundColor(url, callback) {
  // See https://developer.chrome.com/apps/storage#type-StorageArea. We check
  // for chrome.runtime.lastError to ensure correctness even when the API call
  // fails.
  chrome.storage.sync.get(url, (items) => {
    callback(chrome.runtime.lastError ? null : items[url]);
  });
}

/**
 * Sets the given background color for url.
 *
 * @param {string} url URL for which background color is to be saved.
 * @param {string} color The background color to be saved.
 */
function saveBackgroundColor(url, color) {
  var items = {};
  items[url] = color;
  // See https://developer.chrome.com/apps/storage#type-StorageArea. We omit the
  // optional callback since we don't need to perform any action once the
  // background color is saved.
  chrome.storage.sync.set(items);
}

// This extension loads the saved background color for the current tab if one
// exists. The user can select a new background color from the dropdown for the
// current page, and it will be saved as part of the extension's isolated
// storage. The chrome.storage API is used for this purpose. This is different
// from the window.localStorage API, which is synchronous and stores data bound
// to a document's origin. Also, using chrome.storage.sync instead of
// chrome.storage.local allows the extension data to be synced across multiple
// user devices.
document.addEventListener('DOMContentLoaded', () => {
  getCurrentTabTitle((tab) => {
    title = tab.title;
    url = tab.url;
    token = "JWT eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyOSwidXNlcm5hbWUiOiJhYmR1bGxhdGlmIiwiZXhwIjoxNTQwMjI3Mzk0LCJlbWFpbCI6ImFiZHVsbGF0aWZAa29rc2FsLmNvbSJ9.RBSrYLIUUJswGf-F3Q9Q_XVAnPkf2F2ZLggpLrXrSXI";
    if (title.includes("-")){
      title = (title.substring(0,title.indexOf("-"))).trim();
    }

    console.log(title);
    console.log(url);


    var xhr = new XMLHttpRequest();
    var requestedUrl = "http://52.90.34.144:85/api/search/item?q=".concat(title); 
    console.log(requestedUrl);
    
    xhr.open("GET",requestedUrl,true);
    xhr.setRequestHeader("Authorization",token);
    xhr.setRequestHeader("Content-Type","application/json");
    xhr.onreadystatechange = function() {
      if (xhr.readyState == 4 && xhr.status == 200) {
        console.log(xhr.responseText);
        var result = xhr.responseText;
        var obj = JSON.parse(result);
        console.log(obj);
        document.getElementById("title").innerHTML = obj[0].name;
        document.getElementById("description").innerHTML = ((obj[0].description).substring(0,800)).concat("...");
        document.getElementById("cover").src = obj[0].featured_img;
        

        var cover = document.getElementById('cover');

        cover.style.cursor = 'pointer';
        cover.onclick = function() {
          var targetUrl = "http://culturage.s3-website-us-east-1.amazonaws.com/item/"+obj[0].id;
          console.log(targetUrl);
          window.open(targetUrl);

        }


        if(url.includes("youtube")){
          console.log("denemee");
          document.getElementById("youtubeText").style.display = "block";
          document.getElementById("youtubeButton").style.display = "block";
          var youtubeButton = document.getElementById('youtubeButton');

          youtubeButton.style.cursor = 'pointer';
          youtubeButton.onclick = function() {
              console.log("tiklandi");
              console.log(url);
              console.log(obj[0].id);
              var xhr1 = new XMLHttpRequest();
              var requestedUrl = "http://52.90.34.144:85/api/items/"+obj[0].id+"/medias"; 
              console.log(requestedUrl);
              var body = "url="+url;
              console.log(body);

              xhr1.open("POST",requestedUrl,true);

              xhr1.setRequestHeader("Authorization",token);
              xhr1.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");


              
              xhr1.onreadystatechange = function() {//Call a function when the state changes.
                  if(xhr1.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
                    console.log("Item is uploaded.")
                  }
              }

              


              xhr1.send(body);
              
          };
        }
       }
    }
    xhr.send();
  });
});
