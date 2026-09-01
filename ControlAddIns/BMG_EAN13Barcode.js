"use strict";

var BMG_EAN13_L_CODES = ["0001101", "0011001", "0010011", "0111101", "0100011", "0110001", "0101111", "0111011", "0110111", "0001011"];
var BMG_EAN13_G_CODES = ["0100111", "0110011", "0011011", "0100001", "0011101", "0111001", "0000101", "0010001", "0001001", "0010111"];
var BMG_EAN13_R_CODES = ["1110010", "1100110", "1101100", "1000010", "1011100", "1001110", "1010000", "1000100", "1001000", "1110100"];
var BMG_EAN13_PARITY = ["LLLLLL", "LLGLGG", "LLGGLG", "LLGGGL", "LGLLGG", "LGGLLG", "LGGGLL", "LGLGLG", "LGLGGL", "LGGLGL"];

function BMG_ean13CheckDigit(digits12) {
    var sum = 0;
    var i;
    for (i = 0; i < 12; i++) {
        var d = parseInt(digits12.charAt(i), 10);
        sum += (i % 2 === 0) ? d : d * 3;
    }
    return (10 - (sum % 10)) % 10;
}

function BMG_normalizeToEan13(value) {
    if (!value) {
        return null;
    }
    var digits = value.replace(/\D/g, '');
    if (digits.length === 12) {
        digits += String(BMG_ean13CheckDigit(digits));
    } else if (digits.length === 13) {
        if (BMG_ean13CheckDigit(digits.substr(0, 12)) !== parseInt(digits.charAt(12), 10)) {
            return null;
        }
    } else {
        return null;
    }
    return digits;
}

function BMG_buildEan13Bars(digits13) {
    var parity = BMG_EAN13_PARITY[parseInt(digits13.charAt(0), 10)];
    var bars = "101";
    var i, d;
    for (i = 0; i < 6; i++) {
        d = parseInt(digits13.charAt(i + 1), 10);
        bars += (parity.charAt(i) === 'L') ? BMG_EAN13_L_CODES[d] : BMG_EAN13_G_CODES[d];
    }
    bars += "01010";
    for (i = 0; i < 6; i++) {
        d = parseInt(digits13.charAt(i + 7), 10);
        bars += BMG_EAN13_R_CODES[d];
    }
    bars += "101";
    return bars;
}

var BMG_currentBarcodeValue = null;
var BMG_BAR_WIDTH = 2;
var BMG_BAR_HEIGHT = 60;
var BMG_QUIET_ZONE = 10;
var BMG_TEXT_HEIGHT = 16;

function BMG_buildBarcodeCanvas(digits13) {
    var bars = BMG_buildEan13Bars(digits13);
    var width = (BMG_QUIET_ZONE * 2) + (bars.length * BMG_BAR_WIDTH);
    var height = BMG_BAR_HEIGHT + BMG_TEXT_HEIGHT;

    var canvas = document.createElement('canvas');
    canvas.width = width;
    canvas.height = height;
    var ctx = canvas.getContext('2d');
    if (!ctx) {
        return null;
    }

    ctx.fillStyle = '#ffffff';
    ctx.fillRect(0, 0, width, height);

    ctx.fillStyle = '#000000';
    var x = BMG_QUIET_ZONE;
    var i;
    for (i = 0; i < bars.length; i++) {
        if (bars.charAt(i) === '1') {
            ctx.fillRect(x, 0, BMG_BAR_WIDTH, BMG_BAR_HEIGHT);
        }
        x += BMG_BAR_WIDTH;
    }

    ctx.font = '12px monospace';
    ctx.textAlign = 'center';
    ctx.textBaseline = 'alphabetic';
    ctx.fillText(digits13, width / 2, height - 2);

    return canvas;
}

function BMG_copyToClipboard(text) {
    if (!text) {
        return;
    }
    if (navigator.clipboard && navigator.clipboard.writeText) {
        navigator.clipboard.writeText(text).catch(function () {
            BMG_copyToClipboardFallback(text);
        });
    } else {
        BMG_copyToClipboardFallback(text);
    }
}

function BMG_copyToClipboardFallback(text) {
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
        console.error('BMG_EAN13Barcode: copy fallback failed', ex);
    }
    document.body.removeChild(textarea);
}

