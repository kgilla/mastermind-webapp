import navbar from "./navbar.js";
import rules from "./rules.js";

const main = (() => {
  const userColors = document.querySelectorAll(".user-color");

  const handleInputChange = (e) => {
    e.target.style.background = e.target.value;
  };

  userColors.forEach((color) => (color.style.background = color.value));

  userColors.forEach((color) =>
    color.addEventListener("input", handleInputChange)
  );

  navbar.init();
  rules.init();
})();
