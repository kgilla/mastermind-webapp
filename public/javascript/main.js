const navDropdown = document.querySelector("#nav-dropdown");
const navExpand = document.querySelector("#nav-expand");
const navLinks = document.querySelector("#nav-links");
const overlay = document.querySelector("#overlay");
const userColors = document.querySelectorAll(".user-color");
const main = document.querySelector("#main");

const maker = (type, attributes, text, place) => {
  let element = document.createElement(type);
  Object.keys(attributes).forEach((key) => {
    element.setAttribute(key, attributes[key]);
  });
  element.textContent = text;
  place.appendChild(element);
  return element;
};

const init = () => {
  let rules = document.querySelector("#game_rules");
  if (window.innerWidth > 900) {
    rules ? null : renderRules();
    navLinks.classList.remove("hide");
    navExpand.classList.add("hide");
  }
  if (window.innerWidth < 900) {
    rules ? rules.remove() : null;
    navExpand.classList.remove("hide");
    navLinks.classList.add("hide");
  }
};

const renderRules = () => {
  let div = maker("div", { id: "game_rules" }, "", main);
  maker("h2", { id: "rules-title" }, "Mastermind Rules", div);
  let list = maker("ul", { id: "rules-list" }, "", div);
  maker(
    "li",
    { class: "rule" },
    "Each round the player must guess 4 colors",
    list
  );
  maker(
    "li",
    { class: "rule" },
    "The pegs on the right give feedback based on your guess",
    list
  );
  maker(
    "li",
    { class: "rule" },
    "A red peg is a correct color in the correct position",
    list
  );
  maker(
    "li",
    { class: "rule" },
    "A white pegs is a correct color in an incorrect position",
    list
  );
  maker("li", { class: "rule" }, "There can be duplicate colors", list);
  maker("li", { class: "rule" }, "Have fun!", list);
};

const handleResize = (e) => {
  let rules = document.querySelector("#game_rules");

  if (window.innerWidth > 900) {
    rules ? null : renderRules();
    navLinks.classList.remove("hide");
    navExpand.classList.add("hide");
  }
  if (window.innerWidth < 900) {
    rules ? rules.remove() : null;
    navExpand.classList.remove("hide");
    navLinks.classList.add("hide");
  }
};

const handleClick = () => {
  overlay.classList.toggle("hide");
  navDropdown.classList.toggle("hide");
  navDropdown.classList.toggle("show");
};

const handleInputChange = (e) => {
  e.target.style.background = e.target.value;
};

userColors.forEach((color) => (color.style.background = color.value));

userColors.forEach((color) =>
  color.addEventListener("input", handleInputChange)
);
window.addEventListener("resize", handleResize);
navExpand.addEventListener("click", handleClick);
overlay.addEventListener("click", handleClick);

init();
