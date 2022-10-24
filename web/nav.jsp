<%-- 
    Document   : nav
    Created on : Mar 22, 2022, 1:55:33 PM
    Author     : nguye
--%>
<style>

    nav		{
        background-color:	#333;
        font-weight:		bold;
        text-align:		center;
        padding:		14px 16px;
        text-align: left;
        font-weight: bold;
        font-size: 25px;
        color: white;
        text-decoration: none;
    }

    nav ul	 	{
        list-style-type: none;
        margin: 0;
        padding: 0;
        overflow: hidden;
    }

    nav li	 	{
        display: inline;
        text-align: center;
        padding: 14px 16px;
    }

    a    		{
        text-decoration: none;
    }

    a:link 		{
        color: khaki;
    }

    a:visited 	{
        color: khaki;
    }

    a:hover 	{
        color: orange;
    }

</style>

<nav style="text-align: center;">
    <a href="Public?action=login"> Login </a>| <!--    target-->
    <a href="Public?action=home"> Registration </a>| <!--    index-->
    <a href="Private?action=profile"> Home </a>| 
    <a href="Private?action=getDoctorsAppointments"> Appointments </a>|
    <a href="Private?action=logout"> Logout </a>
</nav>
