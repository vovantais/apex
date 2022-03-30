({
  fireEvent: function() {
    const myEvent = $A.get("e.c:myEvent");
    myEvent.setParams({"data":"It is work!"});
    myEvent.fire();
  }
})