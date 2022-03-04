({
    init : function (component) {

        const action = component.get("c.getAccountId");

        action.setCallback(this, (response) => {
            const state = response.getState();
            if (state === "SUCCESS") {

                component.set("v.accountId", response.getReturnValue());

                const flow = component.find("flowData");

                const inputVariables = [
                    {
                        name : "accountId", // name of variable
                        type : "String", // type of data in flow
                        value : component.get("v.accountId") // the same
                    }
                ];
                flow.startFlow("varableToFlowAura", inputVariables);
            }
            else if (state === "ERROR") {
                const error = response.getError();
                console.log("Failed to get accountId " + error);
            }
        });
        $A.enqueueAction(action);
    }
})