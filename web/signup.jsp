<%--
  Created by IntelliJ IDEA.
  User: Serg
  Date: 15-Nov-15
  Time: 1:55 PM
  To change this template use File | Settings | File Templates.
--%>
<body class="align">
<link rel="stylesheet" type="text/css" href="styles/login.css">
<div class="site__container">

  <h1 align="center">
    <%
      session.setAttribute("message",null);
      if(session.getAttribute("busyusername")!=null){
        session.setAttribute("message","Oops! Someone already has that username...");
      }
      else if(session.getAttribute("busyemail")!=null){
        session.setAttribute("message","This Email already exist");
      }
      else if(session.getAttribute("message")==null){
        session.setAttribute("message","Sign up it's free :)");
      }
    %>

    ${message}
  </h1>

  <div class="grid__container">

    <form action="Registration" method="post" class="form form--login">

      <div class="form__field">
        <label class="fontawesome-user" for="login__username"><span class="hidden">Username</span></label>
        <input id="login__username" name="username" type="text" class="form__input" placeholder="Username" required>
      </div>

      <div class="form__field">
        <label class="fontawesome-lock" for="login__password"><span class="hidden">Password</span></label>
        <input id="login__password" name="password" type="password" class="form__input" placeholder="Password" required>
      </div>

      <div class="form__field">
        <label class="zocial-email" for="login__username"><span class="hidden">Username</span></label>
        <input id="login__username" name="email" type="text" class="form__input" placeholder="Email" required>
      </div>




      <div class="form__field">
        <input type="submit" value="Sign Up">
      </div>

    </form>

    <p class="text--center">Are you a member? <a href="login.jsp">Sign in now</a> <span class="fontawesome-arrow-right"></span></p>
    <p class="text--center">Or go back  <a href="home.jsp">Home</a> <span class="fontawesome-arrow-right"></span></p>
  </div>

</div>

</body>
