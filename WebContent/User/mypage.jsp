<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp" %> 
<table border="0" class="body3">
    <tr>
        <td>
        	<form id="myinfoFrm" name="myinfoFrm" method="post" action="/Myinfo_modify.do"  onsubmit="return checkEmail()">
        	<table border="0" class="con1"> <!-- 이메일 변경 테이블 -->
                <tr>
                    <td class="contetns_title_td1">
                        <div class="div1"></div>
                        <div class="div2"></div>
                    </td>
                    <td class="contetns_title">
                        이메일 변경
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2">
                   		<div class="mypage_div"> 
                        	<div class="mypage_email_div">
                        		이메일 : &nbsp; <input type="text" class="mypage_textbox2"  value="<%try{out.print(user.getEmail());}catch(Exception e){}%>" id="email_text" name="email_text">
                        		 &nbsp; &nbsp;<input type="button" value="변경하기" class ="system_btn"
													id="email_btn" name="email_btn"	
                        		 					onclick="javascript:email_check();">
                        		 <input type="hidden" name="type" value="email">
                        	     <span id="msg1" ani_type="shake"></span>
                        	</div>
                    	</div>
                    </td>
                </tr>
            </table>
            </form>
            <form id="myinfoFrm2" name="myinfoFrm2" method="post" action="/Myinfo_modify.do" onsubmit="return checkPn()">
            <table border="0" class="con2"> <!-- 전화번호 변경 테이블 -->
            	<tr>
                    <td class="contetns_title_td1">
                        <div class="div1"></div>
                        <div class="div2"></div>
                    </td>
                    <td class="contetns_title">
                        전화번호 변경
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2">
                    	<div class="mypage_div">
                    		<div class="mypage_ph_div">
                        		전화번호 : &nbsp;<input type="text"class="mypage_textbox2" value="<%try{out.print(user.getPn());}catch(Exception e){}%>" id="pn_text" name="pn_text"> 
                        		&nbsp; <input type="submit" value="변경하기" class ="system_btn" id="pn_btn" name="pn_btn" onclick="javascript:pn_check();">
                        		<input type="hidden" name="type" value="pn">	
                        		<span id="msg1" ></span>
                        	</div>
                        </div>
                    </td>
                </tr>
            </table>
            </form>
            <form id="myinfoFrm3" name="myinfoFrm3" method="post" action="/Myinfo_modify.do" onsubmit="return checkPw()">
             <table border="0" class="con3"> <!-- 비밀번호 변경 테이블 -->
            	<tr>
                    <td class="contetns_title_td1">
                        <div class="div1"></div>
                        <div class="div2"></div>
                    </td>
                    <td class="contetns_title">
                        비밀번호 변경
                    </td>
                </tr>
                <tr>
                    <td align="center" style="border-top: none;" colspan="2">
                    	<div class="mypage_div"> 
                    		<div class="mypage_pw_div1">
                    			새 비밀번호 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    			<input type="password" class="mypage_textbox1" id="pw_text1" name="pw_text1">
                    			<span id="msg1" ></span>
                    		</div>
                    		<div class="mypage_pw_div2">
	                    		새 비밀번호 확인 : &nbsp;<input type="password" class="mypage_textbox1"  id="pw_text2" name="pw_text2" >
	                    		<span id="msg1" ></span> 
	                    		&nbsp; <input type="submit" value="변경하기" class ="system_btn" onclick="javascript:pw_check();">
	                    		<input type="hidden" name="type" value="pw">
                    		</div> 
                        </div>
                    </td>
                </tr>
            </table>
            </form>
            <form id="myinfoFrm4" name="myinfoFrm4" method="post" action="/Myinfo_modify.do" >
            <table border="0" class="con4"> <!-- 회원탈퇴 테이블 -->
                <tr>
                    <td class="contetns_title_td1">
                        <div class="div1"></div>
                        <div class="div2"></div>
                    </td>
                    <td class="contetns_title">
                        회원탈퇴
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2">
                    	<div class="mypage_div">
                    		 <div class="mypage_delete_div" ><input type="submit" value="탈퇴하기"  class ="system_btn" onclick="javascript:delete_check();"></div>
                        	 <input type="hidden" name="type" value="delete">
                        </div>
                    </td>
                </tr>
            </table> 
			</form>           
        </td>
    </tr>
</table>
<%@include file="/include/tail.jsp" %>

<script>	
var pn_text = document.getElementById("pn_text");
var pw_text1 = document.getElementById("pw_text1");
var email_text = document.getElementById("email_text");

	function pn_check()
	{
		if($("#pn_text").val() == "")
		{
			alert("변경할 전화번호를 입력하세요.");
			$("#pn_text").focus();
	    	$("#pn_text").val("");
			return false;
		} 
		if($("#pn_text").val() != /^\d{3}\d{3,4}\d{4}$/)
		{
			alert("옳바른 형식의 전화번호를 입력해주세요.");
			return false
		}
		alert("전화번호가 변경되었습니다.")
		return true;
	}
	function pw_check()
	{
		var password1RegExp = /^[a-zA-z0-9]{8,20}$/; //비밀번호 유효성 검사
		
		if (!pwdCheck.test(pw_text1.value)) 
		{
		    alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~20자리 사용해야 합니다.");
		    pw_text1.focus();
		    return false;
		};
	
		if($("#pw_text1").val() == "" || $("#pw_text2").val() == "")
		{
			alert("변경할 비밀번호를 입력하세요");
			$("#pw_text1").focus();
	    	$("#pw_text1").val("");
			return false;
		} 
		if($("#pw_text1").val() != $("#pw_text2").val())
		{
			alert("입력하신 비밀번호가 일치하지 않습니다.");
			return false;
		}
		
		alert("비밀번호가 변경되었습니다.")
		return true;	 		
	}
	function email_check()
	{
		var emailval = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if($("#email_text").val() == "" )
		{
			alert("변경할 이메일을 입력하세요"); 
			return false;			
		} 	
		if($("#email_text").val() != emailval )
		{
			alert("옳바른 이메일 형식을 입력해주세요"); 
			return false;
		}

		$.ajax({
		    url:"/MyinfoCheck.do", 
		    type:'post',
		    data:{'email_text': $("#email_text").val()}, 
		    success: function(data) 
		    {
		    	if(data == "true")
		    	{
		    		alert("중복된 이메일입니다.");
		    		$("#email_text").val("");
		    		$("#email_text").focus();
		    		return false;
		    	}
		    	else if(data == "false")
		    	{
		    		alert("이메일이 변경되었습니다."); 
		    		document.myinfoFrm.submit();
		    	}
		    }
		});
	} 
	function delete_check()
	{
	 alert("회원탈퇴 되었습니다.");
	}
</script>