var node = document.getElementById('tree');
var app = Elm.Main.embed(node);

// Note: if your Elm module is named "MyThing.Root" you
// would call "Elm.MyThing.Root.embed(node)" instead.

// if elm app should be fullscreen this is also possible
//var app = Elm.RubicsCube.fullscreen();

app.ports.setSelectToDefault.subscribe(function(id) {
  // console.log(id);
  var element = document.getElementById(id);
  // console.log(element);
  element.value = "select new item";
});
