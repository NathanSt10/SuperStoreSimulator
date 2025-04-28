window.onload = function () {
    console.log('modal.js loaded!');
  
    var modal = document.getElementById("memberModal");
    var btn = document.getElementById("memberButton");
    var span = document.getElementsByClassName("close")[0];
  
    btn.onclick = function () {
      modal.classList.add("show");
    }
  
    span.onclick = function () {
      modal.classList.remove("show");
    }
  
    window.onclick = function (event) {
      if (event.target == modal) {
        modal.classList.remove("show");
      }
    }
  };
