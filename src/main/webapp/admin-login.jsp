<!DOCTYPE html>
<html lang="EN">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="assets/css/login.css" />
    <title>Login Now</title>
    <script>
      window.onload = function() {
        const message = '<%= session.getAttribute("message") != null ? session.getAttribute("message") : "" %>';
        if (message) {
          alert(message); 
          <% session.removeAttribute("message"); %>;
        }
      };
    </script>
  </head>
  <body>
    <div class="container">
      <div class="forms-container">
        <div class="signin-signup">
          <form action="/checklogin" method="post" class="sign-in-form">
            <h2 class="title">Login</h2>

            <div class="input-field">
              <i class="fas fa-envelope"></i>
              <input type="text" id="email" name="email" placeholder="Email" required />
            </div>
            <div class="input-field">
              <i class="fas fa-lock"></i>
              <input type="password" id="password" name="password" placeholder="Password" required />
            </div>
            <a href="#" class="href">Forgot Password?</a>

            <input type="submit" value="Log In" class="btn solid" id="login-button" /> 
          </form>
        </div>
      </div>

      <div class="panels-container">
        <div class="panel left-panel">
          <div class="content">
            <h3>Welcome Admin</h3>
            <p>Log in to access your admin dashboard.</p>
          </div>
          <img src="assets/images/register.svg" class="image" alt="Register" />
        </div>
        <div class="panel right-panel">
          <div class="content">
            <h3>Already have an account?</h3>
            <button class="btn transparent" id="sign-in-btn">Login Now</button>
          </div>
          <img src="assets/images/login.svg" class="image" alt="Login" />
        </div>
      </div>
    </div>
  </body>
</html>
