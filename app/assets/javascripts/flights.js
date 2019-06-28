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

function useSavedCard(token) {
    var price = document.getElementById("price-tag").value
    var tokenField = document.getElementById("payment-method-token");
    tokenField.setAttribute("value", token);
    var priceField = document.getElementById("charge-price");
    priceField.setAttribute("value", price);
    var saveCardField = document.getElementById("save-card");
    saveCardField.setAttribute("value", "false");
    var useExpediaField = document.getElementById("use-expedia");
    useExpediaField.setAttribute("value", "false");
    var masterForm = document.getElementById("payment-form");
    masterForm.submit();
}

$(document).ready(function() {
    $('#cardsModal').on('shown.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var price = button.data('price') // Extract info from data-* attributes
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        var modal = $(this)
        modal.find('.modal-body span').val(price)
    })
})