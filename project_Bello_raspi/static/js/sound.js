document.querySelector('#ex-in').addEventListener('input',e=>{
    document.querySelector('#ex-out').innerHTML= e.target.value;
});