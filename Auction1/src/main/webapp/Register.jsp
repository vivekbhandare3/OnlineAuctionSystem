<!DOCTYPE html>
<html>
<head>
 <jsp:include page="header.jsp" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Register</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
   
</head>
<body>
    <div class="register-container">
        <h2>Register</h2>
        <form action="register" method="post"> 
            <div class="input-box">
                <label for="name">Name</label>
                <input type="text" name="name" placeholder="Enter Your Name" required>
            </div>
            <div class="input-box">
                <label for="email">Email</label>
                <input type="email" name="email" placeholder="Enter Your Email" required>
            </div>
            <div class="input-box">
                <label for="password">Create Password</label>
                <input type="password" name="password" placeholder="Create A Unique Password" required>
            </div>
            <div class="input-box">
                <label for="birth">Birth Date</label>
                <input type="date" name="birth" required onfocus="this.showPicker()">
            </div>

            <div class="input-box">
                <label for="address">Address</label>
                <input type="text" name="address" placeholder="Enter your address" required>
            </div>

            <div class="input-box">
                <label for="mobile">Mobile No</label>
                <div class="mobile-input">
                    <select id="country-code" name="country-code" required>
                        <option value="+91">IN +91</option>
                        <option value="+1">US +1</option>
                        <option value="+44">GB +44</option>
                        <option value="+61">AU +61</option>
                        <option value="+81">JP +81</option>
                        <option value="+49">DE +49</option>
                        <option value="+33">FR +33</option>
                        <option value="+971">AE +971</option>
                        <option value="+86">CN +86</option>
                        <option value="+7">RU +7</option>
                    </select>
                    <input type="tel" pattern="[0-9]{10}" maxlength="10" placeholder="Enter Mobile No" required name="mobile">
                </div>
            </div>
            <button type="submit" class="submit-btn">Register</button>
        </form>
    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>
