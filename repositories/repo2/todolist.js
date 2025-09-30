let todos = ["buy", "sell"]

localStorage.setItem("todos", JSON.stringify(todos));
const savedTodos = JSON.parse(localStorage.getItem("todos"));

console.log(savedTodos);