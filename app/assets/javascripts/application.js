
$(document).ready(function() {
  $("a#two_factor_phone").popover({
    trigger: 'hover',
    title: "Why do you need my phone number?",
    content: "We use your phone number for 2 factor authenticaiton. 2-factor authentication provides an extra layer of security when logging in to secure systems. If you provide a phone number here, you will receive a text message with a pin number to access your account. To skip 2 factor authenticaiton and login with just a username and password, leave this field blank. US numbers only."
  });
});
