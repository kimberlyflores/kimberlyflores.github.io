<?php
$mailTo = 'kfloresgaynor@gmail.com';
$name = htmlspecialchars($_POST['idi_name']);
$mailFrom = htmlspecialchars($_POST['idi_mail']);
$subject = 'Contact from Kimberly Flores Gaynor. website';
$message_text = htmlspecialchars($_POST['idi_text']);
$message =  'From: '.$name.'; Email: '.$mailFrom.' ; Message: '.$message_text;
$headers .= 'From:' . $mailFrom . '\r\n';
mail($mailTo, $subject, $message, $headers);
?>