function appendToInput(val) {
    document.getElementById("input").value += val;
}

function clearInput() {
    document.getElementById("input").value = "";
}

function calculate() {
    const inputStr = document.getElementById("input").value;
    if (!inputStr) {
        return;
    }
    try {
        const result = eval(inputStr); // Be cautious with eval in production
        document.getElementById("input").value = result;
    } catch (e) {
        document.getElementById("input").value = "Error";
    }
}

window.appendToInput = appendToInput;
window.clearInput = clearInput;
window.calculate = calculate;
