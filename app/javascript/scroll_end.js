function scroll_end() {
  const scrollEnd = document.getElementById("scroll_end");
  scrollEnd.scrollTop = scrollEnd.scrollHeight;

};

window.addEventListener("load", scroll_end);
