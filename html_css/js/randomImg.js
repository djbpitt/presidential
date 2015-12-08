var random_image_array = ["gettysburgh_big.jpg", "1789_GW_Inaug1.jpg", "1865_AL_Inaug2.jpg", "1941_FDR_sotu.jpb", "civilrights.jpg", "independence.jpg"];

function randomImg() {
    var img = '<img src=\"';
    var randomIndex = Math.floor(Math.random() * random_image_array.length);
    img += random_image_array[randomIndex];
    img += '\" alt = "" width="100%" height="100%">';
    return img;
}