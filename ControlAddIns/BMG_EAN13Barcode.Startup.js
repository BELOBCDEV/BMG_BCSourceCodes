"use strict";

function BMG_start() {
    console.log('BMG_EAN13Barcode: BMG_start running');
    BMG_prepareContainer();
    try {
        Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('ControlAddInReady', [], false);
        console.log('BMG_EAN13Barcode: ControlAddInReady invoked');
    } catch (ex) {
        console.error('BMG_EAN13Barcode: InvokeExtensibilityMethod(ControlAddInReady) failed', ex);
    }
}

if (document.getElementById('controlAddIn')) {
    BMG_start();
} else {
    document.addEventListener('DOMContentLoaded', BMG_start);
}
