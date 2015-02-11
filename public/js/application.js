$(document).ready(function() {
  console.log('Page Loaded')
  $('#tweet_form').submit(function(event) {
    console.log('Submitting');
    var tweet = $('#tweet_textarea').val();
    console.log(tweet)
    $.ajax({
      type: "post",
      url: "/tweet",
      data: { "tweet":""+tweet+"", "other":"This" },
      success: function(msg) {
        alert("Successfully tweeted: "+ tweet +"")
      },
    });
    $('#tweet_submit').prop('disabled', true);
    $('#tweet_textarea').prop('disabled', true);
    event.preventDefault();
  });
});