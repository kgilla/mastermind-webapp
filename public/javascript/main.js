const navLinks = document.querySelector("#nav-links");
const navExpand = document.querySelector("#nav-expand");
const overlay = document.querySelector("#overlay");
const userColors = document.querySelectorAll(".user-color");

const handleClick = () => {
  overlay.classList.toggle("hide");
  navLinks.classList.toggle("hide");
  navLinks.classList.toggle("show");
};

const handleInputChange = (e) => {
  e.target.style.background = e.target.value;
};

userColors.forEach((color) => (color.style.background = color.value));

userColors.forEach((color) =>
  color.addEventListener("input", handleInputChange)
);

navExpand.addEventListener("click", handleClick);
overlay.addEventListener("click", handleClick);