function BMG_showCopiedFeedback(container) {
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

function BMG_onContainerContextMenu(ev) {
    ev.preventDefault();
    var value = BMG_currentBarcodeValue;
    if (!value) {
        return;
    }
    var container = ev.currentTarget;

    if (navigator.clipboard && window.ClipboardItem) {
        var canvas = BMG_buildBarcodeCanvas(value);
        if (canvas) {
            canvas.toBlob(function (blob) {
                if (!blob) {
                    BMG_copyToClipboard(value);
                    BMG_showCopiedFeedback(container);
                    return;
                }
                var item;
                try {
                    item = new ClipboardItem({
                        'image/png': blob,
                        'text/plain': new Blob([value], { type: 'text/plain' })
                    });
                } catch (ex) {
                    BMG_copyToClipboard(value);
                    BMG_showCopiedFeedback(container);
                    return;
                }
                navigator.clipboard.write([item]).then(function () {
                    BMG_showCopiedFeedback(container);
                }).catch(function (err) {
                    console.error('BMG_EAN13Barcode: image copy failed, falling back to text', err);
                    BMG_copyToClipboard(value);
                    BMG_showCopiedFeedback(container);
                });
            }, 'image/png');
            return;
        }
    }

    BMG_copyToClipboard(value);
    BMG_showCopiedFeedback(container);
}

function BMG_renderBarcode(value) {
    var container = document.getElementById('controlAddIn');
    if (!container) {
        return;
    }
    container.innerHTML = '';

    var digits13 = BMG_normalizeToEan13(value);
    BMG_currentBarcodeValue = digits13;
    if (!digits13) {
        var msg = document.createElement('div');
        msg.style.fontFamily = 'sans-serif';
        msg.style.fontSize = '12px';
        msg.style.color = '#888888';
        msg.textContent = value ? 'Not a valid EAN-13 barcode' : '';
        container.appendChild(msg);
        return;
    }

    var bars = BMG_buildEan13Bars(digits13);
    var barWidth = BMG_BAR_WIDTH;
    var barHeight = BMG_BAR_HEIGHT;
    var quietZone = BMG_QUIET_ZONE;
    var textHeight = BMG_TEXT_HEIGHT;
    var width = (quietZone * 2) + (bars.length * barWidth);
    var height = barHeight + textHeight;

    var svgNS = 'http://www.w3.org/2000/svg';
    var svg = document.createElementNS(svgNS, 'svg');
    svg.setAttribute('width', width);
    svg.setAttribute('height', height);
    svg.setAttribute('viewBox', '0 0 ' + width + ' ' + height);

    var background = document.createElementNS(svgNS, 'rect');
    background.setAttribute('x', 0);
    background.setAttribute('y', 0);
    background.setAttribute('width', width);
    background.setAttribute('height', height);
    background.setAttribute('fill', '#ffffff');
    svg.appendChild(background);

    var x = quietZone;
    var i;
    for (i = 0; i < bars.length; i++) {
        if (bars.charAt(i) === '1') {
            var bar = document.createElementNS(svgNS, 'rect');
            bar.setAttribute('x', x);
            bar.setAttribute('y', 0);
            bar.setAttribute('width', barWidth);
            bar.setAttribute('height', barHeight);
            bar.setAttribute('fill', '#000000');
            svg.appendChild(bar);
        }
        x += barWidth;
    }

    var text = document.createElementNS(svgNS, 'text');
    text.setAttribute('x', width / 2);
    text.setAttribute('y', height - 2);
    text.setAttribute('text-anchor', 'middle');
    text.setAttribute('font-family', 'monospace');
    text.setAttribute('font-size', '12');
    text.setAttribute('letter-spacing', '2');
    text.textContent = digits13;
    svg.appendChild(text);

    container.appendChild(svg);
}

function UpdateBarcode(value) {
    console.log('BMG_EAN13Barcode: UpdateBarcode called with value =', JSON.stringify(value));
    try {
        BMG_renderBarcode(value);
    } catch (ex) {
        console.error('BMG_EAN13Barcode: UpdateBarcode failed', ex);
    }
}

function BMG_prepareContainer() {
    var container = document.getElementById('controlAddIn');
    if (!container) {
        console.error('BMG_EAN13Barcode: #controlAddIn element not found');
        return null;
    }
    container.style.display = 'flex';
    container.style.alignItems = 'center';
    container.style.justifyContent = 'flex-start';
    container.style.position = 'relative';
    container.style.cursor = 'context-menu';
    container.title = 'Right-click to copy barcode value';
    container.addEventListener('contextmenu', BMG_onContainerContextMenu);

    var placeholder = document.createElement('div');
    placeholder.style.fontFamily = 'sans-serif';
    placeholder.style.fontSize = '12px';
    placeholder.style.color = '#888888';
    placeholder.textContent = 'Waiting for barcode value...';
    container.appendChild(placeholder);

    console.log('BMG_EAN13Barcode: #controlAddIn prepared');
    return container;
}
