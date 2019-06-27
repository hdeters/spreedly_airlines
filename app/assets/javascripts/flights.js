function openExpress(price_str, price, origin, destination, id) {
    var environmentKey= "JnWWxMySJUa1SLSo9nghX9idwqW"

    var options = {
    company_name: "Spreedly Airlines",
    sidebar_top_description: "Purchase flight",
    sidebar_bottom_description: `Flight number ${id} from ${origin} to ${destination}`,
    amount: price_str}

    SpreedlyExpress.init(environmentKey,options);

    SpreedlyExpress.openView();

    SpreedlyExpress.onPaymentMethod(function(token, paymentMethod) {
        var tokenField = document.getElementById("payment-method-token");
        tokenField.setAttribute("value", token);
        var priceField = document.getElementById("charge-price");
        priceField.setAttribute("value", price);
        var saveCardField = document.getElementById("save-card");
        saveCardField.setAttribute("value", document.getElementById("save_card_check").checked);
        var useExpediaField = document.getElementById("use-expedia");
        useExpediaField.setAttribute("value", document.getElementById("use_expedia_check").checked);
        var masterForm = document.getElementById("payment-form");
        masterForm.submit();
    });
}