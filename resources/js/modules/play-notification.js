const playSound = () => {
    console.log('Play Init');
    const audio = new Audio('/sound/tuk-tuk.mp3');
    audio.play().then(() => {
            //console.log('Play');
        })
        .catch(e => {
            console.log(e);
        });


}

window.playSound = playSound;

export default playSound;