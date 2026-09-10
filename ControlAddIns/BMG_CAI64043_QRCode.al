controladdin BMG_QRCode
{
    Scripts = 'ControlAddIns\qrcode.js', 'ControlAddIns\BMG_QRCode.js';
    StartupScript = 'ControlAddIns\BMG_QRCode.Startup.js';
    RequestedHeight = 150;
    RequestedWidth = 150;
    VerticalStretch = false;
    HorizontalStretch = false;

    event ControlAddInReady();

    procedure UpdateQRCode(Value: Text);
}
