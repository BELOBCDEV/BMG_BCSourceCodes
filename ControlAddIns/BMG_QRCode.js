"use strict";

var BMG_QR_QUIET_ZONE = 4;
var BMG_QR_MAX_SIZE = 140;
var BMG_currentQRValue = null;

function BMG_buildQRMatrix(value) {
    var qr = qrcode(0, 'M');
    qr.addData(value);
    qr.make();
    return qr;
}

function BMG_qrModuleSize(moduleCount) {
    var totalModules = moduleCount + (BMG_QR_QUIET_ZONE * 2);
    return Math.max(1, Math.floor(BMG_QR_MAX_SIZE / totalModules));
}

function BMG_copyQRToClipboard(text) {
    if (!text) {
        return;
    }
    if (navigator.clipboard && navigator.clipboard.writeText) {
        navigator.clipboard.writeText(text).catch(function () {
            BMG_copyQRToClipboardFallback(text);
        });
    } else {
        BMG_copyQRToClipboardFallback(text);
    }
}

function BMG_copyQRToClipboardFallback(text) {
    var textarea = document.createElement('textarea');
    textarea.value = text;
    textarea.style.position = 'fixed';
    textarea.style.opacity = '0';
    document.body.appendChild(textarea);
    textarea.focus();
    textarea.select();
    try {
        document.execCommand('copy');
    } catch (ex) {
        console.error('BMG_QRCode: copy fallback failed', ex);
    }
    document.body.removeChild(textarea);
}

function BMG_showQRCopiedFeedback(container) {
    var toast = document.createElement('div');
    toast.textContent = 'Copied!';
    toast.style.position = 'absolute';
    toast.style.top = '2px';
    toast.style.right = '2px';
    toast.style.fontFamily = 'sans-serif';
    toast.style.fontSize = '11px';
    toast.style.color = '#ffffff';
    toast.style.backgroundColor = 'rgba(0,0,0,0.7)';
    toast.style.padding = '2px 6px';
    toast.style.borderRadius = '3px';
    toast.style.pointerEvents = 'none';
    container.appendChild(toast);
    setTimeout(function () {
        if (toast.parentNode) {
            toast.parentNode.removeChild(toast);
        }
    }, 1000);
}

function BMG_buildQRCanvas(value) {
    var qr;
    try {
        qr = BMG_buildQRMatrix(value);
    } catch (ex) {
        return null;
    }
    var moduleCount = qr.getModuleCount();
    var moduleSize = BMG_qrModuleSize(moduleCount);
    var size = (moduleCount + (BMG_QR_QUIET_ZONE * 2)) * moduleSize;

    var canvas = document.createElement('canvas');
    canvas.width = size;
    canvas.height = size;
    var ctx = canvas.getContext('2d');
    if (!ctx) {
        return null;
    }

    ctx.fillStyle = '#ffffff';
    ctx.fillRect(0, 0, size, size);

    ctx.fillStyle = '#000000';
    var row, col;
    for (row = 0; row < moduleCount; row++) {
        for (col = 0; col < moduleCount; col++) {
            if (qr.isDark(row, col)) {
                ctx.fillRect(
                    (col + BMG_QR_QUIET_ZONE) * moduleSize,
                    (row + BMG_QR_QUIET_ZONE) * moduleSize,
                    moduleSize,
                    moduleSize
                );
            }
        }
    }

    return canvas;
}

function BMG_onQRContainerContextMenu(ev) {
    ev.preventDefault();
    var value = BMG_currentQRValue;
    if (!value) {
        return;
    }
    var container = ev.currentTarget;

    if (navigator.clipboard && window.ClipboardItem) {
        var canvas = BMG_buildQRCanvas(value);
        if (canvas) {
            canvas.toBlob(function (blob) {
                if (!blob) {
                    BMG_copyQRToClipboard(value);
                    BMG_showQRCopiedFeedback(container);
                    return;
                }
                var item;
                try {
                    item = new ClipboardItem({
                        'image/png': blob,
                        'text/plain': new Blob([value], { type: 'text/plain' })
                    });
                } catch (ex) {
                    BMG_copyQRToClipboard(value);
                    BMG_showQRCopiedFeedback(container);
                    return;
                }
                navigator.clipboard.write([item]).then(function () {
                    BMG_showQRCopiedFeedback(container);
                }).catch(function (err) {
                    console.error('BMG_QRCode: image copy failed, falling back to text', err);
                    BMG_copyQRToClipboard(value);
                    BMG_showQRCopiedFeedback(container);
                });
            }, 'image/png');
            return;
        }
    }

    BMG_copyQRToClipboard(value);
    BMG_showQRCopiedFeedback(container);
}

