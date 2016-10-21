document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!
  const handleFavoriteSubmit = (e) => {
    e.preventDefault();

    const favoritePlace = document.querySelector(".favorite-input");
    const favorite = favoritePlace.value;
    favoritePlace.value = "";

    const newListItem = document.createElement("li");
    newListItem.textContent = favorite;

    const favoritesList = document.getElementById("sf-places");
    favoritesList.appendChild(newListItem);
  };

  const listSubmitButton = document.querySelector(".favorite-submit");
  listSubmitButton.addEventListener("click", handleFavoriteSubmit);


  // adding new photos

  // --- your code here!
  const showPhotoForm = (e) => {
      const photoForm = document.querySelector(".photo-form-container");
      if (photoForm.className === "photo-form-container") {
        photoForm.className = "photo-form-container hidden";
      } else {
        photoForm.className = "photo-form-container";
      }
    };

    const photoFormShowButton = document.querySelector(".photo-show-button");
    photoFormShowButton.addEventListener("click", showPhotoForm);


    const handlePhotoSubmit = (e) => {
      e.preventDefault();

      const photoUrlInput = document.querySelector(".photo-url-input");
      const photoUrl = photoUrlInput.value;
      photoUrlInput.value = "";

      const Img = document.createElement("img");
      Img.src = photoUrl;

      const newPhotoLi = document.createElement("li");
      newPhotoLi.appendChild(Img);

      const photoList = document.querySelector(".dog-photos");
      photoList.appendChild(newPhotoLi);
    };

    const photoSubmitButton = document.querySelector(".photo-url-submit");
    photoSubmitButton.addEventListener("click", handlePhotoSubmit);
  });
