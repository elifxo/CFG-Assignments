
const addTask = document.getElementById("add-task");
const contentContainer = document.getElementById("content-container");
const textInput = document.getElementById("text-input");

addTask.addEventListener('click', function(){
    let task = document.createElement("div")
    task.classList.add("task")

    let li = document.createElement("li")
    li.innerText = `${textInput.value}`;
    task.appendChild(li)

    let checkButton = document.createElement("button")
    checkButton.innerHTML = '<i class="fa-solid fa-check"></i>'
    checkButton.classList.add("checkTask")
    task.appendChild(checkButton);

    let deleteButton = document.createElement("button")
    deleteButton.innerHTML = '<i class="fa fa-trash-can"></i>'
    deleteButton.classList.add("deleteTask")
    task.appendChild(deleteButton)

    if (textInput.value === "") {
        alert("You must write something!");
    } else {
        contentContainer.appendChild(task);
    }

    textInput.value = "";

    checkButton.addEventListener('click', function(){
        checkButton.parentElement.style.textDecoration =
        "line-through";
    })

    deleteButton.addEventListener('click', function(e){
        let target = e.target;
        target.parentElement.remove();
    })
    

});   
