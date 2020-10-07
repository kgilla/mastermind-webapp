const navbar = (() => {
  const navDropdown = document.querySelector("#nav-dropdown");
  const navExpand = document.querySelector("#nav-expand");
  const navLinks = document.querySelector("#nav-links");
  const overlay = document.querySelector("#overlay");

  const init = () => {
    if (window.innerWidth > 900) {
      navLinks.classList.remove("hide");
      navExpand.classList.add("hide");
    }
    if (window.innerWidth < 900) {
      navExpand.classList.remove("hide");
      navLinks.classList.add("hide");
    }
  };

  const handleResize = (e) => {
    if (window.innerWidth > 900) {
      navLinks.classList.remove("hide");
      navExpand.classList.add("hide");
    }
    if (window.innerWidth < 900) {
      navExpand.classList.remove("hide");
      navLinks.classList.add("hide");
    }
  };

  const handleClick = () => {
    overlay.classList.toggle("hide");
    navDropdown.classList.toggle("hide");
    navDropdown.classList.toggle("show");
  };

  window.addEventListener("resize", handleResize);
  navExpand.addEventListener("click", handleClick);
  overlay.addEventListener("click", handleClick);

  init();

  return { init };
})();

export default navbar;
