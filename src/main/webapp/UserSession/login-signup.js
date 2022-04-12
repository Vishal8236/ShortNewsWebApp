/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
$(document).ready(function() {
    console.log('hello')
    $('#Signup').hide();
    $('#login-btn').hide();
    $('#login-btn').click(function(e) {
        e.preventDefault();
        $('#Signup').hide();
        $('#login').show(1000);
        $('#Signup-btn').show();
        $('#login-btn').hide();

    });
    $('#Signup-btn').click(function(e) {
        e.preventDefault();
        $('#login').hide();
        $('#Signup').show(1000);
        $('#login-btn').show();
        $('#Signup-btn').hide();


    });
});