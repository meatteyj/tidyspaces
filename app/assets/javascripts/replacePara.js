<script>
  function replacePara() {
  var myDiv = document.getElementById("div2");
  var newH2 = document.createElement("h2");
  var para = document.getElementById("para1");
  var h2Text = document.createTextNode("Welcome!");
  newH2.appendChild(h2Text);
  myDiv.replaceChild(newH2, para);
}

</script>
