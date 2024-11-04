
    function IdGatewayJSInterface(clientId,idempotencyId,token,mobile) {

         openGatewayLaunch(clientId,idempotencyId,token,mobile);
    }

    function openGatewayLaunch(clientId,idempotencyId,token,mobile){
     var onSubmitCallback = (response) => {
            console.log("onsubmit "+response);

           window.postMessage(JSON.stringify(response));
        };

        var onErrorCallback = (response) => {
        console.log("onError"+response);
        window.postMessage(JSON.stringify(response));

        };

        var equalClient = new EqualSDK({
                "client_id": clientId,
                "idempotency_id": idempotencyId,
                "token": token,
                "mobile": mobile
            });
            equalClient.openGateway(onSubmitCallback,onErrorCallback);
    }

