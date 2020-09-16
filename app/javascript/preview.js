const preview = () => {
  const preview_image = document.getElementById("preview-image")
  const item_image = document.getElementById('item-image');

  const createImageHTML = (blob) =>{
    const imageElement = document.createElement("div");
    const blobImage = document.createElement("img");

    blobImage.setAttribute('src', blob);
    blobImage.setAttribute('class', "preview-img");
    blobImage.setAttribute('id', "preview-img");
    imageElement.appendChild(blobImage);
    preview_image.appendChild(imageElement);
  };

  item_image.addEventListener("change",(e) => {
    const item_img = document.getElementById("preview-img")
   
    if (item_img){
      item_img.remove()
    }

    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file)
    createImageHTML(blob)
});
 

};

if (document.URL.match( '/items/new' )){
document.addEventListener("DOMContentLoaded",preview)};
