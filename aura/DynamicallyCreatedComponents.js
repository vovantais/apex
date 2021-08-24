({
    doInit: function(cmp) {
        $A.createComponent(
          "lightning:card",
          {
              "aura:id": "cardId",
              "title": "Hello world!"
          },

          function(newCard, status, err) {
              if (status === "SUCCESS") {
                  let data = cmp.get("v.data");
                  data.push(newCard);
                  cmp.set("v.data", data);
              } else if (status === "INCOMPLETE") {
                  console.log("No response");
              } else if (status === "ERROR") {
                  console.log("Error: " + err);
              }
          }
        );
    }
})
