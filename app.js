# Boilerplate here
import React from 'react';
import ReactDOM from 'react-dom';

// Main App Component
const App = () => {
  return (
    <div className="App">
      <h1>Welcome to React!</h1>
      <p>This is your boilerplate app.js file.</p>
    </div>
  );
};

// Render the App Component
ReactDOM.render(<App />, document.getElementById('root'));

export default App;
