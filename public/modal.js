window.onload = function () {
  var memberModal = document.getElementById("memberModal");
  var memberBtn = document.getElementById("memberButton");
  var memberSpan = document.getElementsByClassName("close")[0];

  memberBtn.onclick = function () {
    memberModal.classList.add("show");
  };

  memberSpan.onclick = function () {
    memberModal.classList.remove("show");
  };

  window.onclick = function (event) {
    if (event.target == memberModal) {
      memberModal.classList.remove("show");
    }
  };

  var restockModal = document.getElementById("restockModal");
  var restockBtn = document.getElementById("restockButton");
  var restockSpan = document.getElementsByClassName("close")[1];
  
  restockBtn.onclick = function () {
    restockModal.classList.add("show");
  };

  restockSpan.onclick = function () {
    restockModal.classList.remove("show");
  };

  window.onclick = function (event) {
    if (event.target == restockModal) {
      restockModal.classList.remove("show");
    }
  };
};
