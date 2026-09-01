controladdin BMG_EAN13Barcode
{
    Scripts = 'ControlAddIns\BMG_EAN13Barcode.js';
    StartupScript = 'ControlAddIns\BMG_EAN13Barcode.Startup.js';
    RequestedHeight = 90;
    RequestedWidth = 300;
    VerticalStretch = false;
    HorizontalStretch = false;


    event ControlAddInReady();

    procedure UpdateBarcode(BarcodeValue: Text);
}
