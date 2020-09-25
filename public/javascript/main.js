const navLinks = document.querySelector("#nav-links");
const navExpand = document.querySelector("#nav-expand");
const overlay = document.querySelector("#overlay");

const handleClick = () => {
  overlay.classList.toggle("hide");
  navLinks.classList.toggle("hide");
  navLinks.classList.toggle("show");
};

navExpand.addEventListener("click", handleClick);
overlay.addEventListener("click", handleClick);
// window.addEventListener("resize", handleWindowResize);
