// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener('DOMContentLoaded', function() {
    const concealBoardButton = document.getElementById('conceal-board-btn');
    const boardCells = document.querySelectorAll('.board-cell');
  
    concealBoardButton.addEventListener('click', function() {
      boardCells.forEach(cell => {
        cell.classList.add('concealed'); 
      });
    });
  
    boardCells.forEach(cell => {
      cell.addEventListener('mouseenter', function() {
        if (cell.classList.contains('concealed')) {
          cell.classList.remove('concealed');
          cell.classList.add('revealed');
        }
      });
  
      cell.addEventListener('mouseleave', function() {
        if (!cell.classList.contains('revealed')) {
          cell.classList.add('concealed');
        }
      });
    });
  });
  