/* svpms/assets/js/animations.js */

document.addEventListener('DOMContentLoaded', () => {
    // Initialize AOS
    if (typeof AOS !== 'undefined') {
        AOS.init({
            duration: 800,
            easing: 'ease-out-quad',
            once: true
        });
    }

    // Incremental Statistics Counter Animation
    const counterElements = document.querySelectorAll('.stat-value');
    counterElements.forEach(element => {
        const textVal = element.textContent;
        const targetNum = parseInt(textVal.replace(/[^0-9]/g, ''), 10);
        if (isNaN(targetNum)) return;
        
        let startNum = 0;
        const duration = 1500;
        const stepTime = Math.abs(Math.floor(duration / targetNum));
        const suffix = textVal.replace(/[0-9]/g, '');
        
        const timer = setInterval(() => {
            startNum += Math.ceil(targetNum / 40);
            if (startNum >= targetNum) {
                element.textContent = textVal; // restore original format (e.g. "99.9%" or "12k +")
                clearInterval(timer);
            } else {
                element.textContent = startNum + suffix;
            }
        }, Math.max(stepTime, 30));
    });
});