function BMG_renderQRCode(value) {
    var container = document.getElementById('controlAddIn');
    if (!container) {
        return;
    }
    container.innerHTML = '';

    if (!value) {
        BMG_currentQRValue = null;
        return;
    }

    var qr;
    try {
        qr = BMG_buildQRMatrix(value);
    } catch (ex) {
        console.error('BMG_QRCode: failed to build QR code', ex);
        BMG_currentQRValue = null;
        var msg = document.createElement('div');
        msg.style.fontFamily = 'sans-serif';
        msg.style.fontSize = '12px';
        msg.style.color = '#888888';
        msg.textContent = 'Unable to render QR code';
        container.appendChild(msg);
        return;
    }

    BMG_currentQRValue = value;

    var moduleCount = qr.getModuleCount();
    var moduleSize = BMG_qrModuleSize(moduleCount);
    var size = (moduleCount + (BMG_QR_QUIET_ZONE * 2)) * moduleSize;

    var svgNS = 'http://www.w3.org/2000/svg';
    var svg = document.createElementNS(svgNS, 'svg');
    svg.setAttribute('width', size);
    svg.setAttribute('height', size);
    svg.setAttribute('viewBox', '0 0 ' + size + ' ' + size);

    var background = document.createElementNS(svgNS, 'rect');
    background.setAttribute('x', 0);
    background.setAttribute('y', 0);
    background.setAttribute('width', size);
    background.setAttribute('height', size);
    background.setAttribute('fill', '#ffffff');
    svg.appendChild(background);

    var row, col;
    for (row = 0; row < moduleCount; row++) {
        for (col = 0; col < moduleCount; col++) {
            if (qr.isDark(row, col)) {
                var moduleRect = document.createElementNS(svgNS, 'rect');
                moduleRect.setAttribute('x', (col + BMG_QR_QUIET_ZONE) * moduleSize);
                moduleRect.setAttribute('y', (row + BMG_QR_QUIET_ZONE) * moduleSize);
                moduleRect.setAttribute('width', moduleSize);
                moduleRect.setAttribute('height', moduleSize);
                moduleRect.setAttribute('fill', '#000000');
                svg.appendChild(moduleRect);
            }
        }
    }

    container.appendChild(svg);
}

function UpdateQRCode(value) {
    console.log('BMG_QRCode: UpdateQRCode called with value =', JSON.stringify(value));
    try {
        BMG_renderQRCode(value);
    } catch (ex) {
        console.error('BMG_QRCode: UpdateQRCode failed', ex);
    }
}

function BMG_QRPrepareContainer() {
    var container = document.getElementById('controlAddIn');
    if (!container) {
        console.error('BMG_QRCode: #controlAddIn element not found');
        return null;
    }
    container.style.display = 'flex';
    container.style.alignItems = 'center';
    container.style.justifyContent = 'center';
    container.style.position = 'relative';
    container.style.cursor = 'context-menu';
    container.title = 'Right-click to copy QR code';
    container.addEventListener('contextmenu', BMG_onQRContainerContextMenu);

    var placeholder = document.createElement('div');
    placeholder.style.fontFamily = 'sans-serif';
    placeholder.style.fontSize = '12px';
    placeholder.style.color = '#888888';
    placeholder.textContent = 'Waiting for value...';
    container.appendChild(placeholder);

    console.log('BMG_QRCode: #controlAddIn prepared');
    return container;
}
