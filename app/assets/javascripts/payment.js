
$(document).ready(function(){

  $(document).on('click', '.game_players :checkbox', function(){
    calculatePerPlayer();
  })

  $(document).on('change', '#game_amount', function(){
    calculatePerPlayer();
  })

  $(document).on('change', '#game_goals', function(){
    calculatePerGoal();
  })
})

function calculatePerPlayer(){
  var total_amount = $('#game_amount').val();

  if(!total_amount.length){
    return 0;
  }

  var per_persion = total_amount / $('.game_players :checkbox:checked').length
 
  $('#amount_per_player').text(per_persion.toFixed(2));
}

function calculatePerGoal(){
  var goals = $('#game_goals').val();

  if(!goals.length){
    return 0;
  }

  var total_amount = $('#game_amount').val();

  if(!total_amount.length){
    return 0;
  }

  var per_goal= total_amount / goals;
 
  $('#amount_per_goal').text(per_goal.toFixed(2));
}
