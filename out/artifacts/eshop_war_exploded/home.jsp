<%--
  Created by IntelliJ IDEA.
  eshop.business.User: Serg
  Date: 12-Nov-15
  Time: 4:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="includes/header.html" />

<%@ page import="eshop.dbAccess.dbProduct" %>
<%@ page import="eshop.business.Product" %>
<%@ page import="java.util.ArrayList" %>
<link rel="stylesheet" type="text/css" href="styles/menu.css">
<link rel="stylesheet" type="text/css" href="styles/top_products.css">
<link rel="stylesheet" type="text/css" href="styles/footer.css">


<html>
<head>
    <title>My Webstore</title>
</head>
<body>
  <div class="bg">
    </div>

  <ul class="main-menu">
    <li class="main-menu-item active"><a>Home</a></li>
    <li class="main-menu-item"><a href="http://www.aua.am">About Us</a></li>
    <li class="main-menu-item"><a href="shoppingcart.jsp">Shopping cart</a></li>
    <% if(session.getAttribute("user")==null){%>
    <li class="main-menu-item"><a href="login.jsp">Sign in</a></li>
    <li class="main-menu-item"><a href="signup.jsp">Sign up</a></li>
    <%}else{%>
    <li class="main-menu-item"><a href="signout.jsp">Sign out</a></li>
    <%}%>
  </ul>
  <br>
  <br>


      <% ArrayList<Product> products= dbProduct.selectProducts(); %>

  <div>
    <h2 align="center">Best Sellers</h2>
  </div>


  <br>
  <br>
  <br>
 <table align="center" class="myproducts" >
   <tbody>
   <% for(Product p:products) {%>
    <tr>
        <td align="center"><img height="350px" width="300px" src="<%= p.getImageURL() %>"><br>
            <%= p.getName() %><br>Price:<%= p.getPrice() %>
        <br><form action="Showcart" method="post">
                <input hidden type="text" name="code" value="<%= p.getCode()%>">
                <input type="submit" value="Add to cart">
            </form></td>

    </tr>
    <%} %>
   </tbody>
 </table>




  <br>
  <br>
  <br>
  <br>
  <div id="footerblurb">
    <div id="footerblurb-inner">

      <div class="column">

      </div>
      <div class="column">
        <p>
          <img class="icon icons8-Visa" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAADDUlEQVRoQ+2ZjW3UQBSEJxVAKoBUAKkAqACoAFIBpAKgAqACoAKggkAFkAqACiAVJPrQzmm08UXBWcfG2pWiyHv78+bNvJ/z7WglY2clONSBLI3JzkhnZCIPdGlN5NjRx25j5KakJ5L4v6TxU9JnSX9qo4aA3JV0tEAQth0QDyR9TzA1kNuSvi0YRILZlwRDf0cN5H2RFJ+dSOL5HI0zaQ2ZP5V0o9z/VtLzbUC+SLpXPjwoQGaye/BagLwrn3yVdP8yQNAhwJY0MJz4PWd/La1kpAOZkMLOyGpihKKTKQ/VkC1qgI8k3YlsQsp+GM9enx0DhZfz+aNa53gWtexD1IsrSwswbyKH16n5hySKKWOvgH9Rng/LXoz4OFBsf8VettTGev/QZ5tk9S9ZC0MpkNQZPAgLDDxLN2C2MCQLq7Pf7wDBfphgLez5LM7IvTzDCI5sBoSDMBgPIiM8z4AppMAwU5nGdwtY5/90AnuQm7sHnAW7OQBMO9IUCAbeknRcvIQBlhUtjbvl03Kx55I19ryURItRD+aRJPtwkOVp5Vw5RnyhLwIQ2jVL/Hfvk17NNuJTJADW0/DBYCYOyw85sZ6YYliezYDkQY+Lxi0rpIZxuSb1jUE4gkbPjR9zyMbZ0X0Uc2abNZkwmrUoXIAhaJ1YgYHUPYa+Lp58VYxPCbEebztde40lmsFvtuyQZoxgkCXChY4J2GGekcFvSWRAs4YsZdngbRhJT9exA9Mw3hRIepwL6zqQGYvLAYz2MxbcfhPUJALAZwE1ENgjuTDq7MfcqDriwzMDMVfLJ+sFF9Ve9Dl15mO+jqlkDnYZzWKEwzZfaIos8ltkfgYLyAqD8G62JZYi8+4KkNDm62vZyx4G86xrCqTW8HU9N42R6zJ66J4OZDXfR1YB5L9+HZRVmZS6xBd07iYufEFHnqZdyKZuziy17W53BFtfmbKRAkRsLBUMIEjDF77EtgdcjQHlyjo3M35RQUdwqZ8V5jZ41P39p7dRbptwU2dkQueOOrozMsptE27qjEzo3FFHnwGdWeYzPB2EEAAAAABJRU5ErkJggg==" width="50" height="50"></p>

      </div>
      <div class="column">
        <p><img class="icon icons8-PayPal" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAADoUlEQVRoQ+2Yga1OQRCFz6sAFaACVIAKUAEqQAWoABWgAlSAClABKkAF5JO7ct7Yuzu7Gy/y8m/ykpf/7s7MmZkzM7tHOiXr6JTg0AHI/xbJQ0QOEflHHlhJrasLNr1fOFs9OgvkmqS3i8Z8kfRO0mNJ/L+0ZoE8kvRwSfPxw08lPViRNwvktaQbK4orZ19IujsrcxbIN0lnN6W3JAFsZHH2piQie94Okmb8NrxmgFyQ9Nk0XVzMcSJxe1XeDJA7kp5vir9KApgvPFqraBD65Ubw6HG+lcjAFTgztGaAoOTepuXNliKulGhFcP4dHhAFX+4cQOEMZH/PopkBQsksHo/ei2m3Z0dMx1o5BwROgzfdNQPkp0m9HlIFAr+ytMPTLAA6sSOpW30pVc1GgUSF8bynHXwoQADjveeZpPvmEJf7Y/v9jH2P+/+K0CgQlD/ZpHySdDlIbKUdkwAGs2JEHCTjC5GlpHvRiNE/pnoUiDfCmpc87a5I+rhpozh4JYoc+WBOcd65Y2KEl4B4RYrVJ6ZdaWx41yOHx0tkMCaecwc45yD/uT3Wj0SEbkxHLyt61dNuTx/piOFeVj3lIkjkeJQBUi3JI0DcOxCyjCjF6N78RV8ArE+6cfis8aBVJf84bASIK601QoyM4FCEB8n1wpeinOnAq9oeBxzI7jg0AsSJNz3cbVMzTnHe1FIOwOyhEJS1a+8IEJ94YwqQ970bI02RfXF82QOB8b1y30cY2Bo9E0nnjXCP6LXfe5H1Ktncm42ID3W9RpgBAh9Ir9YV13Uis3ldyALxO0ONlE5IgMYSicH8QXi41ptqST+4UYpHsxmCMgvEO29shGlCZkK1EZzBs3CJUo+O5gNFFsje6BEJWWtoSft/b2OUIeW8jKeu0hkgcTKNvcLTLs5f7L3UQcIedMCJKLt2CauKywCJk6nPSQhtpd3s+xdXaIDBp9TKAPHRo1YCW5139P0LPlDK+esVhGMAM0C8EQLKRw0IWcaMmfmLM8grr47IHwLQbfnbhuwdnO01ontDS5E2lUeVTb2IxKbU0hPTLjphdwSfNd7P9YBA1khuP+/vv9Hj8SGi9US0jKUHpKWgN3/1xv5l40ci0lI2Mn9NvR6OIF2JiDdC6n18fKYClQbXfAEZMXhv7woQb4Q9W1b09GT//j6rID5EtJTVxv6UcSObZoFA9OyLeS3tRmxM7Z0FkhJ+kpsOQE7S2xldh4hkvHSSe05NRH4B79PcM68iJVMAAAAASUVORK5CYII=" width="50" height="50"></p>

      </div>
      <div class="column">

          <img class="icon icons8-Mastercard" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAADv0lEQVRoQ+2ZTUiTcRzHv88zp01XRpQustRaUZphYKGipeVBWaWVUCjkMjsEBnYJD0EHPXjoxYNd8qKQYWU5zVDEyKkHK0JD6DRfQgNfIkyfOV+3+JuT6Taf5/8825SxXXbY7+3z+/3+L7//GHjJh/ESDvhAtlolfRXxVcRNGfC1lpsSK9qsw4qkZDVHmGHOE23VjYos2Op2XcbQehd2IMlZTUUswzx1YyySTZstlnudugvltobWgCRlvU+RMewnyZ48YGDJYk7t0l1st7paA3Lm8gcdA2R6IA7JLixAQ0e9JssZSDsDnJXsxRMGLBjS6zSRLgFRLwwgCEaQ71G/UHBMEL7LY3gxlP4cDoUMQbV9HP0TkTD8Xo2HV9dWQF+vWe2o9a3FWxGlmcNVUyMy5tqgMo85dNwpT8BbxSX0+p9Y/V29exB58a9weM8QVMHjdno9w9HoHTmO6s/XBMOIBkmfbUOhsRJKCyfIWXNAGp4F3UZ2YhO08a8F6RjGI1DWeldQlUSBZM/oUDhTKSgYq5CRCcTwlQM4enKQSo+bDUJFx020/Di3oR41CKlEMUd/tPxKDMO+YyvtF8lSwRDhghePN6wMFYhqcQy1k/nUQdgppMqA835Udkb/hqCg5hG4eaVDPSqQ4uknSJ/7SBXADKNAwP4FyNiltXq5ckBBd0+t69GgQn9LGgjZoZr+CN9FrN6+RMXhdE4fFfxGwinl76SBiF0bX7PjcCrWdSDO1org1tIaa6A1vXRZZpcNlQZQ2ytrLXS4gwkGKZ0qQdJ8N7XjDRVEgDhbJ24F6ZNHIeZhv0vhJYOIba3R+2FQ7ZhwGYzk1hK72J0SqBig0J8aUPJiF7v9Oo1UxKFIbEnefokRMQeikQ0Em8tCIZ9by7SX2ZwDkUQh9orSeSQRyTe+UbeRrYJhIhxFb0pcc0UhhsWsFY5RYilUhmDFFKBiAQ3dPcvll0ZrhsRc44muaZcCijtLVC3FzQWiQp/v+mu8Feb/YPUcSotRUMvUbctEVWAO3WA1EY4HjcUYnQ7l9SH4QHRkiexk2aYGpC+PuvYjK5nbu/zj0RKQZjfqahNqoSajroMzpneEjLrRqOq+zgtgFZAEYuuFPDqQsVe9OACD38Hln2zndGcRkccHdcjgMpBhfJMeHwSny/2CP/X1mgirG+98oPOaJ1NSJq94xLb228rfClowiAWw0/3tLsjDJCzoZcFWCfpbQZDJLShE96SxBQEc7lpbOE7e0HwV4U2RhwV8FfFwwnnd+SrCmyIPC/wDda2mQrfubh4AAAAASUVORK5CYII=" width="50" height="50">

      </div>
      <div>
        <p>
          <img class="icon icons8-Maestro" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAEG0lEQVRoQ+1YT2wUdRT+3iylNjtL99BIoodOL0DSRJcE9Ohu8OaBcuCkCfWiUUna3jyRNhpMjIYNyepR0HhCkoqReKDT1ViDuzUswQTUEmcPEBGQ0pm2Ors7j8yUbXfb2ZnZnd8G08xc5/f73ve97/fvPcI2+Wib6EAk5P/mZORI5EiXMhAtrS4ltmPYyJGOU9eliW07ony6qoCrgyCk1zkxaWBc1d6RS+3w1F8+kCaWBomhbGBZJWYqy/liW1iBhCinOImnjDEwjxJoI+gm1sy8CGAaUs+U9laf5ibKIW/RMQZGiCjZUjhDA3g6blWmKF+ycT0/XyFKTp8EeMwzqEsIZj4DMzGhTZBDgtOp5LLUcwpEo36kGv/byZFA2bhamPKa11KI48JOY5YIqXYCN5EAa2DpyK/nMmAJs+0mozkul+K1SqaVO65CHBG9+hWvZRRU3MDq/Tn126PD4UQ8jsbQ4pa5303MFiEinKiLlKyq/tHl96RkZSn+zMrfeHblr6D6Pca5O7NVSE7PEmFMQMQmiL0PFvCV+qYYWOYzslp8vRGsSYiSM1JEfEVEtIHVe3cU49buRqzXFs7j0O05EfBgsjKJS/P5OlizkE/0PAEvhY1EbC39cOEIJ6tGf1is1vM5L88UM1uE2BcdcfVPEYF3r9y98UHx5D43LHF7BYjVzKG+fMm5r9YdUXLGKBF/JkKIF0bm1hxOXz4hJgxbE7I6n90kRJ8mwmExEVqjJEwdP30zIiQMA18nZgoO2IYjgvaHDXrt/CEhRP1AmPn7hFp03nzrQoZySxqIBv0m+/3vrf378/z0Ky/6jRPyn6HJamGoK0KCEDx36Q3se3gzyFDvMYyyrBacR2xXlpYfQ1FLz3VpKTlxm/3HC4eX+ivGLj9BYf+7b3aBx++JXz4uHNUuvhCWqO981+NX4IXYV1m+N7z4x4Abkbevf46Dd6/6cgwywPVCtCcqAo9gNyKJioHvLr6KXVUjCE/PMY37o2mzO0IEPhr3PLj527vXcnsb2SRMQ8xpZVecXo/GNTHinvFfzBz/PbV4fU/o9G8B4LPyTLGpZHYvrHoN+xX8fFgCO2rm7ef+ufF0v6nveH/+QyFLyu7WxC0zvblKbFnq0k69JOKmj1mV5S9nj/Pw4oIcNjFglOOWmQpU6taDrdXtIZ1hLjOkEaf5EEOeQJ3XJy2cqPMN1A4i4nG0SYLBZ/FfYrypHRTryQJ0rB1nGPwQTNmEWpj0mucrxDkA1lpD4yCMeO4d2wFCHtQz2apBZ6QPphDDuNOg80oOo/y4QTcppEG3OQtOyxRVBVZDy5S4BJa0jlqmFinc0L2UCCWpZpbqlV9Q9wI5EhTsSY6LhDzJ7LvFjhyJHOlSBqKl1aXEdgwbOdJx6ro0cds48giLE8JCRAEqHwAAAABJRU5ErkJggg==" width="50" height="50">
      </div>

      <div class="clr"></div>
    </div>
  </div>

  <footer id="footer">

    <div id="footer-inner">
      <p>&copy; Copyright &#124; Sergey Yeranosyan  &#124;</p>
      <div class="clr"></div>
    </div>
  </footer>
</body>
</html>
