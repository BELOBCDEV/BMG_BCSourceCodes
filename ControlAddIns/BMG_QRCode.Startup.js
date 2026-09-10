"use strict";

function BMG_QRStart() {
    console.log('BMG_QRCode: BMG_QRStart running');
    BMG_QRPrepareContainer();
    try {
        Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('ControlAddInReady', [], false);
        console.log('BMG_QRCode: ControlAddInReady invoked');
    } catch (ex) {
        console.error('BMG_QRCode: InvokeExtensibilityMethod(ControlAddInReady) failed', ex);
    }
}

if (document.getElementById('controlAddIn')) {
    BMG_QRStart();
} else {
    document.addEventListener('DOMContentLoaded', BMG_QRStart);
}
