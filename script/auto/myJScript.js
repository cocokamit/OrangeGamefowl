function po_total(input, x) {
    var price = document.getElementById("contents_grid_item_txt_sprice_" + x).value.length == 0 ? 0 : document.getElementById("contents_grid_item_txt_sprice_" + x).value;
    var qty = document.getElementById("contents_grid_item_txt_adqty_" + x).value.length == 0 ? 0 : document.getElementById("contents_grid_item_txt_adqty_" + x).value;

    vva = input.value;
    vva = vva.split(",").join("");
    if (IfNumeric(vva) || price == 0 || qty == 0)
        document.getElementById("contents_grid_item_txt_total_" + x).value = price * qty;
    else
        input.value = vva.substring(0, vva.length - 1);
}
function intinput(elem) {
    var input = !(/^[0-9.]+$/).test(elem.value) ? elem.value = elem.value.replace(/[^0-9.]/ig, '') : null;
    input = elem.value.split(",").join("");
    elem.value = input.split(".").join("");
}
function decimalinput(elem) {

    var input = !(/^[0-9.]+$/).test(elem.value) ? elem.value = elem.value.replace(/[^0-9.]/ig, '') : null;
    input = elem.value.split(",").join("");
    if (!IfNumeric(input))
        elem.value = addCommas(input.substring(0, input.length - 1));
    else
        elem.value = addCommas(input);
}
function checkNumericInput_a(elem) {
    var input = !(/^[0-9.]+$/).test(elem.value) ? elem.value = elem.value.replace(/[^0-9.]/ig, '') : null;
    input= elem.value.split(",").join("");
    if (!IfNumeric(input))
        elem.value = addCommas(input.substring(0, input.length - 1));
    else
        elem.value = addCommas(input);
}

function checkNumericInput(elem) {
    vva = elem.value;
    vva = vva.split(",").join("");
    if (!IfNumeric(vva))
        elem.value = vva.substring(0, vva.length - 1);
  }

function addCommas(nStr) {

    nStr += '';
    x = nStr.split('.');
    x1 = x[0];
    x2 = x.length > 1 ? '.' + x[1] : '';
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(x1)) {
        x1 = x1.replace(rgx, '$1' + ',' + '$2');
    }
    return x1 + x2;
}

function IfNumeric(input) {
     return (input - 0) == input && (input + '').replace(/^\s+|\s+$/g, "").length > 0;
  }
function kita(elem) {
    document.getElementById(elem).style.display = "inline";
}

function addcompute() {

    var selID=document.getElementById("ddl_payrolltype");
    var text = selID.options[selID.selectedIndex].value;
    
    var taxid = document.getElementById("ddl_taxtable")
    var taxtext = taxid.options[taxid.selectedIndex].value;

    var fnodid = document.getElementById("txt_fnod");
    var fnod = fnodid.options[fnodid.selectedIndex].innerHTML;
   
    //var fnod = document.getElementById("txt_fnod").value.length == 0 ? 0 : document.getElementById("txt_fnod").value.replace(",", "");
   
    var fnoh = document.getElementById("txt_fnoh").value.length == 0 ? 0 : document.getElementById("txt_fnoh").value.replace(",", "");
    var mr = document.getElementById("txt_mr").value.length == 0 ? 0 : document.getElementById("txt_mr").value.replace(",", "");
    var dr = document.getElementById("txt_dr").value.length == 0 ? 0 : document.getElementById("txt_dr").value.replace(",", "");
    var hr = document.getElementById("txt_hr").value.length == 0 ? 0 : document.getElementById("txt_hr").value.replace(",", "");
    var minwage = document.getElementById("hdn_minimumwage").value;
    //alert(minwage)
    if (text == "1") {
        document.getElementById("txt_mr").setAttribute("onfocus", "");
        document.getElementById("txt_nti").setAttribute("onfocus", "");
        var payrolldivission = "";
        switch (taxtext) {
            case "Semi-Monthly":
                payrolldivission = "2";
                break;
            case "Monthly":
                payrolldivission = "1";
                break;
        }
        //var daymonth = (fnod) / 12;
        document.getElementById("txt_pr").value = (mr / payrolldivission);
        document.getElementById("txt_dr").value = (mr * 12 / fnod) >= minwage ? (mr * 12 / fnod) : minwage;
        document.getElementById("txt_hr").value =  (document.getElementById("txt_dr").value.replace(",", "") / document.getElementById("txt_fnoh").value.replace(",", ""));
        document.getElementById("txt_dr").setAttribute("onfocus", "this.blur()");
    }
    else if (text == "2") {

        document.getElementById("txt_dr").setAttribute("onfocus", "");
        document.getElementById("txt_mr").value = 0;
      
        document.getElementById("txt_pr").value = 0;
        document.getElementById("txt_mr").setAttribute("onfocus", "this.blur()");
      
        document.getElementById("txt_pr").setAttribute("onfocus", "this.blur()");
        document.getElementById("txt_nti").setAttribute("onfocus", "this.blur()");

        var dr = document.getElementById("txt_dr").value;
      
        document.getElementById("txt_hr").value = (document.getElementById("txt_dr").value.replace(",", "") / document.getElementById("txt_fnoh").value.replace(",", ""));
        document.getElementById("txt_nti").value = (document.getElementById("txt_meal_allow").value * fnod / 12);
        
    }

}
function get() {
  //  alert('test');
    if (document.getElementById('rb_range').checked == true || document.getElementById('rb_half').checked == true) {
        document.getElementById('grid_leave').outerHTML = "";
    }
}



//    if (document.getElementById('rb_range').checked == true) {
//        document.getElementById('range').style.display = "block";
//        document.getElementById('day').style.display = "none";
//     }
//    else if (document.getElementById('rb_half').checked)
//    {
//        document.getElementById('range').style.display = "none";
//        document.getElementById('day').style.display = "block";
//    }
//    else {
//        document.getElementById('range').style.display = "none";
//        document.getElementById('day').style.display = "none";
//    }


function get_no_of_hours_between_in_out() {


    alert("test");

    var timein = document.getElementById("txt_timein1").value;
    var timeout = document.getElementById("txt_timeout2").value;

    var timeStart = new Date("01/01/2007 " + timein).getHours();
    var timeStartmin = new Date("01/01/2007 " + timein).getMinutes();
    var timeEnd = new Date("01/01/2007 " + timeout).getHours();
    var timeEndmin = new Date("01/01/2007 " + timeout).getMinutes();

    timeStart = timeStart + "." + timeStartmin;
    timeEnd = timeEnd + "." + timeEndmin;
    var hourDiff = timeEnd - timeStart;
  //  alert(hourDiff);
    document.getElementById("txt_noh").value = hourDiff;
 
   // var getoutput = timeout - timein;
   // alert(getoutput);


}

