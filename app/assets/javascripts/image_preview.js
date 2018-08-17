function previewImage(input){
  var reader = new FileReader();

  reader.onload = function(){
    var imagePreview = document.querySelector('.imagePreview');
    imagePreview.src = reader.result;
  }

  reader.readAsDataURL(input.files[0]);
}

var inputFile = document.querySelector('.inputFile');
inputFile.addEventListener('change', function() {
  previewImage(inputFile);
});
