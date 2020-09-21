const doseHeader = `<tr id="dose-header" style="line-height:50px">
  <th></th>
  <th style="text-align: center;">Selected ingredients</th>
  <th style="text-align: center;">Dose description</th>
</tr>`;

const initRemoveElement = () => {
  const removalLinks = document.querySelectorAll(".remove-element");
  removalLinks.forEach((element) => {
    element.addEventListener("click", (event) => {
      event.preventDefault();
      element.parentNode.parentNode.remove();
      if (document.querySelectorAll(".remove-element").length === 0) { document.querySelector(".selected-ingredients").innerHTML = ""; }
    });
  });
 
};

const initIncrementSelectedIngredients = () => {
  const ingredientSelector = document.querySelector(".ingredient-selector");
  ingredientSelector.addEventListener("change", (event) => {
    const selectedIngredients = document.querySelector(".selected-ingredients");
    // debugger
    // const selectedIngredient = `<tr class="selected-ingredient">
    //   <td>
    //     <a href="#" class="remove-element">
    //       <i class="far fa-trash-alt"></i>
    //     </a>
    //   </td>
    //   <td class="ingredient-name">
    //     ${event.target.value}
    //   </td>
    //   <td>
    //     <input type="text" id="${event.target.value}" name="description" style="width: 100%;">
    //   </td>
    // </tr>`;
    if (selectedIngredients.innerHTML === "") { selectedIngredients.insertAdjacentHTML("afterbegin", doseHeader); }
    const currentIngredients = [...selectedIngredients.querySelectorAll(".ingredient-name")].map(element => element.innerHTML.trim());
    if (!currentIngredients.includes(event.target.value)) {
      fetch("/doses/new");
      selectedIngredients.insertAdjacentHTML("beforeend", selectedIngredient(event));
      initRemoveElement();
    } else {
      alert("You have already select this ingredient")
    };
  });
};

export { initIncrementSelectedIngredients }
