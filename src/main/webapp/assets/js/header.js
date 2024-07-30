var headerBot = document.querySelector(".menu-head");
var headerBotOffset = headerBot.offsetTop;
var isHeaderFixed = false;

window.addEventListener("scroll", function() {
  var scrollY = window.scrollY;

  if (scrollY >= headerBotOffset) {
    if (!isHeaderFixed) {
      headerBot.style.position = "fixed";
      headerBot.style.top = "0";
      headerBot.style.left = "0";
      headerBot.style.right = "0";
      headerBot.style.width = "100%";
      headerBot.style.zIndex = "1000";
      headerBot.style.boxShadow = "0 4px 6px rgba(0, 0, 0, 0.1)";
      isHeaderFixed = true;
    }
  } else {
    if (isHeaderFixed) {
      headerBot.style.position = "static";
      headerBot.style.boxShadow = "none";
      isHeaderFixed = false;
    }
  }
});