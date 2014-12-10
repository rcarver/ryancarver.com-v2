// Enable :active state in mobile safari.
// http://css-tricks.com/snippets/css/remove-gray-highlight-when-tapping-links-in-mobile-safari/
document.addEventListener("touchstart", function(){}, true);

// Hamburger menu interaction model.
(function() {
  var TRANSITION_DURATION = 400;

  var visible = true;
  var menuContainer = document.getElementById("rc-menu-container");
  var menuWindow = document.getElementById("rc-menu-window");
  var activeMenuButton = document.getElementById("rc-active-menu-button");
  var menuButton = document.getElementById("rc-menu-button");

  // Clicking anywhere on the page closes the menu.
  document.onclick = function (e) {
    hide();
  };  

  // Except for clicking on the menu, does not close the menu;
  menuWindow.onclick = function(e) {
    e.stopPropagation();
  }

  // Show the menu, first showing the container
  function show() {
    if (!visible) {
      visible = true;  
      menuWindow.classList.remove('rc-menu-hidden');
      menuButton.classList.add('rc-menu-active');
      activeMenuButton.classList.add('rc-menu-active');
    }
  }
  
  function hide() {
    if (visible) {
      visible = false;
      menuWindow.classList.add('rc-menu-hidden');
      menuButton.classList.remove('rc-menu-active');
      activeMenuButton.classList.remove('rc-menu-active');
    }
  }

  // Show control elements, which are hidden in the markup.
  menuButton.style.display = "block";
  menuContainer.style.display = "block";
  
  // Start with the menu hidden.
  hide();
  
  menuButton.onclick = activeMenuButton.onclick = function(e) {
    e.stopPropagation();
    e.preventDefault();
    if (visible) {
      hide();
    } else {
      show();
    }
  };
})();
