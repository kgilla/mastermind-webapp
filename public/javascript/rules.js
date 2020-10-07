const rules = (() => {
  const main = document.querySelector("#game-container");

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
    let rules = document.querySelector("#small-rules");
    if (window.innerWidth > 900) {
      rules ? null : renderRules();
    }
    if (window.innerWidth < 900) {
      rules ? rules.remove() : null;
    }
  };

  const renderRules = () => {
    let div = maker(
      "div",
      { id: "small-rules", class: "game-rules" },
      "",
      main
    );
    let header = maker("header", { class: "rules-header" }, "", div);
    maker("h2", { class: "rules-title" }, "Mastermind Rules", header);
    let list = maker("ul", { class: "rules-list" }, "", div);
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
    let rules = document.querySelector("#small-rules");
    if (main) {
      if (window.innerWidth > 900) {
        rules ? null : renderRules();
      }
      if (window.innerWidth < 900) {
        rules ? rules.remove() : null;
      }
    }
  };

  window.addEventListener("resize", handleResize);

  init();

  return {
    init,
  };
})();

export default rules;
